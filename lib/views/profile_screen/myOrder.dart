import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/service/apis.dart';
import 'package:flutter/material.dart';

import '../../model/productmodel.dart';

class myOrder extends StatefulWidget {
  const myOrder({Key? key}) : super(key: key);

  @override
  State<myOrder> createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
  List myOrder = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("My Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: apis.getMyOrder(),
        builder: (context, snapshot) {
          final data = snapshot.data?.docs;
          myOrder = data?.map((e) => ProductModel.fromJson(e.data())).toList() ?? [];
          return ListView.builder(
            itemCount: myOrder.length,
            itemBuilder: (context, index) {
              final item = myOrder[index];
              if(myOrder.isNotEmpty){
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                  child: ListTile(
                    tileColor: Colors.red.shade100,
                    title: Text(item.MobileName,maxLines: 1,style: TextStyle(fontSize: 20),),
                    subtitle: Text("৳${item.Price}"),
                    leading: Image.network(item.Images),
                    trailing: Text(item.Status),
                  ),
                );
              }
            return Center(
              child: Text("You haven't placed any orders yet"),
            );
          },);
        }
      ),
    );
  }
}
