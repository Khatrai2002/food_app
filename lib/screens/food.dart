import 'package:flutter/material.dart';
import 'package:food_app/model/data.dart';

class FoodPage extends StatefulWidget {
  final FoodItems items;
  const FoodPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int minimum = 0;
  int maximum = 10;
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(widget.items.images),
            ),
          ),
          Text(widget.items.text1),
          Row(
            children: [
              Container(
                child: Text(
                  "\$ adaddad",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: decrement,
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Text(
                  "$currentindex",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: increment,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void decrement() {
    if (currentindex > minimum) {
      setState(
        () {
          currentindex--;
        },
      );
    }
  }

  void increment() {
    if (currentindex < maximum) {
      setState(
        () {
          currentindex++;
        },
      );
    }
  }
}
