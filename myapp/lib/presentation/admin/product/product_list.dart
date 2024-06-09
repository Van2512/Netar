import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/presentation/admin/product/update_product.dart';
import 'package:myapp/presentation/slideMenu/NavBar.dart';
import '../../cart/Cart.dart';
import '../../productdetail/ProductDetail.dart';
import '../../../core/widgets/ButtonCoustomProduct.dart';
import '../../../core/widgets/CustomProgressIndicatorWidget.dart';
import '../../../network/res_client.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final RestClient restClient = RestClient();
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    super.initState();
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection!;
      });
    });
    _loadData();
    _deteteData("id");// Gọi hàm tải dữ liệu khi initState được gọi
  }

  Future<void> _loadData() async {
    await restClient.imageformdb(); // Gọi phương thức imageformdb() từ restClient để tải dữ liệu
    setState(() {}); // Cập nhật lại UI sau khi dữ liệu đã được tải
  }
  Future<void> _deteteData(String id) async {
    await restClient.deteteData(id); // Truyền id cho phương thức deteteData từ restClient
    setState(() {
      // Cập nhật lại UI sau khi dữ liệu đã được xóa
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
  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        _buildHeaderContent(),

      ],
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu), // Sử dụng icon menu cho nút bên trái
        onPressed: () {

        },
      ),
      actions: _buildActions(context),
    );
  }


  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildThemeButton(),
      SizedBox(width: 20),
      _buildLanguageButton(),
      SizedBox(width: 25),
    ];
  }
  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8F8F8), // Đặt màu nền là #dbdbde
            shape: BoxShape.circle, // Đặt hình dạng là hình tròn
          ),
          child: IconButton(
            onPressed: () {
              // Xử lý khi người dùng nhấn vào nút chủ đề ở đây (nếu cần)
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black, // Đặt màu của biểu tượng là màu đen
            ),
          ),
        );
      },
    );
  }
  Widget _buildLanguageButton() {
    return const CircleAvatar(
      radius: 19.8,
      backgroundImage: AssetImage('assets/avatar.jpg'),
    );
  }
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildMainContent(),
      ],
    );
  }

  Widget _buildHeaderContent() {
    return Observer(
      builder: (context) {
        return ButtonCoustomProduct();
      },
    );
  }
  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return restClient.record.isEmpty
            ? CustomProgressIndicatorWidget()
            : Material(
            child: _buildListView());
      },
    );
  }
  Widget _buildListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
            child: Container(
              decoration: BoxDecoration(
         // Độ bo tròn góc của container
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      backgroundColor: Color(0xFF1D1E1D),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(59, 99),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                            shape: BoxShape.circle,
                            // Đặt hình dạng của biểu tượng là hình tròn
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.2), // Khoảng cách giữa biểu tượng và viền
                            child: Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(140, 68, 29, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Khoảng cách giữa biểu tượng và văn bản
                        Text(
                          'All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),SizedBox(width: 11.1),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(
                          color: Colors.black26, // Màu của viền
                          width: 0.3 // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(59, 99),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                            shape: BoxShape.circle,
                            // Đặt hình dạng của biểu tượng là hình tròn

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Khoảng cách giữa biểu tượng và viền
                            child: Image.asset(
                              'assets/apple2.jpg', // Đường dẫn đến tệp ảnh foods.png trong assets// Màu của ảnh (nếu cần)
                              width: 30, // Chiều rộng của ảnh
                              height: 30, // Chiều cao của ảnh
                            ),
                          ),
                        ),
                        SizedBox(height: 9), // Khoảng cách giữa biểu tượng và văn bản
                        Text(
                          'Fruits',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ),SizedBox(width: 11.1),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(
                          color: Colors.black26, // Màu của viền
                          width: 0.3, // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(59, 99),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Khoảng cách giữa biểu tượng và viền
                            child: Image.asset(
                              'assets/coconut.jpg', // Đường dẫn đến tệp ảnh foods.png trong assets
                              width: 30, // Chiều rộng của ảnh
                              height: 30, // Chiều cao của ảnh
                            ),
                          ),
                        ),
                        SizedBox(height: 7.8), // Khoảng cách giữa biểu tượng và văn bản
                        Text(
                          'Drinks',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                  ,SizedBox(width: 11.1),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(
                          color: Colors.black26, // Màu của viền
                          width: 0.3, // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(59, 99),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                            shape: BoxShape.circle,
                            // Đặt hình dạng của biểu tượng là hình tròn
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Khoảng cách giữa biểu tượng và viền
                            child: Image.asset(
                              'assets/foods.jpg', // Đường dẫn đến tệp ảnh foods.png trong assets// Màu của ảnh (nếu cần)
                              width: 30, // Chiều rộng của ảnh
                              height: 30, // Chiều cao của ảnh
                            ),
                          ),
                        ),
                        SizedBox(height: 8), // Khoảng cách giữa biểu tượng và văn bản
                        Text(
                          'Foods',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ),SizedBox(width: 11.1),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(
                          color: Colors.black26, // Màu của viền
                          width: 0.3, // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(59, 99),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                            shape: BoxShape.circle,
                            // Đặt hình dạng của biểu tượng là hình tròn
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Khoảng cách giữa biểu tượng và viền
                            child: Image.asset(
                              'assets/spices_ic.jpg', // Đường dẫn đến tệp ảnh foods.png trong assets// Màu của ảnh (nếu cần)
                              width: 30, // Chiều rộng của ảnh
                              height: 30, // Chiều cao của ảnh
                            ),
                          ),
                        ),
                        SizedBox(height: 8), // Khoảng cách giữa biểu tượng và văn bản
                        Text(
                          'Spices',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ),SizedBox(width: 0),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.0), // Đặt khoảng cách 10px bên phải
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,// Bo tròn góc bằng 10 độ
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 11.0,top:7,bottom: 7), // Đặt padding cho text
                      child: Text(
                        'Top Sale ',
                        style: TextStyle(
                          fontSize: 11.3,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 7,top:7,bottom: 7),
                    child: PopupMenuButton(
                      child: Icon(
                        Icons.filter_alt,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        size: 16.7,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
        Expanded(
          child: ListView.builder(
            controller: listScrollController,
            scrollDirection: Axis.vertical,
            itemCount: (restClient.record.length / 3).ceil(), // Số lượng hàng
            itemBuilder: (context, rowIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(2, (index) {
                    var itemIndex = rowIndex * 2 + index;
                    if (itemIndex < restClient.record.length) {
                      var record = restClient.record[itemIndex];
                      return Expanded(
                          child: GestureDetector(
                          onTap: () {
                        // Xử lý khi người dùng nhấn vào phần tử
                        navigateToUpdateScreen(record); // Gọi hàm để chuyển đến màn hình cập nhật với record tương ứng
                      },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.symmetric(horizontal: 7.8),
                          padding: EdgeInsets.all(10.4),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFFFFFFF),
                                blurRadius: 10,
                              ),
                            ],
                            border: Border.all(color: Color(0xFFE2E2E2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo trục dọc
                            children: [
                              SizedBox(height: 3.5),
                              Container(
                                height: 60,
                                width: double.infinity,
                                child: Image.network(
                                  "http://192.168.1.2/detar/" +
                                      (record["image"] ?? "assets/default_image.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 7),
                              Padding(
                                padding: EdgeInsets.only(left: 57), // Đẩy `uname` sang bên phải 10px
                                child: Text(
                                  record['uname'] ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 7),
                              Container(
                                child: const Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 52),
                                        child: Row(
                                          children: [ // Khoảng cách giữa số và icon ngôi sao
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(140, 68, 29, 1.0),
                                              size: 16,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "5",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF7C7C7C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 7),
                              Container(
                                child: const Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left:5), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "Price    |",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF7C7C7C),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left:8), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "Iteam    |",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF7C7C7C),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left:2), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "Ordered",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF7C7C7C),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 7),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "\$ ${record["uprice"] ?? ''}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "${record["uquantity"] ?? ''}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 0), // Thêm khoảng trống ngang ở mỗi cột
                                        child: Text(
                                          "150",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  }),
                ),
              );
            },
          ),
        ),






      ],
    );
  }

  void navigateToUpdateScreen(Map<String, dynamic> record) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateProductScreen(
          record['uname'] ?? '',
          record['uquantity'] ?? '',
          record['uprice'] ?? '',
          record['uid'] ?? '',
          record['image'] ?? '',
        ),
      ),
    );
  }


}
