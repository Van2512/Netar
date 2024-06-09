import 'package:flutter/material.dart';

import '../../login/Login.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isEggsPressed = false;
  bool isNoodlesPressed = false;
  bool isChipsPressed = false;
  bool isFastFoodPressed = false;
  bool isIndividualCollectionPressed = false;
  bool isCocolaPressed = false;
  bool isIfadPressed = false;
  bool isKaziFarmasPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 31),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5.5), // Lề bên phải 10px
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 22, // Kích thước của icon quay lại
                      color: Colors.black, // Màu sắc của icon quay lại
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 104),
                  child: const Text(
                    'Filters',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 709,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F3F2), // Màu nền
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 3),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 74.5), // Di chuyển sang trái 100px
                    child: buildCategoryButton(
                      'Eggs',
                      isEggsPressed,
                          () => setState(() => isEggsPressed = !isEggsPressed),
                    ),
                  ),
                  buildCategoryButton(
                      'Noodles & Pasta', isNoodlesPressed, () => setState(() => isNoodlesPressed = !isNoodlesPressed)),
                  Container(
                    padding: EdgeInsets.only(right: 12.5), // Di chuyển sang trái 100px
                    child: buildCategoryButton(
                        'Chips & Crisps', isChipsPressed, () => setState(() => isChipsPressed = !isChipsPressed)),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 42.5), // Di chuyển sang phải 10px
                    child: buildCategoryButton(
                      'Fast Food',
                      isFastFoodPressed,
                          () => setState(() => isFastFoodPressed = !isFastFoodPressed),
                    ),
                  ),

                  SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(left: 19.2),
                    child: Row(
                      children: [
                        Text(
                          'Brand', // Dòng văn bản "Brand" giữa Fast Food và Individual Collection
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    margin: EdgeInsets.only(right: 43), // Di chuyển sang phải 13px và sang trái 10px
                    child: buildCategoryButton(
                      'Individual',
                      isIndividualCollectionPressed,
                          () => setState(() => isIndividualCollectionPressed = !isIndividualCollectionPressed),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 60.1), // Di chuyển sang phải 13px và sang trái 30px
                    child: buildCategoryButton(
                      'Cocola',
                      isCocolaPressed,
                          () => setState(() => isCocolaPressed = !isCocolaPressed),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( right: 79), // Di chuyển sang phải 13px và sang trái 60px
                    child: buildCategoryButton(
                      'Ifad',
                      isIfadPressed,
                          () => setState(() => isIfadPressed = !isIfadPressed),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only( right: 24), // Di chuyển sang phải 13px và sang trái 40px
                    child: buildCategoryButton(
                      'Kazi Farmas',
                      isKaziFarmasPressed,
                          () => setState(() => isKaziFarmasPressed = !isKaziFarmasPressed),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 18, top: 168,right: 18), // Khoảng cách từ mép phải và từ dưới
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()), // Chuyển sang màn hình signin
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(330, 57), // Đặt kích thước cố định cho nút
                        backgroundColor: const Color(0xFF53B175), // Đặt màu nền cho nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                        ),
                      ),
                      child: const Text(
                        'Apply Filter',
                        style: TextStyle(
                          fontSize: 16, // Đặt kích thước văn bản là 16px
                          color: Colors.white, // Đặt màu văn bản là màu trắng
                        ),
                      ),
                    ),
                  ),

                ],
              ),


            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(String title, bool isPressed, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(right: 208.9, top: 18.8),
        child: Row(
          children: [
            Expanded(child: Container()),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(color: isPressed ? Color(0xFF53B175) : const Color(0xFFB1B1B1)),
                color: isPressed ? Color(0xFF53B175) : const Color(0xFFF2F3F2),
              ),
              width: 20.9,
              height: 20.9,
              child: isPressed ? Icon(Icons.check, color: Colors.white, size: 17) : null,
            ),
            SizedBox(width: 11),
            Text(
              title,
              style: TextStyle(
                color: isPressed ? Colors.green : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
