
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/service/apis.dart';
import 'package:e_mart/views/ProductDisplayPage.dart';
import 'package:e_mart/widgets/singleProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/productmodel.dart';

class SmartPhone extends StatefulWidget {
  const SmartPhone({Key? key}) : super(key: key);

  @override
  State<SmartPhone> createState() => _SmartPhoneState();
}

class _SmartPhoneState extends State<SmartPhone> {
  List<ProductModel> list = [];
  @override
  void initState() {
    apis.getSmartPhone();
    super.initState();
  }

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
          "Smart Phone",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: apis.getSmartPhone(),
                builder: (context, snapshot) {
                  final data = snapshot.data?.docs;
                  list = data?.map((e) => ProductModel.fromJson(e.data())).toList() ?? [];
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      final item = list[index];
                        return InkWell(
                          onTap: (){
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => ProductDisplay(
                                      Images: item.Images,
                                      MobileName: item.MobileName,
                                      StockUpdate: item.StockUpdate,
                                      Storage: item.Storage,
                                      Ram: item.RAM,
                                      Display: item.Display,
                                      Size: item.Display,
                                      Resolution: item.Resolution,
                                      Processor: item.Processor,
                                      MainCamera: item.MainCamera,
                                      FrontCamera: item.FrontCamera,
                                      Battery: item.Battery,
                                      Charging: item.Charging,
                                      PrevPrice: item.PreviousPrice,
                                      Price: item.Price, DocId: item.DocId,)));
                        },
                        child: SingleProduct(
                              image: item.Images,
                              name: item.MobileName,
                              price: item.Price),
                        );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
