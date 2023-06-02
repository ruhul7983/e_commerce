import 'package:e_mart/service/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListTile extends StatefulWidget {
  final String image;
  final String price;
  final String name;
  final String DocId;
  const CartListTile({Key? key, required this.image, required this.price, required this.name, required this.DocId}) : super(key: key);

  @override
  State<CartListTile> createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      leading: Image.network(widget.image),
      subtitle: Text("৳ ${widget.price}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
      trailing: InkWell(
        onTap: (){
          apis.removeCart(widget.DocId);
        },
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.red,
          child: Icon(CupertinoIcons.minus),),
      ),
    );
  }
}
