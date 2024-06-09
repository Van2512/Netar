import 'package:flutter/material.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/orderaccepted/OrderAccepted.dart';
import 'package:myapp/presentation/admin/dashboard.dart';
import 'package:myapp/presentation/admin/product/product.dart';
import 'package:myapp/presentation/admin/product/qlproduct.dart';

import '../cart/Cart.dart';
import '../explore/ExploreScreen.dart';
import '../favourite/Favorites.dart';
import '../login/Login.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _Account createState() => _Account();
}

class _Account extends State<Account> {
  int myIndex = 4;
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
            SizedBox(height: 65),
            const Row(
              children: <Widget>[
                SizedBox(width: 24.8),
                CircleAvatar(
                  radius: 27.5,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(width: 20.0),
                Expanded( // Wrap text and icon in an Expanded widget
                  child: Column( // Use Column for vertical stacking
                    crossAxisAlignment: CrossAxisAlignment.start, // Align content left
                    children: [ // Add spacing between text elements
                      Row( // Use Row for horizontal placement of icon and text
                        children: [
                         // Add horizontal spacing
                          Text(
                            'Vandnt',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.5,
                            ),
                          ),
                          SizedBox(width: 13.0),
                          Icon(
                            Icons.mode_edit_outlined,
                            size: 17.1,
                            color: Color(0xFF53B175),
                          ),
                        ],
                      ),
                      Text(
                        'vandang25122003@gmail.com',
                        style: TextStyle( // Customize style if needed (optional)
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Container(
              width: double.infinity,
              height: 580,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => DashBoardScreen()),
                              // MaterialPageRoute(builder: (context) => ProductScreen()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined, // Icon Orders
                                size: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 13), // Khoảng cách giữa icon và văn bản
                              Text(
                                'Orders',
                                style: TextStyle(
                                  fontSize: 15.8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 218, // Kích thước chiều rộng mong muốn
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
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeProduct()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined, // Icon Orders
                                size: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 13), // Khoảng cách giữa icon và văn bản
                              Text(
                                'My Details',
                                style: TextStyle(
                                  fontSize: 15.8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 190, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined, // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'Delivery Address',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 141.5, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_money_sharp, // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'Payment Methods',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130.5, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.card_giftcard_outlined , // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'Promo Cord',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 175, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_none, // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'Notifecations',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 164, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline, // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'Help',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 228, // Kích thước chiều rộng mong muốn
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.description_outlined, // Thêm icon Orders
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13), // Thêm khoảng trống giữa icon và văn bản
                            Text(
                              'About',
                              style: TextStyle(
                                fontSize: 15.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 215.8, // Kích thước chiều rộng mong muốn
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
                  Container(
                    margin: EdgeInsets.only(left: 18, top: 23.8,right: 18), // Khoảng cách từ mép phải và từ dưới
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()), // Chuyển sang màn hình signin
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(330, 57), // Đặt kích thước cố định cho nút
                        backgroundColor: const Color(0xFFF2F3F2), // Đặt màu nền cho nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout, // Thêm icon Log out
                            size: 20,
                            color: Color(0xFF53B175),
                          ),
                          SizedBox(width: 10), // Thêm khoảng trống giữa icon và văn bản
                          Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 16, // Đặt kích thước văn bản là 16px
                              color: Color(0xFF53B175), // Đặt màu văn bản là màu trắng
                            ),
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
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
                if (index == 0) {
                  Navigator.push(
                    context, // Build context of the widget
                    MaterialPageRoute(builder: (context) => ShopScreen()),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context, // Build context of the widget
                    MaterialPageRoute(builder: (context) => ExploreScreen()),
                  );
                }
                if (index == 2) { // Đây là vị trí của mục "Cart"
                  Navigator.push(
                    context, // Build context của widget hiện tại
                    MaterialPageRoute(builder: (context) => Cart()), // Chuyển hướng đến màn hình giỏ hàng
                  );
                }
                if (index == 3) { // Đây là vị trí của mục "Cart"
                  Navigator.push(
                    context, // Build context của widget hiện tại
                    MaterialPageRoute(builder: (context) => Favorites()), // Chuyển hướng đến màn hình giỏ hàng
                  );
                }
                if (index == 4) { // Đây là vị trí của mục "Cart"
                  Navigator.push(
                    context, // Build context của widget hiện tại
                    MaterialPageRoute(builder: (context) => Account()), // Chuyển hướng đến màn hình giỏ hàng
                  );
                }
                // Handle navigation for other items similarly
              },
              currentIndex: myIndex,
              fixedColor: Color(0xFF53B175),
              showUnselectedLabels: true,
              unselectedItemColor: Colors.black,
              selectedFontSize: 11.5,
              unselectedFontSize: 11.5,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
              selectedLabelStyle: TextStyle(color: Color(0xFF53B175), fontWeight: FontWeight.w500),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.storefront_outlined,
                    color: myIndex == 0 ? Color(0xFF53B175) : Colors.black,
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.manage_search_outlined,
                    color: myIndex == 1 ? Color(0xFF53B175) : Colors.black,
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: myIndex == 2 ? Color(0xFF53B175) : Colors.black,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: myIndex == 3 ? Color(0xFF53B175) : Colors.black,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: myIndex == 4 ? Color(0xFF53B175) : Colors.black,
                  ),
                  label: 'Account' ,
                ),
                // ... other items
              ],
            ),
          ),
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
