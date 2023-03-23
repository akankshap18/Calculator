import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Let's Calculate", style: TextStyle(color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {Navigator.pushNamed(context, 'bmi');},
                    child: Text("BMI Calculator")),
                SizedBox(height: 10,),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    onPressed: () {Navigator.pushNamed(context, 'calculator');},
                      child: Text("Simple Calculator")),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {Navigator.pushNamed(context, 'age');},
                    child: Text("Age Calculator")),
              ],
            ),
        ),
      ),
    );
  }
}
