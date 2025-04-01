// import 'package:flutter/material.dart';
// import 'dart:async';

// class TimerScreen extends StatefulWidget {
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }

// class _TimerScreenState extends State<TimerScreen> {
//   int _seconds = 1500; // 25 minutes
//   Timer? _timer;
//   bool _isRunning = false;

//   void _startTimer() {
//     if (_timer == null || !_timer!.isActive) {
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (_seconds > 0) {
//           setState(() {
//             _seconds--;
//           });
//         } else {
//           timer.cancel();
//           _isRunning = false;
//         }
//       });

//       setState(() {
//         _isRunning = true;
//       });
//     }
//   }

//   void _pauseTimer() {
//     _timer?.cancel();
//     setState(() {
//       _isRunning = false;
//     });
//   }

//   void _resetTimer() {
//     _timer?.cancel();
//     setState(() {
//       _seconds = 1500;
//       _isRunning = false;
//     });
//   }

//   String _formatTime(int seconds) {
//     int minutes = seconds ~/ 60;
//     int secs = seconds % 60;
//     return "$minutes:${secs.toString().padLeft(2, '0')}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Focus Timer")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_formatTime(_seconds), style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(onPressed: _isRunning ? _pauseTimer : _startTimer, child: Text(_isRunning ? "Pause" : "Start")),
//                 const SizedBox(width: 10),
//                 ElevatedButton(onPressed: _resetTimer, child: const Text("Reset")),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  List<int> presetTimes = [5, 10, 15, 25, 45]; // Timer options in minutes
  int customMinutes = 1; // Default for custom timer
  int remainingSeconds = 0;
  Timer? timer;
  bool isRunning = false;
  bool showCongrats = false;

  void startTimer(int minutes) {
    setState(() {
      remainingSeconds = minutes * 60;
      isRunning = true;
      showCongrats = false;
    });

    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();
        setState(() {
          isRunning = false;
          showCongrats = true;
        });
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      showCongrats = false;
    });
  }

  String formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return "${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade200, Colors.grey.shade100], // Sage to Cream
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isRunning ? formatTime(remainingSeconds) : "Select a Timer",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.brown[800]),
            ),
            SizedBox(height: 20),

            // Preset Timer Buttons
            Wrap(
              spacing: 10,
              children: presetTimes.map((time) {
                return ElevatedButton(
                  onPressed: isRunning ? null : () => startTimer(time),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("$time min"),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Custom Timer Input
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Custom: ", style: TextStyle(fontSize: 18, color: Colors.brown[800])),
                SizedBox(width: 5),
                Container(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Min",
                    ),
                    onChanged: (value) {
                      customMinutes = int.tryParse(value) ?? 1;
                    },
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isRunning ? null : () => startTimer(customMinutes),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Start"),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Stop Timer Button
            if (isRunning)
              ElevatedButton(
                onPressed: stopTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                ),
                child: Text("Stop Timer"),
              ),

            // Congratulations Message
            if (showCongrats)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "🎉 Congratulations! Time's up! 🎉",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade900),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
