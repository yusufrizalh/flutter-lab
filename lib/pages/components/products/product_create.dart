// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterlab/pages/components/products/product_list.dart';
// import 'package:flutterlab/pages/components/forms/product_form.dart';
import 'package:http/http.dart' as http;
import '../apis/baseurl.dart';

class ProductCreate extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();

  ProductCreate({super.key});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  Future createProduct() async {
    final String apiUrl = "${BaseUrl.base_url}/createProduct.php";
    return await http.post(
      Uri.parse(apiUrl),
      body: {
        "name": widget.productNameCtrl.text,
        "price": widget.productPriceCtrl.text,
        "description": widget.productDescriptionCtrl.text,
      },
    );
  }

  String? validateName(String? value) {
    if (value!.length < 8) return 'Product name at least 8 characters!';
    return null;
  }

  String? validateDescription(String? value) {
    if (value!.length < 8) return 'Product description at least 8 characters!';
    return null;
  }

  String? validateNumber(String? value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(value!)) return 'Please number only!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: widget.productNameCtrl,
                      keyboardType: TextInputType.text,
                      decoration:
                          InputDecoration(labelText: "Enter product name"),
                      validator: validateName,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12.0)),
                    TextFormField(
                      controller: widget.productPriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Enter product price"),
                      validator: validateNumber,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(12.0)),
                    TextFormField(
                      controller: widget.productDescriptionCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Enter product description"),
                      validator: validateDescription,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
              "Create Product",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            // create product
            if (widget.formKey.currentState!.validate()) {
              createProduct();
              final mySnackbar = SnackBar(
                content: const Text("Success to create product"),
                backgroundColor: Colors.red,
                elevation: 0,
                margin: const EdgeInsets.all(12),
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
                closeIconColor: Colors.white,
                dismissDirection: DismissDirection.up,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                duration: const Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(mySnackbar);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProductList(title: "Product List"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
