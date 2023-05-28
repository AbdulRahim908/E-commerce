import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppScreen extends StatelessWidget {
  AppScreen({super.key});
  TextEditingController search_control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('                       MegaMall'),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.local_grocery_store))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: TextField(
                        controller: search_control,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'Search product here',
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    )),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage('assets/images/a.jpg'),
                        height: 150,
                        width: 250,
                      ),
                      SizedBox(
                        width: 02,
                      ),
                      Image(
                        image: AssetImage('assets/images/b.jpg'),
                        height: 150,
                        width: 250,
                      ),
                      SizedBox(
                        width: 02,
                      ),
                      Image(
                        image: AssetImage('assets/images/c.jpg'),
                        height: 150,
                        width: 250,
                      ),
                      SizedBox(
                        width: 02,
                      ),
                      Image(
                        image: AssetImage('assets/images/d.png'),
                        height: 150,
                        width: 250,
                      )
                    ],
                  )),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Categories'),
                  SizedBox(
                    width: 240,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'see all',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [  SizedBox(
                        width: 10,
                      ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: Icon(Icons.food_bank),
                        ),
                        Text('Foods')
                      ],
                    ),   SizedBox(
                        width: 20,
                      ),Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: Icon(Icons.card_giftcard),
                        ),
                        Text('Gifts')
                      ],
                    ), SizedBox(
                        width: 20,
                      ), Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: Icon(Icons.watch),
                        ),
                        Text('Fashion')
                      ],
                    ), SizedBox(
                        width: 20,
                      ), Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: Icon(Icons.shopping_cart),
                        ),
                        Text('cloths')
                      ],
                    ),
                  ],
                ),
              ), SizedBox(height: 10,),Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Featured Products'),
                  SizedBox(
                    width: 190,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'see all',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
