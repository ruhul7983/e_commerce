
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class apis{
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for firestore
  static FirebaseFirestore Firestore = FirebaseFirestore.instance;

  //for storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  //for shared pref
  static const String KEYLOGIN = 'lgoin';

  //phone varification
  static phoneOtpSend(String countryCode,String phoneNumber) async {
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${countryCode+phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //for fetching smartphone
  static Stream<QuerySnapshot<Map<String, dynamic>>> getSmartPhone() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('SmartPhone')
        .snapshots();
  }
  //for fetching PreOwned Device
  static Stream<QuerySnapshot<Map<String, dynamic>>> getPreOwnedDevice() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('Pre-OwendDevices')
        .snapshots();
  }
  //for fetching Apple Gadget
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAppleGadget() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('AppleGadget')
        .snapshots();
  }
  //for fetching Smart Watch
  static Stream<QuerySnapshot<Map<String, dynamic>>> getSmartWatch() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('SmartWatch')
        .snapshots();
  }
  //for fetching TWS
  static Stream<QuerySnapshot<Map<String, dynamic>>> getTWS() {
    return Firestore
        .collection('categories')
        .doc("4RhnyeeaXIEQ4OZeRhey")
        .collection('TWS')
        .snapshots();
  }
  static userCreate(){
    return Firestore.collection("user").doc(auth.currentUser!.uid).set(
      {
        "phone":auth.currentUser!.phoneNumber,
      }
    );
  }

  //for checking is user exist or not
  static Future userExist() async {
    return (await Firestore.collection("users")
        .doc(auth.currentUser!.uid)
        .get())
        .exists;
  }


  //add to cart features

  static Future addToCart(String image,String MobileName, String Price,String docid){
    return Firestore.collection("cart").doc(auth.currentUser!.uid).collection("list").doc(docid).set(
      {
        "Images":image,
        "MobileName":MobileName,
        "Price":Price,
        "DocId":docid,
      }
    );
  }

  //fetch Cart Item

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCartItem() {
    if (auth.currentUser != null) {
      return Firestore
          .collection('cart')
          .doc(auth.currentUser!.uid)
          .collection('list')
          .snapshots();
    } else {
      // Return an empty stream or handle the null case according to your requirements
      return Stream.empty();
    }
  }


  //for delete cart item
  static Future removeCart(String DocId){
    return Firestore.collection("cart").doc(auth.currentUser!.uid).collection('list').doc(DocId).delete();
  }

  //for fetching Campaign image
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCampaign() {
    return Firestore
        .collection('campaign')
        .snapshots();
  }
  
  //get user number and address

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAddress() {
    if (auth.currentUser != null) {
      return Firestore
          .collection('user')
          .where(auth.currentUser!.uid)
          .snapshots();
    } else {
      // Return an empty stream or handle the null case according to your requirements
      return Stream.empty();
    }
  }

  //add to order
  static Future setOrder(String image,String MobileName, String Price,String docid,String PaymentMethod,String address, String phone){
    return Firestore.collection("order").doc(auth.currentUser!.uid).collection("list").doc(docid).set(
        {
          "Images":image,
          "MobileName":MobileName,
          "Price":Price,
          "DocId":docid,
          "Payment":PaymentMethod,
          "Address":address,
          "Phone":phone,
          "Status": "Pending",
        }
    );
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getMyOrder() {
    if (auth.currentUser != null) {
      return Firestore
          .collection('order')
          .doc(auth.currentUser!.uid)
          .collection('list')
          .snapshots();
    } else {
      // Return an empty stream or handle the null case according to your requirements
      return Stream.empty();
    }
  }


}