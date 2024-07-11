import 'dart:convert';

import 'package:appshotfront/pages/selectedProduct.dart';
import 'package:flutter/material.dart';
import 'package:appshotfront/services/product.dart';
import 'package:appshotfront/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // All PRODUCT
  late Future<List<dynamic>> products;
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/v1/product/all')
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    print(response.body);
    return products;
  }

  //SOLO PRODUCT
  //Future<Product> fetchSingle() async{
  //  final response = await http.get(
  //    Uri.parse('http://10.0.2.2:8080/product/5')
  //  );
  //  final data = jsonDecode(response.body);
  //  Product newProduct = Product.fromJson(data);
  //  return newProduct;
  //}

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Image.asset(
            'assets/logo2.png',
            height: 200.0,
            width: 500.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jfif'),
                fit: BoxFit.cover
            ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: FutureBuilder(
            future: products,
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 60.0,
                  ),
                );
              }
              if (snapshots.hasData) {
                List products = snapshots.data!;
                return Padding(
                  padding: EdgeInsets.all(3.0),
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Column(
                              children: [
                                Text(products[index].productName),
                                Text(products[index].price.toString()),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    SelectedProduct(product: products[index]),
                              )
                              );
                            },
                          ),
                        );
                      }
                  ),
                );
              }
              return Center(
                child: Text('Unable to load data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
