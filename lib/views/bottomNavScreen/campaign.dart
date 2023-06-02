import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/service/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key,}) : super(key: key);

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  List campaign = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text("Campaign",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(CupertinoIcons.arrow_left,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: apis.getCampaign(),
          builder: (context, snapshot) {
            final data = snapshot.data?.docs;
            campaign = data?.map((e) => e.data()['slider']).toList() ?? [];
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(color: Colors.red,),);
              case ConnectionState.active:
              case ConnectionState.done:
                if(campaign.isNotEmpty){
                  return Column(
                    children: List.generate(campaign.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8,bottom: 12),
                        child: Image.network(
                          campaign[index],
                          height: mq.height * 0.2,
                          fit: BoxFit.fitHeight,
                          width: mq.width,
                        ),
                      );
                    }),
                  );
                }
            }
            return Center(
              child: SizedBox(
                height: mq.height * 0.3,
                  child: Text("No campaign running")),
            );
          },
        ),
      ),
    );
  }
}
