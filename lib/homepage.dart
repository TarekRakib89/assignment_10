import 'package:assignment_10/product.dart';
import 'package:assignment_10/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int price = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              "My Bag",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
                itemCount: listOfProduct.length,
                itemBuilder: (context, index) {
                  var list = listOfProduct[index];
                  return Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                list['image'],
                                width: size.height * 0.1,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(list['name']),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Color: ',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: list['color'],
                                                style: applyTextStyle()),
                                            const TextSpan(text: ' Sized: '),
                                            TextSpan(
                                                text: 'L',
                                                style: applyTextStyle()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (list['count'] > 0) {
                                            list['count'] = list['count'] - 1;
                                            price =
                                                price - (list['price']) as int;
                                          }

                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        list['count'].toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          list['count'] = list['count'] + 1;
                                          price =
                                              price + (list['price']) as int;
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.more_vert),
                              Text("${list['price']}\$"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${price.toString()}\$",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var snackBar =
                            const SnackBar(content: Text('Congratulations'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: applyButtonStyle(size),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "CHECK OUT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
