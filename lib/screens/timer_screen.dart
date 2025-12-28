import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int seconds = 60;
  Timer? timer;

  void startTimer() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
        timer = null;
      } else {
        setState(() => seconds--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          seconds.toString(),
          style: const TextStyle(fontSize: 48),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: startTimer,
          child: const Text("Start"),
        ),
        ElevatedButton(
          onPressed: () => setState(() => seconds = 60),
          child: const Text("Reset"),
        ),
      ],
    );
  }
}
