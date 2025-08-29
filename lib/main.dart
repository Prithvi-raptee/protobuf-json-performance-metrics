import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:collection';

import 'src/generated/ev_data.pb.dart';


class IsolateMessage {
  final String type;
  final dynamic payload;
  IsolateMessage(this.type, this.payload);
}

class ClientIsolateArgs {
  final SendPort mainSendPort;
  final String testType; // 'JSON' or 'PROTOBUF'
  ClientIsolateArgs(this.mainSendPort, this.testType);
}

// --- Main Application ---

void main() {
  runApp(const EvPerformanceApp());
}

class EvPerformanceApp extends StatelessWidget {
  const EvPerformanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protobuf vs JSON Benchmark',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: const BenchmarkPage(),
    );
  }
}

class BenchmarkPage extends StatefulWidget {
  const BenchmarkPage({super.key});

  @override
  _BenchmarkPageState createState() => _BenchmarkPageState();
}

class _BenchmarkPageState extends State<BenchmarkPage> {
  // State variables for UI
  bool _isServerRunning = false;
  bool _isTestRunning = false;
  String _serverLog = 'Server is stopped.';
  String _clientLog = 'Client is idle.';
  BenchmarkStats? _jsonStats;
  BenchmarkStats? _protobufStats;

  // Isolate management
  Isolate? _serverIsolate;
  Isolate? _clientIsolate;
  final _mainReceivePort = ReceivePort();
  SendPort? _serverSendPort;

