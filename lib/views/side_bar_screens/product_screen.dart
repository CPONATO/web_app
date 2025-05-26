import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static const String routeId = '\prdouctscreen';

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Product')));
  }
}
