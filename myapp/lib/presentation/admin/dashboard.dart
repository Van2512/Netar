import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/presentation/admin/product/update_product.dart';
import 'package:myapp/presentation/slideMenu/NavBar.dart';
import '../cart/Cart.dart';
import '../productdetail/ProductDetail.dart';
import '../../core/widgets/ButtonCoustomProduct.dart';
import '../../core/widgets/CustomProgressIndicatorWidget.dart';
import '../../network/data_list.dart';
import '../../model/BarChartModel.dart';
import '../../network/res_client.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashBoardScreen extends StatefulWidget {
   DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreen();

}


class _DashBoardScreen extends State<DashBoardScreen> {
  final RestClient restClient = RestClient();

  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;
  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }
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

  final List<BarChartModel> data = [
    BarChartModel(
      year: "2021",
      financial: 450,
      // color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      year: "2022",
      financial: 630,
      // color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "2023",
      financial: 950,
      // color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "2024",
      financial: 400,
      // color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];
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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 48.0, // Height of the tab container
            flexibleSpace: _buildTab(), // Place your tab widget here
            pinned: true,// Keep the tab visible while scrolling
            leading: SizedBox(),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 123.0,
              child: _buildHeadHorizontal(),
            ),
            Container(
              height: 398.0,
              padding: EdgeInsets.only(left: 12.0),
              child: _buildMainContent(),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFE2E2E2),
              ),
            ),
            Container(
              height: 38.0,
              padding: EdgeInsets.only(left: 12.0),
              child: _buildTitle(),
            ),
            SizedBox(height: 5,),
            Container(
              height: 65.0,
              child: _buildButtonOrders(),
            ),
            SizedBox(height: 5,),
            Container(
              height: 65.0,
              child: _buildButtonOrders(),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
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
  Widget _buildTab() {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Ẩn biểu tượng mũi tên
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: "All"),
              Tab(text: "This Week"),
              Tab(text: "This Month"),
              Tab(text: "This Year"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.symmetric(horizontal: 1.0), // Điều chỉnh chieu rong
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('All')),
            Center(child: Text('Last week')),
            Center(child: Text('Last month')),
            Center(child: Text('Last year')),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        // Adjust the measure function to append "k" after the financial value
        labelAccessorFn: (BarChartModel series, _) => 'k${series.financial}', // Append "k" to the financial value
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
      margin: EdgeInsets.symmetric( vertical: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF8F7FB), // Màu nền là màu trắng
        borderRadius: BorderRadius.circular(25.0), // Bo tròn góc với bán kính là 25.0
        border: Border.all(color: Colors.black.withOpacity(0.1)), // Viền góc màu đen với độ dày 0.1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2,),
          Text(
            'Sales report',
            style: TextStyle(
              fontSize: 14.8,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8,)
          ,
          SizedBox(
            height: 300, // Chiều cao tối đa của biểu đồ
            child: charts.BarChart(
              series,
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHeadHorizontal() {
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
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                            color: Colors.black26, // Màu của viền
                            width: 0.1 // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(180, 99),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, right: 27.0),
                          child: Row(
                            children: [
                              Ink(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                                  shape: BoxShape.circle, // Đặt hình dạng của biểu tượng là hình tròn
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.green, // Đặt màu nền là màu xanh lá cây
                                    borderRadius: BorderRadius.all(Radius.circular(9.0)), // Bo góc của hình chữ nhật
                                  ),
                                  width: 25, // Chiều rộng của hình chữ nhật
                                  height: 25, // Chiều cao của hình chữ nhật
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        // Xử lý khi người dùng nhấn vào nút chủ đề ở đây (nếu cần)
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white, // Đặt màu của biểu tượng là màu trắng
                                        size: 14, // Kích thước của biểu tượng
                                      ),
                                      padding: EdgeInsets.zero, // Xóa khoảng đệm mặc định
                                      constraints: BoxConstraints(), // Xóa các ràng buộc mặc định
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 11), // Khoảng cách giữa biểu tượng và văn bản
                              Text(
                                'Number of sale',
                                style: TextStyle(
                                  color: Color(0xFF85848c),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
              // Khoảng cách giữa biểu tượng và văn bản
                        Padding(
                          padding: const EdgeInsets.only(right: 129.0), // Dịch chuyển số '4' sang phải 30 đơn vị
                          child: Text(
                            '8',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  SizedBox(width: 11.1),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                            color: Colors.black26, // Màu của viền
                            width: 0.1 // Độ dày của viền
                        ),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(180, 99),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, right: 27.0),
                          child: Row(
                            children: [
                              Ink(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F8F8), // Đặt màu nền của biểu tượng là #F8F8F8
                                  shape: BoxShape.circle, // Đặt hình dạng của biểu tượng là hình tròn
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.orangeAccent, // Đặt màu nền là màu xanh lá cây
                                    borderRadius: BorderRadius.all(Radius.circular(9.0)), // Bo góc của hình chữ nhật
                                  ),
                                  width: 25, // Chiều rộng của hình chữ nhật
                                  height: 25, // Chiều cao của hình chữ nhật
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        // Xử lý khi người dùng nhấn vào nút chủ đề ở đây (nếu cần)
                                      },
                                      icon: const Icon(
                                        Icons.attach_money,
                                        color: Colors.white, // Đặt màu của biểu tượng là màu trắng
                                        size: 14, // Kích thước của biểu tượng
                                      ),
                                      padding: EdgeInsets.zero, // Xóa khoảng đệm mặc định
                                      constraints: BoxConstraints(), // Xóa các ràng buộc mặc định
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 11), // Khoảng cách giữa biểu tượng và văn bản
                              Text(
                                'Total revenue',
                                style: TextStyle(
                                  color: Color(0xFF85848c),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Khoảng cách giữa biểu tượng và văn bản
                        Padding(
                          padding: const EdgeInsets.only(right: 110), // Dịch chuyển số '4' sang phải 30 đơn vị
                          child: Text(
                            '\$88',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildButtonOrders() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          // Hiển thị bottom sheet khi nhấn vào nút
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(105.5, 0, 20, 0),
          fixedSize: const Size(330, 20), // Đặt kích thước cố định cho nút
          backgroundColor: Color(0xFFFFFFFF), // Đặt màu nền cho nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Đặt độ cong của góc nút
            side: BorderSide(color: Colors.grey, width: 0.1), // Đường viền màu đen với độ dày 0.5
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Đặt cách đều giữa các phần tử
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0), // Cài đặt padding trái là 15dp
              child: const Text( // Hiển thị chữ "stock"
                'MD-888',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Checkbox(
              value: false,
              onChanged: (newValue) {
                // Xử lý khi trạng thái của ô kiểm thay đổi
              },
              visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.5),
              checkColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.7), // Left padding
            child: Text(
              'Lastest orders',
              style: TextStyle(
                fontSize: 16.3,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.0), // Right padding
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
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
