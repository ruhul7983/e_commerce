import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_mart/Categories/AppleGadget.dart';
import 'package:e_mart/Categories/CategoriesAll.dart';
import 'package:e_mart/Categories/PreOwnedDevice.dart';
import 'package:e_mart/Categories/SmartPhone.dart';
import 'package:e_mart/Categories/SmartWatch.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/service/apis.dart';
import 'package:e_mart/views/ProductDisplayPage.dart';
import 'package:e_mart/views/bottomNavScreen/campaign.dart';
import 'package:e_mart/widgets/singleProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../model/productmodel.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List campaign = [];
  var dotPosition = 0;
  int campaignCount = 0;
  List<ProductModel> list = [];

  var img = 'https://firebasestorage.googleapis.com/v0/b/ecommerce-a196b.appspot.com/o/SmartPhone%2Fiphone.jpg?alt=media&token=3fad126f-8e2e-45a4-9475-16b0b8d5674d';
  @override
  void initState() {
    apis.getCampaign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Text(appname, style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mq.height * 0.01),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: apis.getCampaign(),
              builder: (context, snapshot) {
                final data = snapshot.data?.docs;
                campaign = data?.map((e) => e.data()['slider']).toList() ?? [];
                final campaignCount = campaign.length;
                return AspectRatio(
                  aspectRatio: 3.5,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (val, carouselPageChangeReason) {
                        dotPosition = val;
                      },
                    ),
                    items: List.generate(campaign.length, (index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (_)=>Campaign()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Image.network(campaign[index]),
                            ),
                          );
                        }),
                      ));
                }
            ),
            SizedBox(height: mq.height * 0.03),
            Center(
              child: DotsIndicator(
                dotsCount: 2,
                position: dotPosition,
                decorator: DotsDecorator(
                  activeColor: redColor,
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8, 8),
                  size: Size(6, 6),
                  color: redColor.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>CategoriesAll()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: mq.height * 0.03),
            Row(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>SmartPhone()));
                    },
                    child: Categories(icSmartPhone, "Smart\nPhone")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>PreOwnedDevice()));
                    },
                    child: Categories(icSmartPhone2, "Pre-Owned\nDevices")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>AppleGadget()));
                    },
                    child: Categories(icApple, "Apple\nGadget")),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>SmartWatch()));
                    },
                    child: Categories(icSmartWatch, "Smart\nWatch")),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        icFlash,
                        height: mq.height * 0.04,
                        width: mq.width * 0.04,
                        color: Colors.red,
                      ),
                      SizedBox(width: mq.width * 0.01),
                      Text(
                        "Flash Sale",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    "See More",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: apis.getSmartPhone(),
              builder: (context, snapshot) {
                final data = snapshot.data?.docs;
                list = data?.map((e) => ProductModel.fromJson(e.data())).toList() ?? [];
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                            builder: (_) =>
                                ProductDisplay(Images: item.Images,
                                    MobileName: item.MobileName,
                                    StockUpdate: item.StockUpdate,
                                    Storage: item.Storage,
                                    Ram: item.RAM,
                                    Display: item.Display,
                                    Size: item.Size,
                                    Resolution: item.Resolution,
                                    Processor: item.Processor,
                                    MainCamera: item.MainCamera,
                                    FrontCamera: item.FrontCamera,
                                    Battery: item.Battery,
                                    Charging: item.Charging,
                                    PrevPrice: item.PreviousPrice,
                                    Price: item.Price,
                                    DocId: item.DocId)));
                      },
                        child: SingleProduct(image: item.Images, name: item.MobileName, price: item.Price));
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

