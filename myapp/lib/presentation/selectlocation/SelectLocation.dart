import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/signin/signin.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocation createState() => _SelectLocation();
}

class _SelectLocation extends State<SelectLocation> {
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
            top: 119,
            left: 85,
            child: Center(
              child: Image.asset(
                'assets/IcselectLocation.png',
                width: 204,
                height: 150,

                // Cấu hình kích thước và các thuộc tính khác tùy thuộc vào nhu cầu của bạn
              ),
            ),
          ),
          const Positioned(
            top: 300, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Select Your Location',
                style: TextStyle(
                  fontSize: 24, // Điều chỉnh kích thước phù hợp
                  color: Colors.black, // Điều chỉnh màu sắc phù hợp
                  fontWeight: FontWeight.normal, // Điều chỉnh độ đậm phù hợp
                ),
              ),
            ),
          ),
          const Positioned(
            top: 350, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Switch on your location to stay in tune with\nwhat’s happening in your area',
                style: TextStyle(
                  fontSize: 15, // Điều chỉnh kích thước phù hợp
                  color: Color(0xFF7C7C7C), // Điều chỉnh màu sắc phù hợp
                  fontWeight: FontWeight.normal, // Điều chỉnh độ đậm phù hợp
                ),
                textAlign: TextAlign.center,
              )
            ),
          ),
          const Positioned(
            top: 460, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left:0,
            right: 248,
            child: Center(
                child: Text(
                  'Your Zone',
                  style: TextStyle(
                    fontSize: 14, // Điều chỉnh kích thước phù hợp
                    color: Color(0xFF7C7C7C), // Điều chỉnh màu sắc phù hợp
                    fontWeight: FontWeight.bold, // Điều chỉnh độ đậm phù hợp
                  ),
                )
            ),
          ),
          Positioned(
              top: 485, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
              left:27,
              right: 27,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                isExpanded: true,
                style: const TextStyle(color: Color(0xFF000000),fontSize: 17),
                underline: Container(
                  height: 0.8,
                  color: Color(0xFFE2E2E2),
                ),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValue = newValue!;
                  });
                }, items: const[
                  DropdownMenuItem<String>(
                    value: 'Banasree',
                    child: Text("Banasree"),
                  ),
                DropdownMenuItem<String>(
                  value: 'Hanoi',
                  child: Text("Hà Nội"),
                ),
                DropdownMenuItem<String>(
                  value: 'Đanang',
                  child: Text("Đà Nẵng"),
                ),
                DropdownMenuItem<String>(
                  value: 'Saigon',
                  child: Text("Sài Gòn"),
                )
              ],
              )
          ),
          const Positioned(
            top: 565, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
            left:0,
            right: 248,
            child: Center(
                child: Text(
                  'Your Area',
                  style: TextStyle(
                    fontSize: 15, // Điều chỉnh kích thước phù hợp
                    color: Color(0xFF7C7C7C), // Điều chỉnh màu sắc phù hợp
                    fontWeight: FontWeight.bold, // Điều chỉnh độ đậm phù hợp
                  ),
                )
            ),
          ),
          Positioned(
              top: 585, // Điều chỉnh vị trí dọc tùy theo nhu cầu của bạn
              left:27,
              right: 27,
              child: DropdownButton<String>(
                value: dropdownValueArea,
                icon: const Icon(Icons.arrow_drop_down),
                isExpanded: true,
                style: const TextStyle(color: Color(0xFF7C7C7C),fontSize: 17),
                underline: Container(
                  height: 0.8,
                  color: Color(0xFFE2E2E2),
                ),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValueArea = newValue!;
                  });
                }, items: const[
                DropdownMenuItem<String>(
                  value: 'Types of your area',
                  child: Text("Types of your area"),
                ),
                DropdownMenuItem<String>(
                  value: 'Liên Chiểu',
                  child: Text("Liên Chiểu"),
                ),
                DropdownMenuItem<String>(
                  value: 'Hải Châu',
                  child: Text("Hải Châu"),
                ),
                DropdownMenuItem<String>(
                  value: 'Ngũ Hành Sơn',
                  child: Text("Ngũ Hành Sơn"),
                ),
                DropdownMenuItem<String>(
                  value: ' Sơn Trà',
                  child: Text(" Sơn Trà"),
                ), DropdownMenuItem<String>(
                  value: 'Cẩm Lệ',
                  child: Text("Cẩm Lệ"),
                )
                , DropdownMenuItem<String>(
                  value: 'Thanh Khê',
                  child: Text("Thanh Khê"),
                )
              ],
              )
          ),
          Positioned(
            top: 665,
            left:27,
            right: 27,
            child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()), // Chuyển sang màn hình signin
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(330, 57), backgroundColor: Color(0xFF53B175), // Đặt màu nền cho nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16, // Đặt kích thước văn bản là 15px
                color: Colors.white, // Đặt màu văn bản là màu trắng
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

