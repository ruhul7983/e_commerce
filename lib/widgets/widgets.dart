import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
//for showing categories icon
Widget Categories(image,String text){
    return Container(
      height: mq.height * 0.16,
      width: mq.width * 0.25,
      // color: redColor,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                )
              ],
            ),
            height: mq.height * 0.09,
            width: mq.width * 0.16,
            child: Image.asset(image,color: Colors.red,),
          ),
          SizedBox(height: mq.height * 0.02,),
          Text(text,textAlign: TextAlign.center),
        ],
      ),
    );
}


//for card showing in display product page
Widget CardinProductDisplay(String specification,String SubText){
  return
    Card(
      elevation: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(specification,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Text(SubText),
            ],
          ),
          // SizedBox(width: mq.width * 0.23,),
          Icon(CupertinoIcons.arrow_right_circle)
        ],
      ),
    );
}

