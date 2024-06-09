import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/signin/signin.dart';

import '../home/ShopScreen.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  _OrderAccepted createState() => _OrderAccepted();
}

class _OrderAccepted extends State<OrderAccepted> {
  String dropdownValue = 'Banasree';
  String dropdownValueArea = 'Types of your area';
  TextEditingController codeController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();


  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_phoneFocusNode);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned.fill(
            top: -580,
            child: Image.asset(
              'assets/nen.png',
              width: 294,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            top: 119,
            left: 25,
            child: Center(
              child: Image.asset(
                'assets/thanhcong.png',
                width: 284,
                height: 190,

                // Cấu hình kích thước và các thuộc tính khác tùy thuộc vào nhu cầu của bạn
              ),
            ),
          ),
          const Positioned(
            top: 352, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Your Order has been\naccepted',
                style: TextStyle(
                  fontSize: 24, // Điều chỉnh kích thước phù hợp
                  color: Colors.black, // Điều chỉnh màu sắc phù hợp
                  fontWeight: FontWeight.w500, // Điều chỉnh độ đậm phù hợp
                ),
                textAlign: TextAlign.center, // Căn giữa văn bản
              ),
            ),
          ),
          const Positioned(
            top: 440, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left: 0,
            right: 0,
            child: Center(
                child: Text(
                  'Your items has been placcd and is on\nit’s way to being processed',
                  style: TextStyle(
                    fontSize: 15, // Điều chỉnh kích thước phù hợp
                    color: Color(0xFF7C7C7C), // Điều chỉnh màu sắc phù hợp
                    fontWeight: FontWeight.normal, // Điều chỉnh độ đậm phù hợp
                  ),
                  textAlign: TextAlign.center,
                )
            ),
          ),
          Positioned(
            top: 645,
            left:27,
            right: 27,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopScreen()), // Chuyển sang màn hình signin
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(330, 57), backgroundColor: Color(0xFF53B175), // Đặt màu nền cho nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                ),
              ),
              child: const Text(
                'Track Order',
                style: TextStyle(
                  fontSize: 16, // Đặt kích thước văn bản là 15px
                  color: Colors.white, // Đặt màu văn bản là màu trắng
                ),
              ),
            ),
          ),
          Positioned(
            top: 724,
            left: 134.1,
            right: 27,
            child: GestureDetector(
              onTap: () {
                // Navigate to ShopScreen when the text is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopScreen()),
                );
              },
              child: Text(
                'Back to home',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  // Method to handle number selection from the custom numeric pad
  void _onNumberSelected(int number) {
    String currentText = codeController.text;
    if (number >= 0) {
      if (currentText.length < 4) {
        currentText += number.toString();
      }
    } else {
      currentText = currentText.isNotEmpty ? currentText.substring(0, currentText.length - 1) : '';
    }
    codeController.text = currentText;
  }
}

