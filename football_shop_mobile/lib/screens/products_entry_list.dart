import 'package:flutter/material.dart';
import 'package:football_shop_mobile/models/products_entry.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';
import 'package:football_shop_mobile/screens/products_detail.dart';
import 'package:football_shop_mobile/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  Future<List<ProductsEntry>> fetchproducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/get-products-json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductsEntry objects
    List<ProductsEntry> listproducts = [];
    for (var d in data) {
      if (d != null) {
        listproducts.add(ProductsEntry.fromJson(d));
      }
    }
    return listproducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 201, 201),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Products Entry List',
            style: TextStyle(
              fontFamily: 'LibertinusKeyboard'
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 82, 91, 89),
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: FutureBuilder(
        future: fetchproducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in football products yet.',
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 124, 42, 14)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductsEntryCard(
                  products: snapshot.data![index],
                  onTap: () {
                    // Navigate to products detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsDetailPage(
                          products: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}