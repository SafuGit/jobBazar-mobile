import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String? userName;
  final int? jobLength;
  const HeadingText({super.key, this.userName, this.jobLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Welcome, $userName", style: const TextStyle(
          fontSize: 30,
        ),)),
        const Center(child: Text("Here are some Jobs", style: TextStyle(
          color: Color.fromARGB(255, 15, 82, 226),
          fontSize: 24
        ),)),

        Text("$jobLength Jobs found", style: const TextStyle(
          fontSize: 20,
        )),]);
  }
}