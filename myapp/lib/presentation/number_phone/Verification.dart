import 'package:flutter/material.dart';

import '../selectlocation/SelectLocation.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
  void navigateToChooseSelectLocationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectLocation()), // Chuyển sang màn hình ChooseNumber
    );
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
            top: 56,
            left: 16,
            child: GestureDetector(
              onTap: () {
                // Xử lý khi nhấn nút quay lại
              },
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
          ),
          Positioned(
            top: 140.02,
            left: 25,
            right: 0,
            child: Text(
              'Enter your 4-digit code',
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
              'Code',
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
                      TextField(
                        focusNode: _phoneFocusNode,
                        controller: codeController,
                        keyboardType: TextInputType.number,
                        maxLength: 4, // Đặt độ dài tối đa của mã số
                        decoration: const InputDecoration(
                          hintText: '- - - -', // Đặt hint cho TextField
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                          ),
                          counterText: '', // Loại bỏ văn bản đếm
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20), // Thêm padding cho Text bên trái là 25px
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF53B175),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          navigateToChooseSelectLocationScreen();
                          // Xử lý khi nút được nhấn
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF53B175),
                          shape: CircleBorder(),
                          fixedSize: Size(55, 55),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 31),
              NumericPad(onNumberSelected: _onNumberSelected),
            ],
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

class NumericPad extends StatelessWidget {
  final Function(int) onNumberSelected;

  NumericPad({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDEDFE3),
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
                  _buildEmptySpace(),
                  _buildNumber(0),
                  _buildBackspace(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Container(
            width: 55,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
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
                Icons.backspace_outlined,
                size: 20,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySpace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
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
                '+*#', // Thay đổi dấu * thành +, * hoặc # tùy thuộc vào ký tự muốn thêm
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
