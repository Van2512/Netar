import 'package:flutter/material.dart';
import 'package:myapp/presentation/welcome/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyhomePage(key: GlobalKey(), title: '')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF53B175), // Sử dụng mã hex của màu #53B175
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo.png', // Đường dẫn đến tệp ảnh
              width: 240.42, // Chiều rộng của hình ảnh
              height: 68.61, // Chiều cao của hình ảnh
            ),
            SizedBox(height: 20), // Khoảng cách giữa hình ảnh và văn bản
          ],
        ),
      ),
    );
  }
}
