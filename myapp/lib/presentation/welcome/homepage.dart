import 'package:flutter/material.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/signin/signin.dart';

class MyhomePage extends StatefulWidget {
  MyhomePage({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                // Container chứa hình ảnh
                Container(
                  margin: EdgeInsets.only(top: 437),
                  width: 48.47,
                  height: 56.36,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logomini.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                // RichText chứa chuỗi văn bản "Welcome to our store"
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                    ),
                    children: [
                      TextSpan(text: 'Welcome\n'),
                      TextSpan(text: 'to our store'),
                    ],
                  ),
                ),
                SizedBox(height: 7),
                // RichText chứa chuỗi văn bản "Get your groceries in as fast as one hour"
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(252, 252, 252, 0.7),
                      fontFamily: 'Gilroy',
                    ),
                    children: [
                      TextSpan(text: 'Get your groceries in as fast as one hour\n'),
                    ],
                  ),
                ),
                const SizedBox(height: 18), // Khoảng cách giữa chuỗi văn bản và nút
                // Nút "Get Started"
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signin()), // Chuyển sang màn hình signin
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(330, 67), backgroundColor: Color(0xFF53B175), // Đặt màu nền cho nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 15, // Đặt kích thước văn bản là 15px
                      color: Colors.white, // Đặt màu văn bản là màu trắng
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
