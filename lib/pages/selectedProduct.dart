import 'package:flutter/material.dart';
import 'package:appshotfront/services/product.dart';

class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState();
}

class _selectedProductState extends State<selectedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
  body: Column(
    children: [
      Column(
        children: [
          Text(widget.product.productName),
          Text(widget.product.description),
        ],
      ),

      Row(
        children: [
          Text(widget.product.price.toString()),
        ],
      ),
    ],
  ),
      );
  }
}
