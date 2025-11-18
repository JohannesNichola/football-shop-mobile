import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';
import 'package:football_shop_mobile/widgets/products_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

    final String nama = "Lionel Messi"; //nama
    final String npm = "2406275678"; //npm
    final String kelas = "B"; //kelas

    final List<ItemHomepage> items = [
        ItemHomepage("All Products", Icons.storefront, const Color.fromARGB(255, 133, 120, 101)),
        ItemHomepage("Create Product", Icons.add, const Color.fromARGB(162, 32, 96, 2)),
        ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 207, 154, 105)),
      ];

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 201, 201),
      appBar: AppBar(
        title: const Text(
          'Football Shop',
          style: TextStyle(
            fontFamily: "LibertinusKeyboard",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 82, 91, 89),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Wellcome to Football Shop',
                      style: TextStyle(
                        color: Color.fromARGB(255, 82, 91, 89),
                        fontFamily: 'ArchivoBlack',
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                      ),
                    ),
                  ),

                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 123, 136, 134),
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
 final String name;
 final IconData icon;
 final Color color;

 ItemHomepage(this.name, this.icon, this.color);
}

