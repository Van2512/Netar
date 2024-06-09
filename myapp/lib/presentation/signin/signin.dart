import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../number_phone/ChooseNumber.dart';
import '../welcome/homepage.dart'; // Import ChooseNumber ở đây

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signin createState() => _signin();
}

final GoogleSignIn _googleSignIn =  GoogleSignIn(
    scopes: [
      'email'
    ]
);

class _signin extends State<signin> {

  TextEditingController phoneController = TextEditingController();
  GoogleSignInAccount? _currentUser;

  void navigateToChooseNumberScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseNumber()), // Chuyển sang màn hình ChooseNumber
    );
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn?.serverClientId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hình ảnh
          Image.asset(
            'assets/maskGroup.png',
            fit: BoxFit.fill, // Đảm bảo hình ảnh lấp đầy toàn bộ không gian
          ),
          // Các phần tử khác ở phía trên hình ảnh
          Padding(
            padding: const EdgeInsets.only(top: 390, left: 20), // Đặt khoảng cách 390px phía trên và 20px phía trái
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Căn các phần tử theo chiều ngang
              children: [
                const Text(
                  'Get your groceries',
                  style: TextStyle(
                    fontSize: 20.5, // Đặt kích thước văn bản là 21px
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'with nectar',
                  style: TextStyle(
                    fontSize: 20.5, // Đặt kích thước văn bản là 21px
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15), // Khoảng cách giữa văn bản và mẫu nhập số điện thoại
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: IntlPhoneField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE2E2E2)), // Màu đỏ
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE2E2E2)), // Màu xám
                            ),
                            counterText: '', // Xóa chữ "0/11"
                          ),
                          initialCountryCode: 'VN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          // Xử lý khi nhấn Enter
                          onSubmitted: (_) {
                            navigateToChooseNumberScreen();
                          },
                        )
                    ),
                    const SizedBox(height: 33), // Khoảng cách giữa hai phần tử
                  ],
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      'Or connect with social media',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nút được nhấn
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFF5383EC),
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: Color(0xFF5383EC)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Căn biểu tượng ra góc trái
                        children: [
                          Image.asset(
                            'assets/icons8_google_30.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 38), // Khoảng cách giữa biểu tượng và văn bản
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nút được nhấn
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFF4A66AC),
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: Color(0xFF4A66AC)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Căn biểu tượng ra góc trái
                        children: [
                          Image.asset(
                            'assets/Vector.png',
                            height: 23,
                            width: 23,
                          ),
                          SizedBox(width: 34), // Khoảng cách giữa biểu tượng và văn bản
                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
