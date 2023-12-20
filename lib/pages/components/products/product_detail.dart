import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../apis/models/product_model.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetail({super.key, required this.productModel});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail: ${widget.productModel.data![0].id}"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => debugPrint("Delete Product"),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrangeAccent,
              Colors.lightGreenAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Positioned(
                  top: constraints.maxHeight * 0.19,
                  left: constraints.maxWidth * 0.01,
                  child: Container(
                    height: constraints.maxHeight * 0.20,
                    width: constraints.maxWidth * 0.35,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [Colors.deepPurpleAccent, Colors.purple],
                          radius: 0.7,
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.61,
                  right: constraints.maxWidth * 0.01,
                  child: Container(
                    height: constraints.maxHeight * 0.20,
                    width: constraints.maxWidth * 0.35,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.red.withOpacity(0.6),
                            Colors.redAccent
                          ],
                          radius: 0.7,
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                  child: GlassmorphicContainer(
                    width: constraints.maxWidth * 0.8,
                    height: constraints.maxHeight * 0.5,
                    alignment: Alignment.center,
                    borderRadius: constraints.maxHeight * 0.02,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white38.withOpacity(0.2)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: 2,
                    blur: 15,
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white24.withOpacity(0.2),
                        Colors.white70.withOpacity(0.2)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Product Name: ${widget.productModel.data![0].name}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Text(
                          "Price: IDR. ${widget.productModel.data![0].price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Text(
                          "Description: ${widget.productModel.data![0].description}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Edit Product");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
