import 'package:e_mart/service/apis.dart';
import 'package:e_mart/views/bottomNavScreen/cart.dart';
import 'package:e_mart/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../main.dart';
import 'BuyNow.dart';
import 'bottomNavScreen/profile.dart';

class ProductDisplay extends StatefulWidget {
  final String Images;
  final String MobileName;
  final String StockUpdate;
  final String Storage;
  final String Ram;
  final String PrevPrice;
  final String Price;
  final String Display;
  final String Size;
  final String Resolution;
  final String Processor;
  final String MainCamera;
  final String FrontCamera;
  final String Battery;
  final String Charging;
  final String DocId;

  const ProductDisplay(
      {Key? key,
      required this.Images,
      required this.MobileName,
      required this.StockUpdate,
      required this.Storage,
      required this.Ram,
      required this.Display,
      required this.Size,
      required this.Resolution,
      required this.Processor,
      required this.MainCamera,
      required this.FrontCamera,
      required this.Battery,
      required this.Charging, required this.PrevPrice, required this.Price, required this.DocId})
      : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f0f0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(CupertinoIcons.arrow_left),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (_)=>Cart()));
                      },
                        child: Icon(CupertinoIcons.cart)),
                  ],
                ),
              ),
              Container(
                height: mq.height * 0.3, // Adjust the height as needed
                child: CachedNetworkImage(
                  imageUrl: widget.Images,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                height: mq.height, // Adjust the height as needed
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  width: mq.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 20, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.MobileName,
                          style: TextStyle(fontSize: 25),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: mq.height * 0.04,
                        ),
                        Row(
                          children: [
                            Text("Variant: ${widget.Ram},${widget.Storage}"),
                            SizedBox(
                              width: mq.width * 0.08,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff00ff15),
                              ),
                              height: mq.height * 0.05,
                              width: mq.width * 0.35,
                              child: Center(
                                child: Text(
                                  widget.StockUpdate,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: mq.height * 0.04),
                        Row(
                          children: [
                            Text(
                              "৳${widget.PrevPrice}",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(width: mq.width * 0.04),
                            Text(
                              "৳${widget.Price}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: mq.height * 0.03),
                        Divider(
                          color: Colors.black54,
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(height: mq.height * 0.03),
                        GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                context: context, builder: (context) {
                                return Container(
                                  height: mq.height * 0.7,
                                  width: mq.width,
                                  decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,0,0),
                                        child: Text("Specifiaction",style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("Ram: ${widget.Ram}",style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("Storage: ${widget.Storage}",style: TextStyle(fontSize: 20),),
                                      ),
                                    ],
                                  ),
                                  );
                              },);
                            },
                            child: CardinProductDisplay("Specification: ", "Storage, RAM")),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              context: context, builder: (context) {
                              return Container(
                                height: mq.height * 0.7,
                                width: mq.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(45),
                                        topRight: Radius.circular(45))),
                                child: Column(
                                  children: [

                                  ],
                                ),
                              );
                            },);
                          },
                          child: CardinProductDisplay(
                              "Service: ", "15 Days Easy Return"),
                        ),
                        SizedBox(height: mq.height * 0.03),
                        Text(
                          "Description: ",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.black54,
                          height: 1,
                          thickness: 1,
                        ),
                        Text("Display: ${widget.Display}",
                            style: TextStyle(fontSize: 15)),
                        Text("Size: ${widget.Size}", style: TextStyle(fontSize: 18)),
                        Text("Resolution: ${widget.Resolution}",
                            style: TextStyle(fontSize: 15)),
                        Text("Processor: ${widget.Processor}",
                            style: TextStyle(fontSize: 15)),
                        Text("Main Camera: ${widget.MainCamera}",
                            style: TextStyle(fontSize: 15)),
                        Text("Front Camera: ${widget.FrontCamera}",
                            style: TextStyle(fontSize: 15)),
                        Text("Battery: ${widget.Battery}",
                            style: TextStyle(fontSize: 15)),
                        Text("Charging: ${widget.Charging}", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){

                if(isLogin==false){
                  Navigator.push(context, CupertinoPageRoute(builder: (_)=>Profile()));
                }else{
                  apis.addToCart(widget.Images, widget.MobileName, widget.Price,widget.DocId);
                }
              },
              child: cButton("Add to Cart"),
            ),
            SizedBox(width: mq.width * 0.02,),
            InkWell(
                onTap: (){
                  if(isLogin==true){//need to change in false
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>Profile()));//need to change letter to profile page
                  }else{
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => BuyNow(
                                Images: widget.Images,
                                MobileName: widget.MobileName,
                                Storage: widget.Storage,
                                Ram: widget.Ram,
                                Price: widget.Price,
                                DocId: widget.DocId)));
                  }
                },
                child: cButton("Buy Now")),
          ],
        ),
      ),
    );
  }
}
