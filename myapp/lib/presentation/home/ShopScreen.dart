import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/presentation/account/Account.dart';
import 'package:myapp/presentation/cart/Cart.dart';
import 'package:myapp/presentation/explore/ExploreScreen.dart';
import 'package:myapp/presentation/favourite/Favorites.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/productdetail/ProductDetail.dart';
import 'package:myapp/presentation/signin/signin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import '../../network/data_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../network/res_client.dart';
class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreen createState() => _ShopScreen();
}

class _ShopScreen extends State<ShopScreen> {
  final RestClient restClient = RestClient();
  int myIndex = 0;
  List imageList = [
    {"id": 1, "image_path": 'assets/banner.png'},
    {"id": 2, "image_path": 'assets/banner.png'},
    {"id": 3, "image_path": 'assets/banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  var jsonList;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
  List<dynamic> exclusiveOfferList = [];
  List<dynamic> bestSellingList = [];
  List<dynamic> groceriesList = [];
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
    _loadData();
    getData();
  }
  Future<void> _loadData() async {
    await restClient.imageformdb(); // Gọi phương thức imageformdb() từ restClient để tải dữ liệu
    setState(() {}); // Cập nhật lại UI sau khi dữ liệu đã được tải
  }
  void getData() async {
    try {
      var response = await Dio().get("https://muanhanh365.vn/home.json");
      if (response.statusCode == 200) {
        List<dynamic> categories = response.data["category"];
        // Lấy danh sách các mặt hàng từ danh mục "Exclusive Offer" (id: 1)
        List<dynamic> exclusiveOfferItems = [];
        categories.forEach((category) {
          if (category["id"] == 1) {
            exclusiveOfferItems.addAll(category["data"]);
          }
        });

        // Lấy danh sách các mặt hàng từ danh mục "Best Selling" (id: 2)
        List<dynamic> bestSellingItems = [];
        categories.forEach((category) {
          if (category["id"] == 2) {
            bestSellingItems.addAll(category["data"]);
          }
        });

        // Lấy danh sách các mặt hàng từ danh mục "Groceries" (id: 20)
        List<dynamic> groceriesItems = [];
        categories.forEach((category) {
          if (category["id"] == 20) {
            groceriesItems.addAll(category["data"]);
          }
        });

        // Lưu trữ danh sách các mặt hàng vào các biến tương ứng
        exclusiveOfferList = exclusiveOfferItems;
        bestSellingList = bestSellingItems;
        groceriesList = groceriesItems;
        setState(() {
          // Gọi setState để cập nhật giao diện sau khi lấy dữ liệu
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
            SizedBox(height: 38), // Add some space between text and image
            // Add your image here
            Image.asset(
              'assets/iclogo2.png', // Đường dẫn đến tệp hình ảnh của bạn
              width: 26, // Đặt chiều rộng của hình ảnh
              height: 28, // Đặt chiều cao của hình ảnh
              fit: BoxFit.contain, // Thay đổi tỷ lệ khung hình ảnh
            ),
            SizedBox(height: 9),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 18,
                ),
                SizedBox(width: 5), // Add some space between icon and text
                Text(
                  'Dhaka, Banassre',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
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
                  SizedBox(height: 15),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Stack(  // Use Stack for overlapping widgets
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 118.0,
                          child: ClipRRect(  // Clip the corners of the Container
                            borderRadius: BorderRadius.circular(8.0),
                            child: CarouselSlider(
                              items: imageList
                                  .map(
                                    (item) => Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.fill, // Chỉnh fit thành none để hiển thị hình ảnh theo kích thước gốc
                                ),
                              )
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                autoPlay: true,
                                aspectRatio: 2,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(  // Position the indicator dots below the carousel
                          bottom: 8.0,  // Adjust for desired spacing
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: currentIndex == entry.key ? 18 :5,
                                  height: 5.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3.0,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: currentIndex == entry.key
                                          ? Color(0xFF53B175)
                                          : Color(0xFFAAA59E)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.7), // Left padding
                  child: Text(
                    'Exclusive Offer',
                    style: TextStyle(
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0), // Right padding
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14.7,
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Center(
                child: Container(
                  height: 255,
                  padding: const EdgeInsets.only(left: 9.7, right: 7),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView.builder(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: restClient.record.length,
                      itemBuilder: (context, index) {

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: 158,
                          margin: EdgeInsets.symmetric(horizontal: 7.8, vertical: 17.3),
                          padding: EdgeInsets.symmetric(horizontal: 10.4),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF), // Màu trắng
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFFFFFF), // Màu trắng
                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end, // Đặt hình ảnh ở phía bên phải
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20), // Áp dụng margin để đẩy hình ảnh sang phải
                                    child: Image.network(
                                      "http://192.168.1.2/detar/" +
                                          (restClient.record[index]["image"] ??
                                              "assets/default_image.png"),
                                      height: 70,
                                      width: 94,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14.5),
                              Text(
                                wrapText(restClient.record[index]['uname'] ?? ''), // Hiển thị tên mặt hàng
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                restClient.record[index]["uquantity"] ?? "", // Hiển thị thông tin bổ sung
                                style: const TextStyle(
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 11.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${restClient.record[index]["uprice"] ?? ""}", // Hiển thị giá với ký hiệu đồng tiền $
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.3,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 35.1),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Lấy dữ liệu từ restClient.record[index]
                                        var record = restClient.record[index];

                                        // Điều hướng sang màn hình ProductDetail và truyền dữ liệu
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                              uquantity: record["uquantity"],
                                              uname: record["uname"],
                                              uprice: record["uprice"],
                                              image: record["image"] ?? "assets/default_image.png", // Nếu không có image, sử dụng ảnh mặc định
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0),
                                        ),
                                        backgroundColor: Color(0xFF53B175),
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(39, 39),
                                        maximumSize: Size(39, 39),
                                      ),
                                      child: const SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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

            SizedBox(height: 7),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.7), // Left padding
                  child: Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0), // Right padding
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14.7,
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Center(
                child: Container(
                  height: 255,
                  padding: const EdgeInsets.only(left: 9.7,right: 7),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView.builder(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: datacoca == null ? 0 : datacoca.length,
                      itemBuilder: (context, index) {
                        var item = datacoca[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: 154.5,
                          margin: EdgeInsets.symmetric(horizontal: 7.8, vertical: 17.3),
                          padding: EdgeInsets.symmetric(horizontal: 10.4),
                          decoration: BoxDecoration(
                            color: Color(item["color"] ?? 0xFFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(item["color"] ?? 0xFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định
                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)),// Thay đổi màu của đường viền thành E2E2E2
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end, // Đặt hình ảnh ở phía bên phải
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20), // Áp dụng margin để đẩy hình ảnh sang phải
                                    child: Image.asset(
                                      item["image"] ?? "assets/default_image.png", // Mặc định ảnh mặc định nếu không có ảnh được xác định
                                      height: 70,
                                      width: 94,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14.5),
                              Text(
                                item["title"] ?? "Untitled", // Mặc định tiêu đề nếu không có tiêu đề được xác định
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                item["additionalInfo"] ?? "", // Sử dụng thông tin bổ sung
                                style: const TextStyle(
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 11.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item["price"] ?? ""}", // Hiển thị giá và tiền tệ
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.3,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 39.1), // Add left padding
                                    child:  ElevatedButton(
                                      onPressed: () {
                                        // Handle button press event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0),  // Set corner radius to 5
                                        ),
                                        backgroundColor: Color(0xFF53B175),  // Set background color
                                        padding: EdgeInsets.zero,  // Remove default padding
                                        minimumSize: Size(39, 39),  // Set desired size
                                        maximumSize: Size(39, 39),  // Set desired size (optional)
                                      ),
                                      child: const SizedBox(
                                        width: double.infinity,  // Use full width within button
                                        height: double.infinity, // Use full height within button
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.7), // Left padding
                  child: Text(
                    'Groceries',
                    style: TextStyle(
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0), // Right padding
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14.7,
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Center(
                child: Container(
                  height: 140,
                  padding: const EdgeInsets.only(left: 9.7,right: 6.5),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView.builder(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: data2 == null ? 0 : data2.length,
                      itemBuilder: (context, index) {
                        var item = data2[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: 209.5,
                          margin: EdgeInsets.symmetric(horizontal: 7.8, vertical: 10.3),
                          // Use a Row to place image and title side-by-side
                          decoration: BoxDecoration(
                            color: Color(item["color"] ?? 0xFFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(item["color"] ?? 0xFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định

                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)),// Thay đổi màu của đường viền thành E2E2E2
                          ),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align image and title vertically
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 19.0,left: 6),
                                  child: Image.asset(
                                    item["image"] ?? "assets/default_image.png",
                                    height: 75,
                                    width: 75,
                                  ),
                                ),
                                Expanded( // Use Expanded to fill remaining space
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 44.0,left: 10.4), // Adjust padding for vertical alignment
                                    child: Text(
                                      item["title"] ?? "Untitled",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
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
            Positioned(
              child: Center(
                child: Container(
                  height: 238,
                  padding: const EdgeInsets.only(left: 9.7,right: 7),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView.builder(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: data3.length,
                      itemBuilder: (context, index) {
                        var item = data3[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: 154.5,
                          margin: EdgeInsets.symmetric(horizontal: 7.8, vertical: 7.3),
                          padding: EdgeInsets.symmetric(horizontal: 10.4),
                          decoration: BoxDecoration(
                            color: Color(item["color"] ?? 0xFFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(item["color"] ?? 0xFFFFFFF), // Mặc định màu trắng nếu không có màu được xác định

                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)),// Thay đổi màu của đường viền thành E2E2E2
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end, // Đặt hình ảnh ở phía bên phải
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20), // Áp dụng margin để đẩy hình ảnh sang phải
                                    child: Image.asset(
                                      item["image"] ?? "assets/default_image.png", // Mặc định ảnh mặc định nếu không có ảnh được xác định
                                      height: 70,
                                      width: 94,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14.5),
                              Text(
                                item["title"] ?? "Untitled", // Mặc định tiêu đề nếu không có tiêu đề được xác định
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                item["additionalInfo"] ?? "", // Sử dụng thông tin bổ sung
                                style: const TextStyle(
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 11.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${item["price"] ?? ""}", // Hiển thị giá và tiền tệ
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.3,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 39.1), // Add left padding
                                    child:  ElevatedButton(
                                      onPressed: () {
                                        // Handle button press event here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0),  // Set corner radius to 5
                                        ),
                                        backgroundColor: Color(0xFF53B175),  // Set background color
                                        padding: EdgeInsets.zero,  // Remove default padding
                                        minimumSize: Size(39, 39),  // Set desired size
                                        maximumSize: Size(39, 39),  // Set desired size (optional)
                                      ),
                                      child: const SizedBox(
                                        width: double.infinity,  // Use full width within button
                                        height: double.infinity, // Use full height within button
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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

