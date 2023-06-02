import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/images.dart';
import 'package:e_mart/service/apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../bottomNavScreen/bottomNav.dart';
import 'otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static String  verify = '';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController countryController = TextEditingController();
  var phone = '';
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+880";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgLoginScreen,
                height: mq.height * 0.2,
                width: mq.width * 0.5,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text("We need your phone number for verification"),
              SizedBox(height: mq.height*0.02,),
              Container(
                height: mq.height  * 0.07,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mq.width * 0.1,
                    ),
                    SizedBox(
                      width: mq.width *0.1,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: mq.width * 0.01,
                    ),
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: mq.height*0.03,),

              SizedBox(
                height: mq.height * 0.06,
                width: mq.width * 0.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      return await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countryController.text+phone}',
                        verificationCompleted: (PhoneAuthCredential credential) {

                        },
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Login.verify = verificationId;

                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>Otp()));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: Text(
                      "Send the code",
                      style: TextStyle(color: Colors.black,fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
