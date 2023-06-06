import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Text("Thank You\nfor Your Order",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center,),
      ),
    );
  }
}
