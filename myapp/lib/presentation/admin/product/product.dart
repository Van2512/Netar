import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/admin/product/product_list.dart';
import 'package:myapp/presentation/slideMenu/NavBar.dart';
import '../../../constant/assets.dart';
import '../../../core/widgets/AppIconWidget.dart';
import '../../../core/widgets/rounded_button_widget.dart';
import '../../../core/widgets/textfield_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _nameController = TextEditingController();
  TextEditingController _uquantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File? _image;
  // This is the image picker
  final _picker = ImagePicker();
  String? imageName;
  String? imageData;
  // Implementing the image picker
  Future<void> insertrecord() async{
    if(_nameController.text!="" || _uquantityController.text!="" || _priceController.text!=""){
      try{
        String uri = "http://192.168.1.10/detar/insertproduct.php";
        var res = await http.post(Uri.parse(uri),
            body:{
              "uname": _nameController.text,
              "uprice": _priceController.text,
              "uquantity": _uquantityController.text,
              "data": imageData,
              "name": imageName,
            });
        var response = jsonDecode(res.body);
        if(response["success"]=="true"){
          print("Record Insert");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostListScreen()),
          );
        }else{
          print("Some isssue");
        }
      }catch(e){
        print(e);
      }
    }else{
      print("please fill all ");
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
  //stores:---------------------------------------------------------------------
  // final ThemeStore _themeStore = getIt<ThemeStore>();
  // final FormStore _formStore = getIt<FormStore>();
  // final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
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
  // appbar methods
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0),
            _buildButtonImage(),
            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 104), // Đặt padding 125 đơn vị ở cả hai bên
              child: Container(
                height: 3,   // Độ rộng của đường kẻ
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9), // Màu sắc của đường kẻ
                  borderRadius: BorderRadius.circular(30), // Bo góc 15
                ),
              ),
            ),
            SizedBox(height: 1.0),
            _buildUserIdField(),
            SizedBox(height: 6.0),
            _buildPasswordField(),
            SizedBox(height: 5.0),
            _buildPrice(),
            SizedBox(height: 22.5),
            _buildButtonRounded(),
            // _buildSignInButton()
          ],
        ),
      ),
    );
  }
  Widget _buildUserIdField2() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          inputType: TextInputType.emailAddress,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _nameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          }, errorText: '',
          decoration:  InputDecoration(
            hintText: 'Name', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
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
  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          inputType: TextInputType.emailAddress,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _nameController,
          inputAction: TextInputAction.next,
          errorText: '',
          cursorColor: Colors.black, // Set the cursor color to black
          decoration: InputDecoration(
            hintText: 'Name', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
            counterText: '',
            icon: Icon(Icons.person, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Chỉnh chiều dài ở đây
          ),
        );
      },
    );
  }
  Widget _buildPrice2() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          inputType: TextInputType.emailAddress,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _priceController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          }, errorText: '',
          decoration: const InputDecoration(
            hintText: 'Price', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
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
  Widget _buildPrice() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          inputType: TextInputType.emailAddress,
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _priceController,
          errorText: '',
          cursorColor: Colors.black, // Set the cursor color to black
          decoration: InputDecoration(
            hintText: 'Price', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
            counterText: '',
            icon: Icon(Icons.price_change, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Chỉnh chiều dài ở đây
          ),
        );
      },
    );
  }
  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _uquantityController,
          focusNode: _passwordFocusNode,
          inputAction: TextInputAction.next,
          errorText: '',
          cursorColor: Colors.black, // Set the cursor color to black
          decoration: InputDecoration(
            hintText: 'Quantity', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
            counterText: '',
            icon: Icon(Icons.lock, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5), // Loại bỏ góc bo ở đây
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5), // Loại bỏ góc bo ở đây
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5), // Loại bỏ góc bo ở đây
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5), // Loại bỏ góc bo ở đây
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Chỉnh chiều dài ở đây
          ),
        );
      },
    );
  }


  Widget _buildPasswordField2() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Image.asset('assets/fruitquantily.png', height: 24, width: 24),
          textController: _uquantityController,
          focusNode: _passwordFocusNode,
          errorText: '',
          cursorColor: Colors.black, // Set the cursor color to black
          decoration: InputDecoration(
            hintText: 'Quantity', // or any hint text you want
            hintStyle: TextStyle(color: Colors.grey),
            counterText: '',
            icon: Icon(Icons.lock, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Chỉnh chiều dài ở đây
          ),
        );
      },
    );
  }

  Widget _buildButtonRounded() {
    return Container(
      height: 40,
      child: RoundedButtonWidget(
        buttonText: 'Insert Product',
        buttonColor: Colors.black,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ), // Loại bỏ góc bo ở đây
        onPressed: () {
          insertrecord();
        },
      ),
    );
  }


  Widget _buildButtonImage() {
    return GestureDetector(
      onTap: () {
        _openImagePicker();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: _image != null
              ? Image.file(_image!, fit: BoxFit.fitWidth, height: 110) // Chỉnh chiều cao ở đây
              : const Text('Please select an image'),
        ),
      ),
    );
  }




// Widget _buildSignInButton() {
  //   return RoundedButtonWidget(
  //     buttonColor: Colors.orangeAccent,
  //     textColor: Colors.white,
  //
  //   );
  // }

  // Widget navigate(BuildContext context) {
  //   SharedPreferences.getInstance().then((prefs) {
  //     prefs.setBool(Preferences.is_logged_in, true);
  //   });
  //
  //   Future.delayed(Duration(milliseconds: 0), () {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //         Routes.home, (Route<dynamic> route) => false);
  //   });
  //
  //   return Container();
  // }

  // General Methods:-----------------------------------------------------------
  // _showErrorMessage(String message) {
  //   if (message.isNotEmpty) {
  //     Future.delayed(Duration(milliseconds: 0), () {
  //       if (message.isNotEmpty) {
  //         FlushbarHelper.createError(
  //           message: message,
  //           title: AppLocalizations.of(context).translate('home_tv_error'),
  //           duration: Duration(seconds: 3),
  //         )..show(context);
  //       }
  //     });
  //   }
  //
  //   return SizedBox.shrink();
  // }

  // dispose:-------------------------------------------------------------------
 /* @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }*/
}


