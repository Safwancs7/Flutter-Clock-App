import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String get time {
    final seconds = stopwatch.elapsed.inSeconds;
    final minutes = seconds ~/ 60;
    return "${minutes.toString().padLeft(2, '0')}:"
           "${(seconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(time, style: const TextStyle(fontSize: 48)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: stopwatch.start,
              child: const Text("Start"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: stopwatch.stop,
              child: const Text("Stop"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                stopwatch.reset();
                setState(() {});
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ],
    );
  }
}
