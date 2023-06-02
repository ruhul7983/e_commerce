import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/service/apis.dart';
import 'package:e_mart/widgets/singleProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/productmodel.dart';

class PreOwnedDevice extends StatefulWidget {
  const PreOwnedDevice({Key? key}) : super(key: key);

  @override
  State<PreOwnedDevice> createState() => _PreOwnedDeviceState();
}

class _PreOwnedDeviceState extends State<PreOwnedDevice> {
  List<ProductModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
            )),
        title: Text(
          "Pre-Owned Devices",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: apis.getPreOwnedDevice(),
                builder: (context, snapshot) {
                  final data = snapshot.data?.docs;
                  list = data?.map((e) => ProductModel.fromJson(e.data())).toList() ?? [];
                  if(list.isNotEmpty){
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return SingleProduct(
                            image: item.Images,
                            name: item.MobileName,
                            price: item.Price);
                      },
                    );
                  }else{
                   return SizedBox(
                     height: mq.height * 0.8,
                     child: Center(
                       child: Text("No Product Found"),
                     ),
                   );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
