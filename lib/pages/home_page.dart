import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      image: 'assets/sugar.png',
      price: 5000,
      stock: 21,
      rating: 4.4,
    ),
    Item(
      name: 'Salt',
      image: 'assets/salt.png',
      price: 2000,
      stock: 322,
      rating: 4.6,
    ),
    Item(
      name: 'Himalayan Pink Salt',
      image: 'assets/himalayan_pink_salt.png',
      price: 12000,
      stock: 30,
      rating: 4.9,
    ),
    Item(
      name: 'MSG',
      image: 'assets/msg.png',
      price: 8000,
      stock: 102,
      rating: 4.6,
    ),
    Item(
      name: 'Black Pepper',
      image: 'assets/black_pepper.png',
      price: 4000,
      stock: 43,
      rating: 4.4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Center(
            child: Text('Fadly Nugraha Jati 2241720149'),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        // child: ListView.builder(
        //   padding: EdgeInsets.all(8),
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //     final item = items[index];
        //     return InkWell(
        //       onTap: () {
        //         Navigator.pushNamed(context, '/item', arguments: item);
        //       },
        //       child: Card(
        //         child: Container(
        //           margin: EdgeInsets.all(8),
        //           child: Row(
        //             children: [
        //               Expanded(child: Text(item.name)),
        //               Expanded(
        //                   child: Text(
        //                 item.price.toString(),
        //                 textAlign: TextAlign.end,
        //               ))
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'hero${item.name}',
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                item.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. ${item.price.toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${item.stock.toString()} Tersisa',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
