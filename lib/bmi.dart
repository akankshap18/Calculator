import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key, required this.title});
  final String title;

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w500,
                ),
                ),

                SizedBox(height: 30,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (In Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (In cms)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (In inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20,),

                ElevatedButton(onPressed: (){
                  var wt =wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if(wt!="" && ft!="" && inch!="") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25) {
                      msg = "You're OverWeight!!!";
                      bgColor = Colors.orange.shade200;
                    } else if (bmi<18){
                      msg = "You're UnderWeight!!!";
                      bgColor = Colors.red.shade200;
                    } else {
                      msg = "You're Healthy!!!";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(4)}";
                    });

                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!";
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox(height: 15,),

                Text(result, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

