import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  // TextEditingController image = TextEditingController();

  addProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({"name": productName.text, "price": productPrice.text,
        // "image":image.text
        })
        .then((value) => print("Product Added"))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: TextField(
                        controller: productName,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'Enter product name',
                            labelText: 'Name',
                           ),
                      ),
                    )),
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
                        controller: productPrice,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'Enter product price here',
                            labelText: 'Price',
                            ),
                      ),
                    )),
              ),
            ElevatedButton(
              onPressed: () {
                addProduct();
              },
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
