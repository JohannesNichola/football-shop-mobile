import 'package:flutter/material.dart';
import 'package:football_shop_mobile/models/products_entry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
//TODO design, price
class ProductsDetailPage extends StatelessWidget {
  final ProductsEntry products;

  const ProductsDetailPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 201, 201),
      appBar: AppBar(
        title: const Text(
          'Products Detail',
          style: TextStyle(
            fontFamily: 'LibertinusKeyboard'
          ),
        ),
        backgroundColor: Color.fromARGB(255, 82, 91, 89),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: context.read<CookieRequest>().get(
          "http://127.0.0.1:8000/json/${products.id}/"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;

          final updated = ProductsEntry.fromJson(data);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (updated.thumbnail.isNotEmpty)
                  Image.network(
                    'http://127.0.0.1:8000/proxy-image/?url=${Uri.encodeComponent(updated.thumbnail)}',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (updated.isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 207, 154, 105),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Featured"),
                        ),

                      Text(
                        updated.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(200, 25, 69, 5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              updated.category.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 56, 165, 6)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Icon(Icons.visibility,
                              size: 16, color: Color.fromARGB(255, 82, 91, 89)),
                          const SizedBox(width: 4),
                          Text(
                            '${updated.productsViews} views',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 82, 91, 89),
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 32),

                      Text(
                        updated.description,
                        style: const TextStyle(fontSize: 16, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}