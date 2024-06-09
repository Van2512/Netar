import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'Verification.dart'; // Import màn hình xác minh OTP

class ChooseNumber extends StatefulWidget {
  const ChooseNumber({Key? key}) : super(key: key);

  @override
  _ChooseNumberState createState() => _ChooseNumberState();
}

class _ChooseNumberState extends State<ChooseNumber> {
  TextEditingController phoneController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();
  bool isInvalidMobile = false;


  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Yêu cầu trạng thái tiếp theo của focus khi màn hình được tạo
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
              'assets/nen.png', // Đường dẫn đến hình ảnh nền
              width: 294,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            top: 56,
            left: 16,
            child: IconButton(
              onPressed: () {
                // Xử lý khi nhấn nút quay lại
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 23, // Kích thước của icon
                color: Colors.black, // Màu sắc của icon
              ),
            ),
          ),
          Positioned(
            top: 140.02,
            left: 25,
            right: 0,
            child: Text(
              'Enter your mobile number',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 196.02,
            left: 25,
            right: 0,
            child: Text(
              'Mobile Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 235.0, right: 25, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      IntlPhoneField(
                        focusNode: _phoneFocusNode,
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                          ),
                          counterText: '',
                          errorText: isInvalidMobile ? 'Invalid Mobile Number' : null,
                        ),
                        initialCountryCode: 'VN',
                        onChanged: (phone) {
                          // Xử lý khi số điện thoại thay đổi
                          setState(() {
                            isInvalidMobile = false; // Đặt lại trạng thái của thông báo
                          });
                        },
                        onSubmitted: (_) {
                          // Xử lý khi nhấn phím gửi
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Nút điều hướng sang màn hình xác minh OTP
              Padding(
                padding: EdgeInsets.only(top: 92, left: 280),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Verification()), // Chuyển sang màn hình ChooseNumber
                    );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF53B175), // Màu nền của nút
                    shape: CircleBorder(), // Hình dạng nút là hình tròn
                    fixedSize: Size(55, 55), // Kích thước cố định của nút
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white, // Màu của biểu tượng
                        size: 19, // Kích thước của biểu tượng
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 31),
              NumericPad(onNumberSelected: _onNumberSelected), // Bàn phím số tùy chỉnh
            ],
          ),
        ],
      ),
    );
  }

  // Phương thức xử lý sự kiện khi chọn số từ bàn phím số tùy chỉnh
  void _onNumberSelected(int number) {
    String currentText = phoneController.text;
    if (number >= 0) {
      currentText += number.toString();
    } else {
      currentText = currentText.isNotEmpty ? currentText.substring(0, currentText.length - 1) : '';
    }
    phoneController.text = currentText;
  }
}

// Widget bàn phím số tùy chỉnh
class NumericPad extends StatelessWidget {
  final Function(int) onNumberSelected;

  NumericPad({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDEDFE3), // Màu nền của bàn phím
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNumber(1),
                  _buildNumber(2),
                  _buildNumber(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNumber(4),
                  _buildNumber(5),
                  _buildNumber(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNumber(7),
                  _buildNumber(8),
                  _buildNumber(9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildEmptySpace(), // Ô trống
                  _buildNumber(0),
                  _buildBackspace(), // Nút xóa
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget hiển thị số
  Widget _buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number); // Gọi phương thức khi nhấn vào số
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Container(
            width: 55,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white, // Màu nền của ô số
              borderRadius: BorderRadius.all(
                Radius.circular(5), // Bo tròn các góc của ô số
              ),
            ),
            child: Center(
              child: Text(
                number.toString(), // Hiển thị số
                style: TextStyle(
                  fontSize: 20, // Kích thước chữ
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1F1F1F), // Màu chữ
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget hiển thị nút xóa
  Widget _buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1); // Gọi phương thức khi nhấn vào nút xóa
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace_outlined, // Biểu tượng xóa
                size: 20, // Kích thước biểu tượng
                color: Color(0xFF1F1F1F), // Màu biểu tượng
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget hiển thị ô trống
  Widget _buildEmptySpace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Hành động khi nhấn vào ô trống
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Center(
              child: Text(
                '+*#', // Hiển thị dấu +*#
                style: TextStyle(
                  fontSize: 20, // Kích thước chữ
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1F1F1F), // Màu chữ
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
