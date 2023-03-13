import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: const [
          ProductBox(
            name: 'apfm_1',
            description: 'We are the member of apfm',
            price: 2100,
            image: 'logo.png',
          ),
          ProductBox(
            name: 'apfm_2',
            description: 'We are the member of apfm',
            price: 2200,
            image: 'logo.png',
          ),
          ProductBox(
            name: 'apfm_3',
            description: 'We are the member of apfm',
            price: 2300,
            image: 'logo.png',
          ),
          ProductBox(
            name: 'apfm_4',
            description: 'We are the member of apfm',
            price: 2400,
            image: 'logo.png',
          ),
          ProductBox(
            name: 'apfm_5',
            description: 'We are the member of apfm',
            price: 2500,
            image: 'logo.png',
          ),
        ],
      )
    );
  }
}
class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image}) : super(key: key);
final String name;
final String description;
final int price;
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/appimages/' + image),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(this.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(this.description, style: const TextStyle(color: Colors.green),),
                      Text('Price: ' + this.price.toString()),
                      const RatingBox(),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
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
      mainAxisSize: MainAxisSize.max,
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
        )
      ],
    );
  }
}



