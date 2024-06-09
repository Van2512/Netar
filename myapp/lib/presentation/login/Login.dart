import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/selectlocation/SelectLocation.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/signup/SignUp.dart';

import '../../core/widgets/form/form_login.dart';
import '../signin/signin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController codeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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
            top: 90.02,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/iclogo2.png',
              height: 43,
              width: 35,
            ),
          ),
          const Positioned(
            top: 233.02,
            left: 25,
            right: 0,
            child: Text(
              'Loging',
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
              'Enter your emails and password',
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
              'Phone number or Email',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 332.02,
            left: 25,
            right: 25,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'imshuvo97@gmail.com',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
          const Positioned(
            top: 405.02,
            left: 25,
            right: 0,
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 420.02,
            left: 25,
            right: 25,
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: '* * * * *',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 0.8),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_off_outlined),
                  iconSize: 19,
                  color: Color(0xFF7C7C7C),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const Positioned(
            top: 485,
            right: 25,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 11.5,
                color: Color(0xFF181725),
              ),
            ),
          ),
          Positioned(
            top: 525,
            left: 27,
            right: 27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthenticationHelper.login(context, _emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 57),
                    backgroundColor: const Color(0xFF53B175),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Color(0xFF53B175),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => signin()),
                              );
                            },
                        ),
                      ],
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

