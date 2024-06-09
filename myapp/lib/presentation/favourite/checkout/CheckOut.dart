import 'package:flutter/material.dart';
import 'package:myapp/presentation/orderaccepted/OrderAccepted.dart';

import '../../login/Login.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOut createState() => _CheckOut();
}

class _CheckOut extends State<CheckOut> {
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
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 22),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 21.5,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 200.5), // Lề bên phải 10px
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 26.6, // Kích thước của icon quay lại
                      color: Colors.black, // Màu sắc của icon quay lại
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 380,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity, // Độ dài của đường kẻ
                    height: 1,   // Độ rộng của đường kẻ
                    color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22, top: 0),
                        child: Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 15.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 132.5, top: 0),
                            child: Text(
                              'Select Method',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5, // Kích thước chiều rộng mong muốn
                          ),
                          PopupMenuButton(
                            child: const RotatedBox(
                              quarterTurns: 2, // Xoay icon 180 độ (mũi tên chỉ sang phải)
                              child: Icon(Icons.arrow_back_ios, size: 19),
                              // Icon mũi tên quay lại
                            ),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Option 1'),
                                  value: 1,
                                ),
                                const PopupMenuItem(
                                  child: Text('Option 2'),
                                  value: 2,
                                ),
                                // Add more PopupMenuItems as needed
                              ];
                            },
                            onSelected: (value) {
                              // Xử lý giá trị được chọn ở đây
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22), // Đặt padding 20 đơn vị ở cả hai bên
                    child: Container(
                       // Độ dài của đường kẻ
                      height: 1,   // Độ rộng của đường kẻ
                      color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                    ),
                  ),
                  SizedBox(height: 16.3),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22, top: 0),
                        child: Text(
                          'Pament',
                          style: TextStyle(
                            fontSize: 15.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 215.5, top: 0),
                            child: Image.asset(
                              'assets/visa.png', // Đường dẫn tới hình ảnh biểu tượng Visa
                              width: 24, // Độ rộng mong muốn của biểu tượng
                              height: 24, // Độ cao mong muốn của biểu tượng
                            ),
                          ),

                          SizedBox(
                            width: 8, // Kích thước chiều rộng mong muốn
                          ),
                          PopupMenuButton(
                            child: const RotatedBox(
                              quarterTurns: 2, // Xoay icon 180 độ (mũi tên chỉ sang phải)
                              child: Icon(Icons.arrow_back_ios, size: 19),
                              // Icon mũi tên quay lại
                            ),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Option 1'),
                                  value: 1,
                                ),
                                const PopupMenuItem(
                                  child: Text('Option 2'),
                                  value: 2,
                                ),
                                // Add more PopupMenuItems as needed
                              ];
                            },
                            onSelected: (value) {
                              // Xử lý giá trị được chọn ở đây
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22), // Đặt padding 20 đơn vị ở cả hai bên
                    child: Container(
                      // Độ dài của đường kẻ
                      height: 1,   // Độ rộng của đường kẻ
                      color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                    ),
                  ),
                  SizedBox(height: 16.3),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22, top: 0),
                        child: Text(
                          'Promo Code',
                          style: TextStyle(
                            fontSize: 15.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5, // Kích thước chiều rộng mong muốn
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 102.5, top: 0),
                            child: Text(
                              'Pick discount',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8, // Kích thước chiều rộng mong muốn
                          ),
                          PopupMenuButton(
                            child: const RotatedBox(
                              quarterTurns: 2, // Xoay icon 180 độ (mũi tên chỉ sang phải)
                              child: Icon(Icons.arrow_back_ios, size: 19),
                              // Icon mũi tên quay lại
                            ),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Option 1'),
                                  value: 1,
                                ),
                                const PopupMenuItem(
                                  child: Text('Option 2'),
                                  value: 2,
                                ),
                                // Add more PopupMenuItems as needed
                              ];
                            },
                            onSelected: (value) {
                              // Xử lý giá trị được chọn ở đây
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22), // Đặt padding 20 đơn vị ở cả hai bên
                    child: Container(
                      // Độ dài của đường kẻ
                      height: 1,   // Độ rộng của đường kẻ
                      color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                    ),
                  ),
                  SizedBox(height: 16.3),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22, top: 0),
                        child: Text(
                          'Total Cost',
                          style: TextStyle(
                            fontSize: 15.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 163.5, top: 0),
                            child: Text(
                              '\$120.96',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5, // Kích thước chiều rộng mong muốn
                          ),
                          PopupMenuButton(
                            child: const RotatedBox(
                              quarterTurns: 2, // Xoay icon 180 độ (mũi tên chỉ sang phải)
                              child: Icon(Icons.arrow_back_ios, size: 19),
                              // Icon mũi tên quay lại
                            ),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Option 1'),
                                  value: 1,
                                ),
                                const PopupMenuItem(
                                  child: Text('Option 2'),
                                  value: 2,
                                ),
                                // Add more PopupMenuItems as needed
                              ];
                            },
                            onSelected: (value) {
                              // Xử lý giá trị được chọn ở đây
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22), // Đặt padding 20 đơn vị ở cả hai bên
                    child: Container(
                      // Độ dài của đường kẻ
                      height: 1,   // Độ rộng của đường kẻ
                      color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                    ),
                  ),
                  SizedBox(height: 16.3),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22, top: 0),
                        child: RichText(
                          text: TextSpan(
                            text: 'By placing an order you agree to our\n',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF7C7C7C),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms',
                                style: TextStyle(
                                  color: Colors.black, // Màu đen cho từ "Terms"
                                ),
                              ),
                              TextSpan(
                                text: ' And ',
                                style: TextStyle(
                                  color: Color(0xFF7C7C7C), // Giữ màu cũ cho từ "And"
                                ),
                              ),
                              TextSpan(
                                text: 'Conditions',
                                style: TextStyle(
                                  color: Colors.black, // Màu đen cho từ "Conditions"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 18, top: 23.8,right: 18), // Khoảng cách từ mép phải và từ dưới
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OrderAccepted()), // Chuyển sang màn hình signin
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
                        'Place Order',
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
