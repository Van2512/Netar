import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/beverages/Beverages.dart';
import 'package:myapp/presentation/productdetail/ProductDetail.dart';
import 'package:myapp/presentation/splashscreen/SplashScreen.dart';
import 'presentation/account/Account.dart';
import 'presentation/explore/ExploreScreen.dart';
import 'presentation/home/ShopScreen.dart';

void main() async{

 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
  return const MaterialApp(
   home: SplashScreen(),
  );
 }
}
