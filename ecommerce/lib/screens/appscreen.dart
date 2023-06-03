import 'package:ecommerce/screens/addProduct.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_details.dart';

class AppScreen extends StatelessWidget {
  AppScreen({super.key});
  TextEditingController search_control = TextEditingController();
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MegaMall')),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.local_grocery_store))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: TextField(
                        controller: search_control,
                        decoration: const InputDecoration(
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
                    children: const [
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Categories'),
                  const SizedBox(
                    width: 240,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see all',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.food_bank),
                        ),
                        const Text('Foods')
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.card_giftcard),
                        ),
                        const Text('Gifts')
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.watch),
                        ),
                        const Text('Fashion')
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: 90,
                          child: const Icon(Icons.shopping_cart),
                        ),
                        const Text('cloths')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Featured Products'),
                  const SizedBox(
                    width: 190,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see all',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              FutureBuilder(
                  future: getAllProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 0,
                                width: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              data: snapshot.data.docs[index]),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      // borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                            snapshot.data.docs[index]['image']),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]['name'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]['price'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.black,
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddProductView(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
