import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/presentation/favourite/checkout/CheckOut.dart';
import 'package:myapp/presentation/beverages/filters/Filters.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/productdetail/ProductDetail.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/signin/signin.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../account/Account.dart';
import '../cart/Cart.dart';
import '../explore/ExploreScreen.dart';
import '../../network/data_list.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _Favorites createState() => _Favorites();
}

class _Favorites extends State<Favorites> {
  int _counter = 1;
  int myIndex = 3;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }
  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 31),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 151,top: 10),
                  child: const Text(
                    'Favorites',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.9),
            Container(
              width: double.infinity, // Độ dài của đường kẻ
              height: 1,   // Độ rộng của đường kẻ
              color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
            ),
            Positioned(
              child: Center(
                child: Container(
                  height: 563.5,
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child:ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: datacoca.length,
                      itemBuilder: (context, index) {
                        var item = datacoca[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(item["color"] ?? 0xFFFFFFFF),
                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: Column(
                            children: [
                              // Phần tử đầu tiên
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Image.asset(
                                          item["image"] ?? "assets/default_image.png",
                                          height: 70,
                                          width: 94,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10,right: 12), // Khoảng cách từ phía trên của title là 1 pixel
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item["title"] ?? "Untitled",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.favorite_outlined),
                                                    onPressed: () {
                                                      // Xử lý sự kiện khi icon close được nhấn
                                                    },
                                                    color: Color(0xFF53B175),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom:10,right: 28), // Khoảng cách từ phía trên của title là 1 pixel
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item["additionalInfo"] ?? "Untitled",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Color(0xFF7C7C7C),
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${item["price"] ?? ""}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.3,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const RotatedBox(
                                                    quarterTurns: 2, // Xoay icon 180 độ (mũi tên chỉ sang phải)
                                                    child: Icon(Icons.arrow_back_ios, size: 19),
                                                    // Icon mũi tên quay lại
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 22),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Đường kẻ dưới phần tử thứ hai
                              Container(
                                width: 308, // Độ dài của đường kẻ
                                height: 1,   // Độ rộng của đường kẻ
                                color: Color(0xFFE2E2E2), // Màu sắc của đường kẻ
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
         
            Container(
              margin: EdgeInsets.only(top: 0),
              child: ElevatedButton(
                onPressed: () {
                  // Hiển thị bottom sheet khi nhấn vào nút
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Set to true for full screen
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                        child: Container(
                          height: 454,
                          width: MediaQuery.of(context).size.width, // Full screen height
                          child: CheckOut(), // Sử dụng widget của màn hình Filters
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(105.5, 0, 20, 0),
                  fixedSize: const Size(330, 57), // Đặt kích thước cố định cho nút
                  backgroundColor: const Color(0xFF53B175), // Đặt màu nền cho nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đặt cách đều giữa các phần tử
                  children: [
                    const Text(
                      'Add All To Cart',
                      style: TextStyle(
                        fontSize: 16, // Đặt kích thước văn bản là 16px
                        color: Colors.white, // Đặt màu văn bản là màu trắng
                      ),
                    ),

                  ],
                ),
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
                  if (index == 2) {
                    Navigator.push(
                      context, // Build context of the widget
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  }
                  if (index == 3) {
                    Navigator.push(
                      context, // Build context of the widget
                      MaterialPageRoute(builder: (context) => Favorites()),
                    );
                  }
                  if (index == 4) {
                    Navigator.push(
                      context, // Build context of the widget
                      MaterialPageRoute(builder: (context) => Account()),
                    );
                  }
                });
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
}

