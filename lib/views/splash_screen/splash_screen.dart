import 'dart:async';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/views/bottomNavScreen/bottomNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/views/auth_screen/SignUp.dart';
import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>BottomNav()));
    }

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(icAppLogo),
                )),
            SizedBox(height: mq.height * 0.03,),
            Text(appname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: mq.height * 0.01,),
            Text(appversion),
          ],
        ),
      ),
    );
  }
}
