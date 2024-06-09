import 'package:flutter/material.dart';
import 'package:myapp/presentation/admin/product/product_list.dart';
class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PostListScreen(),
    );
  }
}
