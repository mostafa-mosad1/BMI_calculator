import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmiResult extends StatelessWidget {
  late final int age;
  late final int result;
  late final bool gender;

  bmiResult({
    required this.age,
    required this.result,
    required this.gender,

});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("BMI_Result",style: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold),),),
      body: Container(color: Colors.cyan[200],
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Gender : ${gender ?"male":"female"}",style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
                Container(height: 2,width: 200,color: Colors.redAccent,),
                SizedBox(height: 5,),
            Text("Result : $result",style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Container(height: 2,width: 200,color: Colors.redAccent,),
              SizedBox(height: 5,),
            Text("AGE : $age",style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),)],),
        ),
      )
      ,));
  }
}
