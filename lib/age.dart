import 'dart:async';

import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({super.key, required this.title});
  final String title;

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age>{
  String myAge = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Age is', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(myAge),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => pickDob(),
              child: const Text('Pick Your Date of Birth'),
            )
          ],
        ),
      ),
    );
  }
  pickDob() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    setState(() {
      myAge = '$years years, $months months and $days days';
    });
  }
}
