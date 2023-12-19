import 'package:flutter/material.dart';
import 'package:flutterlab/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../apis/baseurl.dart';

class ProductList extends StatefulWidget {
  final String title;
  ProductList({super.key, required this.title});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final String apiUrl = "${BaseUrl.base_url}/getAllProducts.php";
  List<dynamic> productList = [];
  List<dynamic> productSearch = [];

  getProductList() async {
    try {
      final resp = await http.get(Uri.parse(apiUrl));
      if (resp.statusCode == 200) {
        var response = convert.json.decode(resp.body);
        if (response["status"] == "OK") {
          // print("Products: " + resp.body);
          List<dynamic> products = response["data"];
          print("GET PRODUCTS: " + products.toString());
          return products;
        } else {
          throw Exception("Error while getting all products");
        }
      }
    } catch (errorMsg) {
      throw Exception("Error: " + errorMsg.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getProductList().then((data) {
      setState(() {
        productSearch = data;
        productList = productSearch;
      });
    });
  }

  userLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(title: "Home Page"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        leading: Icon(Icons.shopping_bag_outlined, color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: () => userLogout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Search product name",
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (keyword) {
                setState(() {
                  productList = productSearch
                      .where((productFound) => productFound["name"]
                          .toLowerCase()
                          .contains(keyword.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(4),
              itemCount: productList.length,
              itemBuilder: (context, position) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.numbers),
                    title: Text(
                      productList[position]["name"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(productList[position]["price"].toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Add Product");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
