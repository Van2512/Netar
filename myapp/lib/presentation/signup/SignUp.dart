import 'package:flutter/material.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/selectlocation/SelectLocation.dart';
import 'package:myapp/presentation/signup/SignUp.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
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
            top: 90.02,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/iclogo2.png',
              height: 43,
              width: 35, // Đường dẫn của hình ảnh trong assets
            ),
          ),
          const Positioned(
            top: 233.02,
            left: 25,
            right: 0,
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
          const Positioned(
            top: 270.02,
            left: 25,
            right: 0,
            child: Text(
              'Enter your credentials to continue',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ),
          const Positioned(
            top: 317.02,
            left: 25,
            right: 0,
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ),
          const Positioned(
            top: 332.02,
            left: 25,
            right: 25,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Afsar Hossen Shuvo', // Hint text
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                hintStyle: TextStyle(color: Colors.black, fontSize: 14), // Màu của hint text
                // Style cho văn bản trong TextField
              ),
            ),
          ),
          const Positioned(
            top: 410.02,
            left: 25,
            right: 0,
            child: Text(
              'Email',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ),
          const Positioned(
            top: 420.02, // Thay đổi giá trị top để tạo khoảng cách 10px giữa các trường
            left: 25,
            right: 25,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'imshuvo97@gmail.com', // Hint text
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                hintStyle: TextStyle(color: Colors.black, fontSize: 14), // Màu của hint text
                suffixIcon: Icon(
                  Icons.check,
                  color: Colors.green, // Màu của icon dấu tick
                ),
                // Style cho văn bản trong TextField
              ),
            ),
          ),

          const Positioned(
            top: 500.02,
            left: 25,
            right: 0,
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ),
          Positioned(
            top: 512.02,
            left: 25,
            right: 25,
            child: TextField(
              obscureText: true, // Ẩn văn bản nhập vào
              decoration: InputDecoration(
                hintText: '* * * * *', // Hint text
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                hintStyle: TextStyle(color: Colors.black, fontSize: 13), // Màu của hint text
                // Icon bên phải để hiển thị hoặc ẩn mật khẩu
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_off_outlined), // Icon mặc định là visibility
                  iconSize: 19, // Kích thước của biểu tượng
                  color: Color(0xFF7C7C7C), // Màu của biểu tượng
                  onPressed: () {
                    // Xử lý khi nhấn vào icon
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 25,
            right: 25,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF7C7C7C),
                    ),
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to our ',
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Color(0xFF53B175),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' \nand ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF53B175),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 635,
            left: 27,
            right: 27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()), // Chuyển sang màn hình signin
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 57),
                    backgroundColor: const Color(0xFF53B175), // Đặt màu nền cho nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                    ),
                  ),
                  child: const Text(
                    'Sing Up',
                    style: TextStyle(
                      fontSize: 16, // Đặt kích thước văn bản là 16px
                      color: Colors.white, // Đặt màu văn bản là màu trắng
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Khoảng cách giữa nút Log In và dòng văn bản "Don’t have an account? Singup"
                Center(
                  child: Padding(

                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0), // Đặt padding cho văn bản
                    child: RichText(
                      textAlign: TextAlign.center, // Căn giữa văn bản theo chiều ngang
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 12.5, // Đặt kích thước văn bản là 13px
                          color: Colors.black, // Đặt màu văn bản là màu đen
                        ),
                        children: [
                          TextSpan(
                            text: 'Singup',
                            style: TextStyle(
                              fontSize: 12.5, // Đặt kích thước văn bản là 13px
                              color: Color(0xFF53B175), // Đặt màu văn bản "Singup" là màu xanh
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
