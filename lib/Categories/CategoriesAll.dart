
import 'package:e_mart/Categories/AppleGadget.dart';
import 'package:e_mart/Categories/PreOwnedDevice.dart';
import 'package:e_mart/Categories/SmartPhone.dart';
import 'package:e_mart/Categories/SmartWatch.dart';
import 'package:e_mart/Categories/TWS.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/widgets.dart';

class CategoriesAll extends StatefulWidget {
  const CategoriesAll({Key? key}) : super(key: key);

  @override
  State<CategoriesAll> createState() => _CategoriesAllState();
}

class _CategoriesAllState extends State<CategoriesAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.arrow_left,color: Colors.black,)),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Categories",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mq.height *0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Smart Phone",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: mq.height *0.01,),
            Divider(
              height: 1,
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(height: mq.height * 0.02,),
            Wrap(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>SmartPhone()));
                    },
                    child: Categories(icSmartPhone,"Smart\nPhone")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>PreOwnedDevice()));
                    },
                    child: Categories(icSmartPhone2,"Pre-Owned\nDevices")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>AppleGadget()));
                    },
                    child: Categories(icApple,"Apple\nGadget")),
              ],
            ),
            SizedBox(height: mq.height *0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Accessories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: mq.height *0.01,),
            Divider(
              height: 1,
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(height: mq.height * 0.02,),
            Wrap(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>SmartWatch()));
                    },
                    child: Categories(icSmartWatch,"Smart watch")),
                InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>TWS()));
                  },
                    child: Categories(icAirpods,"TWS")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
