import 'package:flutter/material.dart';
import 'package:football_shop_mobile/screens/home_page.dart';
import 'package:football_shop_mobile/screens/productslist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 208, 201, 201),
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 82, 91, 89),
            ),
            child: Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "All latest football products here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            iconColor: Color.fromARGB(255, 82, 91, 89),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Color.fromARGB(255, 82, 91, 89),
                fontWeight: FontWeight.bold
              ),),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            iconColor: Color.fromARGB(255, 82, 91, 89),
            title: const Text(
              'Create Product',
              style: TextStyle(
                color: Color.fromARGB(255, 82, 91, 89),
                fontWeight: FontWeight.bold
              ),),
            // Bagian redirection ke ProductsFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsFormPage(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}