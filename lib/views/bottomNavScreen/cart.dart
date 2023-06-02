import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/Categories/SmartPhone.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/service/apis.dart';
import 'package:e_mart/widgets/CartListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../model/productmodel.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<ProductModel> list = [];
  @override
  void initState() {
    apis.getCartItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Cart",style: TextStyle(fontSize: 25),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
               stream: apis.getCartItem(),
               builder: (context, snapshot) {
                 final data = snapshot.data?.docs;
                 list = data?.map((e) => ProductModel.fromJson(e.data()))
                     .toList() ?? [];
                 switch (snapshot.connectionState) {
                   case ConnectionState.none:
                   case ConnectionState.waiting:
                     return Center(child: CircularProgressIndicator(),);
                   case ConnectionState.active:
                   case ConnectionState.done:
                     if (list.isNotEmpty) {
                       return ListView.builder(
                           physics: BouncingScrollPhysics(),
                           itemCount: list.length,
                           shrinkWrap: true,
                           itemBuilder: (context, index) {
                             final item = list[index];
                             return CartListTile(image: item.Images, price: item
                                 .Price, name: item.MobileName, DocId: item.DocId,);
                           });
                     }
                     return Center(
                       child: ElevatedButton(
                         onPressed: () {
                           Navigator.push(context, CupertinoPageRoute(builder: (_)=>SmartPhone()));
                         },
                         child: Text("Go to Product Page"),
                       ),
                     );
                 }
               },)
          ],
        ),
      ),
    );
  }
}
