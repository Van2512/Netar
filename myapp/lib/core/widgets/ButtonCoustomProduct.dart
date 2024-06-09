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


import '../../network/data_list.dart';

class ButtonCoustomProduct extends StatefulWidget {
  const ButtonCoustomProduct({Key? key}) : super(key: key);

  @override
  _ButtonCoustomProduct createState() => _ButtonCoustomProduct();
}

class _ButtonCoustomProduct extends State<ButtonCoustomProduct> {
  int _counter = 1;
  int myIndex = 2;
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
            Positioned(
              child: Center(
                child: Container(
                  height: 83.5,
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: datacoca.length,
                      itemBuilder: (context, index) {
                        var item = datacoca[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            width: 200.0, // Độ rộng của mỗi item trong danh sách ngang
                            child: Card(
                              elevation: 5.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      item["image"] ?? "assets/default_image.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      item["title"] ?? "Untitled",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "\$${item["price"] ?? ""}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
    );
  }
}

