// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController productNameCtrl;
  late TextEditingController productPriceCtrl;
  late TextEditingController productDescriptionCtrl;

  ProductForm({
    required formKey,
    required this.productNameCtrl,
    required this.productPriceCtrl,
    required this.productDescriptionCtrl,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
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
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: widget.productNameCtrl,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Enter product name"),
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
            decoration: InputDecoration(labelText: "Enter product price"),
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
            decoration: InputDecoration(labelText: "Enter product description"),
            validator: validateDescription,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
