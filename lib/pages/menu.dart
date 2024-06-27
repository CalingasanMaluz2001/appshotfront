import 'package:flutter/material.dart';
import 'package:appshotfront/services/product.dart';
import 'package:appshotfront/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Alfonso", price: 300), //Product
    Product(productName: "GSM blue", price: 250), //Product
    Product(productName: "Fundador", price: 300), //Product
    Product(productName: "Tanduay", price: 250), //Product
    Product(productName: "Jack Daniels", price: 500), //Product
  ];



  //<product>[]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.pink[900],
      foregroundColor: Colors.black,
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}
