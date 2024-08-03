import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> mylist = [
    "men",
    "women",
    "kids",
  ];
  int itemsindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Container(
        color: Colors.amber,
        height: 100,
        //width: 100,
        child: Column(
          children: [
            Text("mmmmmmmmmmmmmmmmm"),
            Text("mmmmmmmmmmmmmmmmm"),
            // ListView.builder(
            //     itemCount: mylist.length,
            //     itemBuilder: (context, index) => Text(mylist[1]))

            ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: const Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item $index"));
                }),
          ],
        ),
      ),
    );
  }
}
