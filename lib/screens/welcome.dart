import 'package:flutter/material.dart';
import 'package:food_app/model/data.dart';
import 'package:food_app/model/details.dart';
import 'package:food_app/screens/food.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({Key? key}) : super(key: key);

  @override
  State<WelComePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelComePage> {
  List<FoodItems> data = [];
  bool _isliked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    data = Data.getdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: const Drawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.line_style,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          actions: const [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodPage(
                          items: data[index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.roundabout_left),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isliked = !_isliked;
                                },
                              );
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: _isliked ? Colors.red : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(data[index].images),
                      ),
                      Text(data[index].text1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data[index].text2),
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.add_alarm),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
