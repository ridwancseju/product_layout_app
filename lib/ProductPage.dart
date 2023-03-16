import 'package:flutter/material.dart';
import 'package:product_layout_app/main.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("asstes/appimages/" + this.item.image),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(this.item.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                        const Text("this.item.description"),
                        Text("Price: " + this.item.price.toString()),
                        const RatingBox(),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
