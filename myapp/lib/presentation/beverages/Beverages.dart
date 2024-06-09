import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/presentation/beverages/filters/Filters.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/productdetail/ProductDetail.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/signin/signin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import '../../network/data_list.dart';
import '../../network/res_client.dart';

class Beverages extends StatefulWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  _Beverages createState() => _Beverages();
}

class _Beverages extends State<Beverages> {
  final RestClient restClient = RestClient();
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
    _loadData();
    super.initState();
  }
  Future<void> _loadData() async {
    await restClient.imageformdb(); // Gọi phương thức imageformdb() từ restClient để tải dữ liệu
    setState(() {}); // Cập nhật lại UI sau khi dữ liệu đã được tải
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
            SizedBox(height: 31),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5.5), // Lề bên phải 10px
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20, // Kích thước của icon quay lại
                      color: Colors.black, // Màu sắc của icon quay lại
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 88.6),
                  child: const Text(
                    'Beverages',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 87), // Lề phải 10px (optional)
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // Set to true for full screen
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width, // Full screen height
                              child: Filters(), // Sử dụng widget của màn hình Filters
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.tune,
                      size: 20, // Kích thước của icon quay lại
                      color: Colors.black, // Màu sắc của icon quay lại
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Positioned(
              child: Center(
                child: Container(
                  height: 1075.5,
                  padding: const EdgeInsets.only(left: 9.7, right: 7, bottom: 1.2),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Số lượng cột mong muốn
                        crossAxisSpacing: 10, // Khoảng cách giữa các cột
                        mainAxisSpacing: 7, // Khoảng cách giữa các hàng
                        childAspectRatio: 164.5 / 216.5,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: restClient.record.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7.8, vertical: 2),
                          padding: EdgeInsets.symmetric(horizontal: 7.4),
                          decoration: BoxDecoration(
                            color: Color(restClient.record[index]["color"] ?? 0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(restClient.record[index]["color"] ?? 0xFFFFFFFF),
                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)), // Thêm đường viền
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 23),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
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
                                wrapText(restClient.record[index]['uname'] ?? ''),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                restClient.record[index]["uquantity"] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF7C7C7C),
                                  fontSize: 11.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${restClient.record[index]["uprice"] ?? ''}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.3,
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
          ],
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

