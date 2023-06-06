import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/service/apis.dart';
import 'package:e_mart/views/auth_screen/login.dart';
import 'package:e_mart/views/thankYou.dart';
import 'package:e_mart/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class BuyNow extends StatefulWidget {
  final String Images;
  final String MobileName;
  final String Storage;
  final String Ram;
  final String Price;
  final String DocId;
  const BuyNow({Key? key, required this.Images, required this.MobileName, required this.Storage, required this.Ram, required this.Price, required this.DocId}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  String?selectPayment ;

  bool isLogin = true;
  static const String KEYLOGIN = 'lgoin';
  Future<void> wheretoGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedin = sharedPref.getBool(KEYLOGIN);
    setState(() {
      isLogin = isLoggedin ?? false;
    });
  }
  @override
  void initState() {
    wheretoGo();
    super.initState();
  }

  Future<void> setLoginStatus(bool value) async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(KEYLOGIN, value);
    setState(() {
      isLogin = value;
    });
  }
  var address;
  var phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Checkout",style: TextStyle(fontSize: 20),),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_rounded,color: Colors.black,)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 8,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delivery Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              isLogin?StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: apis.getAddress(),
                builder: (context, snapshot) {
                  final documents = snapshot.data!.docs;
                  final documentData = documents.first.data();//here is an issue
                   address = documentData['address'];
                   phone = documentData['phone'];
                  return Container(
                    height: mq.height * 0.1,
                    width: mq.width * 0.9,
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.location_on_sharp),
                        Expanded(child: Text(address,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  );
                }
              ):InkWell(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (_)=>Login()));
                },
                child: Container(
                  height: mq.height * 0.1,
                  width: mq.width * 0.9,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login),
                      Text("Login First",style: TextStyle(fontSize: 18),maxLines: 1,),
                      Icon(Icons.person),
                    ],
                  ),
                ),
              ),
              Text("Payment methods",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.9,
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(value: "Bkash", groupValue: selectPayment, onChanged: (val){
                      setState(() {
                        selectPayment = val;
                      });
                    }),
                    Text("Pay with bKash",style: TextStyle(fontSize: 18)),
                    Image.asset(icBkash,height: mq.height * 0.06,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.9,
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(value: "CashOnDelivery", groupValue: selectPayment, onChanged: (val){
                      setState(() {
                        selectPayment = val;
                      });
                    }),
                    Text("Cash on Delivery",style: TextStyle(fontSize: 18)),
                    Image.asset(icCOD,height: mq.height * 0.06,color: Colors.red,),
                  ],
                ),
              ),
              Text("Product Details:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              Container(
                height: mq.height * 0.2,
                width: mq.width * 0.9,
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Container(
                      height: mq.height * 0.13,
                      width: mq.width * 0.3,
                      child: CachedNetworkImage(
                        imageUrl: widget.Images,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.MobileName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),maxLines: 1,),
                          SizedBox(height: mq.height * 0.01,),
                          Text("৳ ${widget.Price}",style: TextStyle(fontSize: 19),),
                          Text("Qty: 1"),//need to modify
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black,height: 1),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Standard Delivery",style: TextStyle(fontSize: 20,color: Colors.deepPurpleAccent),),
                  Text("৳ 55",style: TextStyle(fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: mq.height * 0.09,
        child: GestureDetector(
            onTap: () async {
              if(selectPayment=="Bkash"){
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>Login()));//need to upgrade next time in payment bkash page
              }
              else{
                await apis.setOrder(
                    widget.Images, widget.MobileName, widget.Price, widget.DocId,
                    selectPayment.toString(),address,phone).then((value) =>Navigator.push(context, CupertinoPageRoute(builder: (_)=>ThankYou())));
              }
            },
            child: cButton("Place order")),
      ),
    );
  }
}
