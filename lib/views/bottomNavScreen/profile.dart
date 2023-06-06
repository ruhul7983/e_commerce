import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/views/bottomNavScreen/cart.dart';
import 'package:e_mart/views/profile_screen/balance.dart';
import 'package:e_mart/views/profile_screen/myOrder.dart';
import 'package:e_mart/views/profile_screen/settings.dart';
import 'package:e_mart/views/profile_screen/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../auth_screen/login.dart';
import '../profile_screen/faq.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  bool isLogin = true;//it will true always
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
      backgroundColor: Color(0xffF9F9F9),
      body: isLogin?SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage(imgBackGround),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rose Helbert',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.yellow,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/wallet.png'),
                              onPressed:()=> Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (_) => Wallet())),
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(icShop),
                              onPressed: () => Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (_) => myOrder())),
                            ),
                            Text(
                              'My Order',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(icDollar),
                              onPressed:()=> Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (_) => Balance())),
                            ),
                            Text(
                              'Balance',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(icHeadphone), onPressed: () {},
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and logout'),
                  leading: Image.asset(icFavoriteSeller, fit: BoxFit.scaleDown, width: 30, height: 30,),
                  trailing: Icon(Icons.chevron_right, color: Colors.yellow),
                  onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(builder: (_) => Settings())),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset(icChat),
                  trailing: Icon(Icons.chevron_right, color: Colors.yellow),
                  onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(builder: (_) => FAQ())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.person_crop_circle_badge_xmark,size: 200,color: Colors.red,),
            Text("You are not logged in",style: TextStyle(fontSize: 25),),
            Text("Login first"),
            SizedBox(height: mq.height*0.02,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Login",style: TextStyle(fontSize: 20),),
                ), onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>Login()));
            }),
          ],
        ),
      ),
    );
  }
}
