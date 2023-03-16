import 'package:flutter/material.dart';
import 'package:product_layout_app/ProductPage.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
final String title;
final item = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: item[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(item: item[index]),),);
            },
          );
        },
      ),
      // body: ListView(
      //   shrinkWrap: true,
      //   padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
      //   children: const [
      //     Product(
      //       name: 'apfm_1',
      //       description: 'We are the member of apfm',
      //       price: 2100,
      //       image: 'logo.png',
      //     ),
      //     Product(
      //       name: 'apfm_2',
      //       description: 'We are the member of apfm',
      //       price: 2200,
      //       image: 'logo.png',
      //     ),
      //     Product(
      //       name: 'apfm_3',
      //       description: 'We are the member of apfm',
      //       price: 2300,
      //       image: 'logo.png',
      //     ),
      //     Product(
      //       name: 'apfm_4',
      //       description: 'We are the member of apfm',
      //       price: 2400,
      //       image: 'logo.png',
      //     ),
      //     Product(
      //       name: 'apfm_5',
      //       description: 'We are the member of apfm',
      //       price: 2500,
      //       image: 'logo.png',
      //     ),
      //   ],
      // )
    );
  }
}
class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);
final Product item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      width: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/appimages/" + this.item.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(this.item.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(this.item.description),
                      Text("Price: " + this.item.price.toString()),
                      RatingBox(),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/appimages/" + this.item.image),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(this.item.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                        Text(this.item.description),
                        Text("Price: " + this.item.price.toString()),
                        const RatingBox(),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  const Product({required this.name, required this.description, required this.price, required this.image});
final String name;
final String description;
final int price;
final String image;
static List<Product> getProducts() {
  List<Product> item = <Product>[];
  item.add(const Product(
      name: "Broiler",
      description: "GestureDetector is a non-visual widget primarily used",
      price: 3200,
      image: "AP_broiler_starter-1.1.jpg")
  );
  item.add( const Product(
      name: "Layer",
      description: "The state change will be done through gestures.",
      price: 3000,
      image: "APLayer-grower-1.2.jpg")
  );
  item.add( const Product(
      name: "Sonali",
      description: "The state change will be done through gestures.",
      price: 3100,
      image: "APSonali-feed-1.2.jpg")
  );
  item.add( const Product(
      name: "Cattle",
      description: "The state change will be done through gestures.",
      price: 2800,
      image: "APVitamilk-1.2.jpg")
  );
  return item;
}
  //@override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(2.0),
  //     height: 150,
  //     child: Card(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Image.asset('assets/appimages/' + image),
  //           Expanded(
  //               child: Container(
  //                 padding: const EdgeInsets.all(5.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Text(this.name, style: const TextStyle(fontWeight: FontWeight.bold),),
  //                     Text(this.description, style: const TextStyle(color: Colors.green),),
  //                     Text('Price: ' + this.price.toString()),
  //                     const RatingBox(),
  //                   ],
  //                 ),
  //               )
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);
  @override
  State<RatingBox> createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      //mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          child: IconButton(
            icon: (_rating >= 1 ? Icon(Icons.star, size: _size,) : Icon(Icons.star_border, size: _size,)),
            color: Colors.red[500],
            iconSize: _size,
            onPressed: _setRatingAsOne,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1),
          child: IconButton(
            icon: (_rating >= 2 ? Icon(Icons.star, size: _size,) : Icon(Icons.star_border, size: _size,)),
            color: Colors.red[500],
            iconSize: _size,
            onPressed: _setRatingAsTwo,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1),
          child: IconButton(
            icon: (_rating >= 3 ? Icon(Icons.star, size: _size,) : Icon(Icons.star_border, size: _size,)),
            color: Colors.red[500],
            iconSize: _size,
            onPressed: _setRatingAsThree,
          ),
        ),
      ],
    );
  }
}



