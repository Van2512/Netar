import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/presentation/login/Login.dart';
import 'package:myapp/presentation/home/ShopScreen.dart';
import 'package:myapp/presentation/signin/signin.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  final String uquantity;
  final String uname;
  final String uprice;
  final String image;

  const ProductDetail({
    required this.uquantity,
    required this.uname,
    required this.uprice,
    required this.image,
  });

  @override
  _ProductDetail createState() => _ProductDetail();
}

class _ProductDetail extends State<ProductDetail> {
  int _counter = 1;
  List imageList = [
    {"id": 1, "image_path": 'assets/appeBig.png'},
    {"id": 2, "image_path": 'assets/appeBig.png'},
    {"id": 3, "image_path": 'assets/appeBig.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  String dropdownValue = 'Banasree';
  String dropdownValueArea = 'Types of your area';
  TextEditingController codeController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }
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
      backgroundColor: Colors.white,
      body: Stack(
        children:[
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 326,
                margin: EdgeInsets.only(bottom: 100), // Khoảng cách 100px dưới Container này
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F2), // Màu #F2F3F2
                  borderRadius: BorderRadius.circular(29), // Bo góc với bán kính là 29
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Positioned(
            top: 35,
            right: 7,
            left: 7,// Điều chỉnh vị trí dọc của văn bản so với phía trên màn hình
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0), // Khoảng cách lề trái và lề phải của Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Xử lý khi nhấn nút quay lại
                    },
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShopScreen()), // Chuyển sang màn hình shop
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 21, // Kích thước của icon quay lại
                        color: Colors.black, // Màu sắc của icon quay lại
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Xử lý khi nhấn nút chia sẻ
                    },
                    child: IconButton(
                      onPressed: () {
                        // Xử lý khi nhấn nút chia sẻ
                      },
                      icon: const Icon(
                        Icons.ios_share_outlined,
                        size: 21, // Kích thước của icon chia sẻ
                        color: Colors.black, // Màu sắc của icon chia sẻ
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 89,
            left: 0,
            right: 0,
            child: Container(
              width: 385,
              height: 179.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.fill,
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
          ),
          Positioned(
            top: 300.5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 14.4 : 3.5,
                    height: 3.2,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: currentIndex == entry.key
                          ? Color(0xFF53B175)
                          : Color(0xFFAAA59E),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 340.5,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Đặt độ bo tròn cho container
                // Thêm đường viền cho container
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.uname}',
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Color(0xFF7C7C7C),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 373.5,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Đặt độ bo tròn cho container
                // Thêm đường viền cho container
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1kg, Price',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                        color: Color(0xFF7C7C7C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 421,
            left: 8.2,
            right: 8.3,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_rounded),
                      onPressed: _decrementCounter,
                      color: Color(0xFF7C7C7C),
                    ),
                    Container(
                      // Đặt khoảng cách từ văn bản đến đường viền
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2), width: 1),
                        borderRadius: BorderRadius.circular(14.2), // Bo tròn góc của đường viền
                      ),
                      height: 38.0, // Set chiều cao
                      width: 38,
                      child: Center(
                        child: Text(
                          '$_counter',
                          style: TextStyle(fontSize: 14.5),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_rounded),
                      onPressed: _incrementCounter,
                      color: Color(0xFF53B175),
                    ),
                    SizedBox(width: 148.3),
                     Text(
                      '${widget.uprice}',
                      style: TextStyle(fontSize: 20.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 14), // Thêm thanh ngang
                Container(
                  height: 0.18,
                  color: Color(0xFF7C7C7C),
                  width: 323.1,
                ),
              ],
            ),
          ),
          Positioned(
            top: 485.5,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Đặt độ bo tròn cho container
                // Thêm đường viền cho container
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product Detail',
                    style: TextStyle(
                      fontSize: 15.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Transform.rotate(
                    angle: 270 * 3.14 / 180, // Đổi 90 độ thành radian
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 17.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 526.5,
            left: 23,
            right: 0,
            child: Container(
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apples are nutritious. Apples may be good for weight loss.\nApples may be good for your heart. As part of a healtful\nAnd varied diet.',
                    style: TextStyle(
                      fontSize: 11.9,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7C7C7C),
                    ),
                    // Set text alignment to start
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

            ),
          ),
          Positioned(
              top: 597,
              left: 23,
              right: 23,
              child:
              Container(
                 height: 0.18,
                 color: Color(0xFF7C7C7C),
                 width: 323.1,
          )
          ),
          Positioned(
            top: 596.1,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Đặt độ bo tròn cho container
                // Thêm đường viền cho container
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nutritions',
                    style: TextStyle(
                      fontSize: 15.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 180), // Khoảng cách 10px từ hình ảnh đến bên trái
                    child: Image.asset(
                      'assets/size100.png',
                      width: 35, // Đặt chiều rộng hình ảnh
                      height: 35, // Đặt chiều cao hình ảnh
                    ),
                  ),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180, // Đổi 90 độ thành radian
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 17.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 652,
              left: 23,
              right: 23,
              child:
              Container(
                height: 0.18,
                color: Color(0xFF7C7C7C),
                width: 323.1,
              )
          ),
          Positioned(
            top: 657.7,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Review',
                    style: TextStyle(
                      fontSize: 15.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 140), // Khoảng cách từ rating bar đến bên trái
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18.5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Color(0xFFF3603F), // Đổi màu thành #F3603F

                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180, // Đổi 90 độ thành radian
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 17.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 706,
            left:23,
            right: 23,
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
                'Add To Basket',
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


}

