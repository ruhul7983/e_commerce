import 'package:e_mart/consts/colors.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: mq.height * 0.1,),
          TextFormField(
            style: TextStyle(color: redColor),
            decoration: InputDecoration(hintText: "Enter a Email",label: Text("Email")),
          ),
          Row(
            children: [
              Container(
                height: 48,
                width: 41,
                decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(

                  decoration: InputDecoration(
                    hintText: "thed9954@gmail.com",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF414041),
                    ),
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: redColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