  @override
  void initState() {
    super.initState();
    // Listen for messages from all background isolates
    _mainReceivePort.listen((message) {
      if (message is SendPort) {
        // The server isolate sends its SendPort when it starts
        _serverSendPort = message;
        setState(() {
          _isServerRunning = true;
          _serverLog = 'Server running on localhost:8081';
        });
      } else if (message is IsolateMessage) {
        // Handle messages containing logs or stats
        if (mounted) {
          setState(() {
            switch (message.type) {
              case 'SERVER_LOG':
                _serverLog += '\n${message.payload}';
                break;
              case 'CLIENT_LOG':
                _clientLog += '\n${message.payload}';
                break;
              case 'STATS_RESULT':
                _isTestRunning = false;
                final stats = message.payload as BenchmarkStats;
                if (stats.type == 'JSON') {
                  _jsonStats = stats;
                } else {
                  _protobufStats = stats;
                }
                break;
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _stopServer();
    _mainReceivePort.close();
    super.dispose();
  }

  void _startServer() async {
    if (_isServerRunning) return;
    setState(() {
      _serverLog = 'Starting server...';
    });
    _serverIsolate = await Isolate.spawn(
      serverIsolate,
      _mainReceivePort.sendPort,
    );
  }

  void _stopServer() {
    if (!_isServerRunning) return;
    _serverIsolate?.kill(priority: Isolate.immediate);
    _serverIsolate = null;
    setState(() {
      _isServerRunning = false;
      _serverLog += '\nServer stopped.';
    });
  }

  void _runTest(String type) async {
    if (!_isServerRunning) {
      _logClient('Server is not running!');
      return;
    }
    if (_isTestRunning) return;

    setState(() {
      _isTestRunning = true;
      _clientLog = 'Starting $type test...';
      if (type == 'JSON') _jsonStats = null;
      if (type == 'PROTOBUF') _protobufStats = null;
    });

    final args = ClientIsolateArgs(_mainReceivePort.sendPort, type);
    _clientIsolate = await Isolate.spawn(clientIsolate, args);
  }

  void _logClient(String message) {
    if (mounted) {
      setState(() {
        _clientLog += '\n$message';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // UI build methods are the same as before
    return Scaffold(
      appBar: AppBar(title: const Text('Protobuf vs JSON Benchmark')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildServerControl(),
            const SizedBox(height: 20),
            _buildTestControl(),
            const SizedBox(height: 20),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogBox(String title, String logContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            border: Border.all(color: Colors.grey[700]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            reverse: true,
            child: Text(
              logContent,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServerControl() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Server Control',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(_isServerRunning ? Icons.stop : Icons.play_arrow),
                  onPressed: _isServerRunning ? _stopServer : _startServer,
                  label: Text(
                    _isServerRunning ? 'Stop Server' : 'Start Server',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isServerRunning
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.circle,
                  color: _isServerRunning ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(_isServerRunning ? 'Running' : 'Stopped'),
              ],
            ),
            const SizedBox(height: 16),
            _buildLogBox('Server Log:', _serverLog),
          ],
        ),
      ),
    );
  }

  Widget _buildTestControl() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Client Control',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _isTestRunning || !_isServerRunning
                      ? null
                      : () => _runTest('JSON'),
                  child: const Text('Run JSON Test (10s)'),
                ),
                ElevatedButton(
                  onPressed: _isTestRunning || !_isServerRunning
                      ? null
                      : () => _runTest('PROTOBUF'),
                  child: const Text('Run Protobuf Test (10s)'),
                ),
              ],
            ),
            if (_isTestRunning) ...[
              const SizedBox(height: 16),
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 8),
              const Center(child: Text("Test in progress...")),
            ],
            const SizedBox(height: 16),
            _buildLogBox('Client Log:', _clientLog),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        if (_jsonStats != null || _protobufStats != null)
          const Text(
            'Benchmark Results',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildStatsCard('JSON', _jsonStats, Colors.orangeAccent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatsCard(
                'Protobuf',
                _protobufStats,
                Colors.tealAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCard(
    String title,
    BenchmarkStats? stats,
    Color accentColor,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: accentColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
            const Divider(),
            if (stats == null)
              const Center(
                child: Text(
                  'Run test to see stats.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            if (stats != null) ...[
              _buildStatRow('Total Messages:', stats.count.toString()),
              _buildStatRow(
                'Avg. Size:',
                '${stats.avgSize.toStringAsFixed(2)} bytes',
              ),
              _buildStatRow(
                'Avg. RTT:',
                '${stats.avgRoundTripTime.toStringAsFixed(2)} µs',
              ),
              _buildStatRow(
                'Avg. Serialize:',
                '${stats.avgSerializationTime.toStringAsFixed(2)} µs',
              ),
              _buildStatRow(
                'Avg. Deserialize:',
                '${stats.avgDeserializationTime.toStringAsFixed(2)} µs',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// --- Server Isolate ---
// This function runs in a separate thread to handle TCP server logic.

void serverIsolate(SendPort mainSendPort) async {
  final serverReceivePort = ReceivePort();
  mainSendPort.send(serverReceivePort.sendPort);

  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 8081);

  await for (var socket in server) {
    mainSendPort.send(
      IsolateMessage(
        'SERVER_LOG',
        'Client connected from ${socket.remoteAddress.address}',
      ),
    );
    socket.listen(
      (Uint8List data) {
        // Simple echo server logic
        socket.add(data);
      },
      onDone: () {
        mainSendPort.send(IsolateMessage('SERVER_LOG', 'Client disconnected.'));
      },
      onError: (error) {
        mainSendPort.send(IsolateMessage('SERVER_LOG', 'Error: $error'));
      },
    );
  }
}

// --- Client Isolate ---
// This function runs in a separate thread to handle the benchmark test.

void clientIsolate(ClientIsolateArgs args) async {
  final mainSendPort = args.mainSendPort;
  final testType = args.testType;

  final stats = BenchmarkStats(type: testType);
  final stopwatch = Stopwatch()..start();
  Socket? socket;

  try {
    socket = await Socket.connect(InternetAddress.loopbackIPv4, 8081);
    mainSendPort.send(IsolateMessage('CLIENT_LOG', 'Connected to server.'));

    final sendTimeQueue = Queue<int>();
    var messageBuffer = BytesBuilder();

    // Single listener to handle all incoming data
    socket.listen(
      (Uint8List data) {
        messageBuffer.add(data);
        var allBytes = messageBuffer.toBytes();

        // TCP Framing: Loop to process all complete messages in the buffer
        while (allBytes.length >= 4) {
          final length = ByteData.view(
            allBytes.buffer,
          ).getUint32(0, Endian.little);
          if (allBytes.length >= length + 4) {
            final message = allBytes.sublist(4, length + 4);

            // A message has been successfully received and framed
            if (sendTimeQueue.isNotEmpty) {
              final clientSendTime = sendTimeQueue.removeFirst();
              stats.addRoundTripTime(
                DateTime.now().microsecondsSinceEpoch - clientSendTime,
              );

              final deserWatch = Stopwatch()..start();
              if (testType == 'JSON') {
                jsonDecode(utf8.decode(message));
              } else {
                BackendDataPacket.fromBuffer(message);
              }
              deserWatch.stop();
              stats.addDeserializationTime(deserWatch.elapsedMicroseconds);
            }

            // Remove the processed message from the buffer
            allBytes = allBytes.sublist(length + 4);
          } else {
            break; // Not enough data for a full message, wait for more
          }
        }

        // Update the buffer with any remaining partial data
        messageBuffer = BytesBuilder()..add(allBytes);
      },
      onDone: () => mainSendPort.send(
        IsolateMessage('CLIENT_LOG', 'Disconnected from server.'),
      ),
      onError: (e) =>
          mainSendPort.send(IsolateMessage('CLIENT_LOG', 'Socket error: $e')),
    );

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (stopwatch.elapsed.inSeconds >= 10) {
        timer.cancel();
        socket?.close();
        stats.calculateAverages();
        mainSendPort.send(IsolateMessage('STATS_RESULT', stats));
        return;
      }

      final data = _generateEvData();
      Uint8List bytesToSend;

      if (testType == 'JSON') {
        final jsonMap = _evDataToJson(data);
        final serWatch = Stopwatch()..start();
        final jsonData = jsonEncode(jsonMap);
        serWatch.stop();
        stats.addSerializationTime(serWatch.elapsedMicroseconds);
        bytesToSend = utf8.encode(jsonData);
      } else {
        // PROTOBUF
        final serWatch = Stopwatch()..start();
        bytesToSend = data.writeToBuffer();
        serWatch.stop();
        stats.addSerializationTime(serWatch.elapsedMicroseconds);
      }

      stats.addSize(bytesToSend.length);

      // TCP Framing: Prepend message with its length (4-byte little-endian)
      final length = bytesToSend.length;
      final lengthBytes = ByteData(4)..setUint32(0, length, Endian.little);

      // Add send time to queue just before sending
      sendTimeQueue.add(DateTime.now().microsecondsSinceEpoch);

      socket?.add(lengthBytes.buffer.asUint8List());
      socket?.add(bytesToSend);
    });
  } catch (e) {
    mainSendPort.send(IsolateMessage('CLIENT_LOG', 'Error connecting: $e'));
    mainSendPort.send(
      IsolateMessage('STATS_RESULT', stats),
    ); // Send empty stats
  }
}

// --- Data Generation and Serialization Logic ---

BackendDataPacket _generateEvData() {
  final random = Random();
  return BackendDataPacket(
    battery: 85.5 + random.nextDouble() * 2 - 1,
    throttle: random.nextDouble() * 100,
    speed: random.nextDouble() * 120,
    dpad: random.nextInt(5),
    killSwitch: random.nextInt(2),
    lightBeam: random.nextInt(2),
    indicators: random.nextInt(3),
    sideStand: random.nextInt(2),
    absIndication: random.nextInt(2),
    modeStatus: random.nextInt(4),
    motorStatus: random.nextInt(2),
    pduState: random.nextInt(2),
    chargingState: random.nextInt(3),
    eslState: random.nextInt(2),
    brakeStatus: random.nextInt(2),
    batteryTemp: 25.0 + random.nextDouble() * 10 - 5,
    chargingCurrent: random.nextDouble() * 15,
    chargingVoltage: random.nextDouble() * 5,
    gpsLat: 13.0827 + random.nextDouble() * 0.1,
    gpsLng: 80.2707 + random.nextDouble() * 0.1,
    acc: Vector3(
      x: random.nextDouble(),
      y: random.nextDouble(),
      z: 9.8 + random.nextDouble() * 0.5,
    ),
    gyro: Vector3(
      x: random.nextDouble(),
      y: random.nextDouble(),
      z: random.nextDouble(),
    ),
    odometer: 12345.6 + random.nextDouble() * 100,
    tripA: 123.4 + random.nextDouble() * 10,
    regenLevel: random.nextInt(4),
    whpkm: 150 + random.nextDouble() * 20,
    motorTemp: 45 + random.nextInt(20),
    chargingModeAC: random.nextInt(2),
    batteryVoltage: 400.0 + random.nextDouble() * 20 - 10,
    motorTorque: random.nextInt(100),
    alerts: [if (random.nextBool()) random.nextInt(10)],
    errors: [if (random.nextBool()) random.nextInt(20)],
    pressureFW: 32.0 + random.nextDouble() * 2,
    pressureRW: 32.0 + random.nextDouble() * 2,
    tempFW: 30.0 + random.nextDouble() * 5,
    tempRW: 30.0 + random.nextDouble() * 5,
    batteryFW: 3.0 + random.nextDouble() * 0.2,
    batteryRW: 3.0 + random.nextDouble() * 0.2,
  );
}

Map<String, dynamic> _evDataToJson(BackendDataPacket data) {
  return {
    'battery_soc': data.battery,
    'throttle': data.throttle,
    'speed': data.speed,
    'dpad': data.dpad,
    'killsw': data.killSwitch,
    'highbeam': data.lightBeam,
    'indicators': data.indicators,
    'sidestand': data.sideStand,
    'abs_warning': data.absIndication,
    'drivemode': data.modeStatus,
    'motor_status': data.motorStatus,
    'pdu_state': data.pduState,
    'charging_state': data.chargingState,
    'esl_state': data.eslState,
    'brake_status': data.brakeStatus,
    'battery_temp': data.batteryTemp,
    'charging_current': data.chargingCurrent,
    'charging_voltage': data.chargingVoltage,
    'gps_latitude': data.gpsLat,
    'gps_longitude': data.gpsLng,
    'acc': {'x': data.acc.x, 'y': data.acc.y, 'z': data.acc.z},
    'gyro': {'x': data.gyro.x, 'y': data.gyro.y, 'z': data.gyro.z},
    'odometer': data.odometer,
    'trip_a': data.tripA,
    'regen_level': data.regenLevel,
    'whp_km': data.whpkm,
    'motor_temp': data.motorTemp,
    'charging_mode_ac': data.chargingModeAC,
    'battery_voltage': data.batteryVoltage,
    'motor_torque': data.motorTorque,
    'alerts': data.alerts,
    'errors': data.errors,
    'fw_pressure': data.pressureFW,
    'rw_pressure': data.pressureRW,
    'fw_temp': data.tempFW,
    'rw_temp': data.tempRW,
    'fw_battery': data.batteryFW,
    'rw_battery': data.batteryRW,
  };
}

// --- Stats Class ---
class BenchmarkStats {
  final String type;
  final List<int> _sizes = [];
  final List<int> _roundTripTimes = [];
  final List<int> _serializationTimes = [];
  final List<int> _deserializationTimes = [];

  BenchmarkStats({required this.type});

  int get count => _sizes.length;
  double avgSize = 0;
  double avgRoundTripTime = 0;
  double avgSerializationTime = 0;
  double avgDeserializationTime = 0;

  void addSize(int bytes) => _sizes.add(bytes);
  void addRoundTripTime(int microseconds) => _roundTripTimes.add(microseconds);
  void addSerializationTime(int microseconds) =>
      _serializationTimes.add(microseconds);
  void addDeserializationTime(int microseconds) =>
      _deserializationTimes.add(microseconds);

  void calculateAverages() {
    if (_sizes.isNotEmpty)
      avgSize = _sizes.reduce((a, b) => a + b) / _sizes.length;
    if (_roundTripTimes.isNotEmpty)
      avgRoundTripTime =
          _roundTripTimes.reduce((a, b) => a + b) / _roundTripTimes.length;
    if (_serializationTimes.isNotEmpty)
      avgSerializationTime =
          _serializationTimes.reduce((a, b) => a + b) /
          _serializationTimes.length;
    if (_deserializationTimes.isNotEmpty)
      avgDeserializationTime =
          _deserializationTimes.reduce((a, b) => a + b) /
          _deserializationTimes.length;

    print('--- $type Benchmark Results ---');
    print('Total Messages: $count');
    print('Avg. Size: ${avgSize.toStringAsFixed(2)} bytes');
    print('Avg. Round-Trip Time: ${avgRoundTripTime.toStringAsFixed(2)} µs');
    print(
      'Avg. Serialization Time: ${avgSerializationTime.toStringAsFixed(2)} µs',
    );
    print(
      'Avg. Deserialization Time: ${avgDeserializationTime.toStringAsFixed(2)} µs',
    );
    print('------------------------\n');
  }
}
