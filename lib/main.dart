import 'package:calculator/age.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/home.dart';
import 'package:calculator/bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => Home(title: 'Calculator',),
      'bmi': (context) => BMI(title: 'BMI Calculator',),
      'calculator': (context) => Calculator(title: 'Simple Calculator',),
      'age': (context) => Age(title: 'Age Calculator',)
    },
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'home',
//       routes: {
//         'home': (context) => Home(title: 'Calculator',),
//         'bmi': (context) => BMI(title: 'BMI Calculator',)
//       },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Calculator'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var wtController = TextEditingController();
//   var ftController = TextEditingController();
//   var inController = TextEditingController();
//   var result = "";
//   var bgColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         color: bgColor,
//         child: Center(
//           child: Container(
//             width: 300,
//             child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.green.shade600,
//             shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10))),
//             onPressed: () {
//             Navigator.pushNamed(context, 'home');
//             },
//             child: Text("Send the code")),
//           ),
//         ),
//       ),
//     );
//   }
// }
