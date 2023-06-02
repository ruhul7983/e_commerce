import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String price;
  final String name;
  SingleProduct({required this.image, required this.name, required this.price});
  @override
  Widget build(BuildContext context) {
    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        height: height * 0.3,
        width: width * 0.2 * 2 + 10,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "৳ ${price}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xff9b96d6)),
                  ),
                  Container(
                    child: Text(
                      name,maxLines: 1,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}