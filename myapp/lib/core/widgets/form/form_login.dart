import 'package:flutter/material.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';

import '../../../presentation/admin/dashboard.dart';

class AuthenticationHelper {
  static void login(BuildContext context, String email, String password) {
    // Kiểm tra nếu email và mật khẩu đều đúng
    if ((email == 'admin' && password == '123456') || (email == 'vandang25122003@gmail.com' && password == '123456')) {
      // Nếu email và mật khẩu đúng, điều hướng đến màn hình tiếp theo
      if (email == 'admin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoardScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopScreen()),
        );
      }
    } else {
      // Hiển thị thông báo hoặc thực hiện hành động khác khi thông tin không đúng
      // Ví dụ:
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

