import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/presentation/beverages/Beverages.dart';
import 'package:myapp/presentation/cart/Cart.dart';
import 'package:myapp/presentation/favourite/Favorites.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreen createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  int myIndex = 1;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
  var jsonList;

  List<Color> borderColorList = [
    Color(0xFF82C798), // Phần tử 1: F79B99
    Color(0xFFFBBD7D), // Phần tử 2: FBBD7D
    Color(0xFFF7A593), // Phần tử 3: F7A593
    Color(0xFFD3B0E0), // Phần tử 4: D3B0E0
    Color(0xFFFDE598), // Phần tử 5: FDE598
    Color(0xFFB7DFF5), // Phần tử 6: B7DFF5
    Color(0xFFAB9EE8), // Phần tử 7: AB9EE8
    Color(0xFFE08BAC), // Phần tử 8: E08BAC
  ];
  List<Color> backgroundColorList = [
    Color(0xFFEEF8F2), // Phần tử 1: F79B99
    Color(0xFFFFF6EE), // Phần tử 2: FBBD7D
    Color(0xFFFDE8E4), // Phần tử 3: F7A593
    Color(0xFFF4EBF7), // Phần tử 4: D3B0E0
    Color(0xFFFEF8E5), // Phần tử 5: FDE598
    Color(0xFFE7F0F5), // Phần tử 6: B7DFF5
    Color(0xFFE9E5F9), // Phần tử 7: AB9EE8
    Color(0xFFF2DCE5), // Phần tử 8: E08BAC
  ];
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
    getData();
  }
  void getData() async {
    try {
      var response = await Dio().get("https://muanhanh365.vn/category.json");
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data["data"];
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 42),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Find Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 45.0,
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F3F2),
                        hintStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.all(22.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17),
            Positioned(
              child: Center(
                child: Container(
                  height: 575.5,
                  padding: const EdgeInsets.only(left: 9.7, right: 7, bottom: 1.2),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9,

                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: jsonList == null ? 0 : jsonList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Beverages(),
                              ),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            margin: EdgeInsets.symmetric(horizontal: 1.8, vertical: 1),
                            padding: EdgeInsets.symmetric(horizontal: 4.4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColorList[index % 8],
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              color: backgroundColorList[index % 8],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 0),
                                  child: Image.network(
                                    jsonList[index]['imageUrl'],
                                    height: 70,
                                    width: 90,
                                  ),
                                ),
                                SizedBox(height: 19.5),
                            Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                wrapText(jsonList[index]['name']),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                        ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  String wrapText(String text) {
    if (text.length > 11) {
      int splitIndex = text.indexOf(' ', 11);
      if (splitIndex != -1) {
        return '${text.substring(0, splitIndex)}\n${text.substring(splitIndex + 1)}';
      }
    }
    return text;
  }
}
