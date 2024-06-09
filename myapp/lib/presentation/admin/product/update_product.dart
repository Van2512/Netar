import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/presentation/admin/product/product_list.dart';
import '../../login/Login.dart';
import '../../home/ShopScreen.dart';
import '../../../constant/assets.dart';
import '../../../core/widgets/AppIconWidget.dart';
import '../../../core/widgets/rounded_button_widget.dart';
import '../../../core/widgets/textfield_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../network/res_client.dart';
import 'product.dart';
import '../../slideMenu/NavBar.dart';

class UpdateProductScreen extends StatefulWidget {
  late String uname;
  late String uprice;
  late String uquantity;
  late String uid;
  late String image;

  UpdateProductScreen(
      this.uname, this.uquantity, this.uprice, this.uid, this.image);

  @override
  State<UpdateProductScreen> createState() =>
      _UpdateProductScreenState(uname, uprice, uquantity, uid, image);
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late String name, price, quantity, uid, image;
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
  _UpdateProductScreenState(
      this.name, this.price, this.quantity, this.uid, this.image);

  final RestClient restClient = RestClient();
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _uquantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();
  String? imageName;
  String? imageData;

  Future<void> updateRecord() async {
    try {
      String uri = "http://192.168.1.2/detar/updae_data.php";
      var res = await http.post(Uri.parse(uri), body: {
        "uname": _nameController.text,
        "uprice": _priceController.text,
        "uquantity": _uquantityController.text,
        "uid": uid,
        "data": imageData!,
        "name": imageName!
      });

      // Debug print for response body
      print("Response body: ${res.body}");

      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PostListScreen()));
      } else {
        print("Update failed: ${response["error"] ?? "Unknown error"}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        imageName = pickedImage.path.split('/').last;
        imageData = base64Encode(_image!.readAsBytesSync());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = name;
    _uquantityController.text = quantity;
    _priceController.text = price;
    downloadImageFromUrl();
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLanguageButton(),
      SizedBox(width: 25),
    ];
  }

  Widget _buildLanguageButton() {
    return const CircleAvatar(
      radius: 19.8,
      backgroundImage: AssetImage('assets/avatar.jpg'),
    );
  }

  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildLeftSide(),
              ),
              Expanded(
                flex: 1,
                child: _buildRightSide(),
              ),
            ],
          )
              : Container(
            alignment: Alignment.topCenter,
            child: _buildRightSide(),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 1.0), // Set the background color to RGB(244, 244, 244)
                  borderRadius: BorderRadius.circular(15), // Set the border radius to 15
                ),
                padding: EdgeInsets.symmetric(horizontal: 89.5, vertical: 0),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 115,
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.network(
                        "http://192.168.1.2/detar/$image",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 22,
                      right: 7,
                      child: GestureDetector(
                        onTap: () {
                          _openImagePicker();
                        },
                        child: Container(
                          child: Center(
                            child: CircleAvatar(
                              radius: 7,
                              backgroundImage: AssetImage('assets/pencil.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildUserIdField(),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildPasswordField(),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildPrice(),
                ),
              ],
            ),
            SizedBox(height: 23),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
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
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Đặt độ bo tròn cho container
                  // Thêm đường viền cho container
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Apples are nutritious. Apples may be good for.\n weight loss.',
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
            SizedBox(height: 10),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      margin: EdgeInsets.only(left: 150), // Khoảng cách 10px từ hình ảnh đến bên trái
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
            SizedBox(height: 8),
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
                      margin: EdgeInsets.only(left: 100), // Khoảng cách từ rating bar đến bên trái
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
            SizedBox(height: 15.5),
            Positioned(
              top: 706,
              left:23,
              right: 23,
              child: ElevatedButton(
                onPressed: () {
                  updateRecord();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(330, 57), backgroundColor: Colors.black, // Đặt màu nền cho nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
                  ),
                ),
                child: const Text(
                  'Update Product',
                  style: TextStyle(
                    fontSize: 16, // Đặt kích thước văn bản là 15px
                    color: Colors.white, // Đặt màu văn bản là màu trắng
                  ),
                ),
              ),
            ),
            SizedBox(height: 23.0),
            Container(
              height: 0.18,
              color: Color(0xFF7C7C7C),
            ),
            SizedBox(height: 12.0),
            _buildButtonRounded(),
            SizedBox(height: 2.0),
            _buildButtonImage(),
          ],
        ),
      ),

    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          inputType: TextInputType.emailAddress,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _nameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onFieldSubmitted: (value) {
            // Handle next focus
          }, errorText: '',
          decoration: InputDecoration(
            counterText: '',
            icon: Image.asset('assets/namefruit.png', height: 20, width: 20),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),

        );
      },
    );
  }

  Widget _buildPrice() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          inputType: TextInputType.number,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _priceController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onFieldSubmitted: (value) {
            // Handle next focus
          }, errorText: '',
          decoration: const InputDecoration(
            counterText: '',
            icon: Icon(Icons.price_change, color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),

        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          icon: Image.asset('assets/fruitquantily.png', height: 20, width: 24),
          textController: _uquantityController,
          errorText: '',
          cursorColor: Colors.black, // Set the cursor color to black
          decoration: InputDecoration(
            counterText: '',
            icon: Image.asset('assets/fruitquantily.png', height: 20, width: 20),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        );
      },
    );
  }


  Widget _buildButtonRounded() {
    return RoundedButtonWidget(
      buttonText: 'Insert Products',
      buttonColor: Color(0xFF000000),
      textColor: Colors.white,
      onPressed: () {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen()),
        );
      },
    );
  }

  Widget _buildButtonImage() {
    return RoundedButtonWidget(
      buttonText: 'Disabled Product',
      buttonColor:   Color(0xFFF3603F),
      textColor: Colors.white,
      onPressed: () {
        deteteData(uid);
      },
    );
  }
  Future<void> deteteData(String uid)async{
    try{
      String uri = "http://192.168.1.10/detar/delete_data.php";
      var res = await http.post(Uri.parse(uri),body:{ "uid":uid});
      var response = jsonDecode(res.body);
      if (response["success"]=="true"){
        print("Record updated with ID: $uid");
        print("record deleted");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostListScreen()),
        );
      }else{
        print("some issue");
      }

    }catch(e){
      print(e);
    }
  }
  Future<void> downloadImageFromUrl() async {
    try {
      var response = await http.get(Uri.parse("http://192.168.1.10/detar/$image"));
      if (response.statusCode == 200) {
        // Lấy dữ liệu hình ảnh từ response và thêm vào imageList
        Map<String, dynamic> image = {
          "id": imageList.length + 1, // ID của hình ảnh mới
          "image_path": "data:image/png;base64,${base64Encode(response.bodyBytes)}" // Dữ liệu base64 của hình ảnh
        };
        setState(() {
          imageList.add(image); // Thêm hình ảnh mới vào imageList
        });
      } else {
        print('Error downloading image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    _uquantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
