import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';

class ProductsFormPage extends StatefulWidget {
    const ProductsFormPage({super.key});

    @override
    State<ProductsFormPage> createState() => _ProductsFormPageState();
}

class _ProductsFormPageState extends State<ProductsFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    double _price = 10.0; // default
    String _description = "";
    String _category = "update"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default

    final List<String> _categories = [
      'transfer',
      'update',
      'exclusive',
      'match',
      'rumor',
      'analysis',
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 208, 201, 201),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Products Form',
              style: TextStyle(
                fontFamily: 'LibertinusKeyboard'
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 82, 91, 89),
          foregroundColor: Colors.white,
        ),
        drawer: LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                // === Name ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 82, 91, 89)),
                    decoration: InputDecoration(
                      hintText: "e.g Lorem Ipsum",
                      labelText: "Product Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Product name can't be empty!";
                      }
                      if (value.length < 5) {
                        return "Minimum product name length 5";
                      }
                      if (value.length > 20) {
                        return "Maximum product name length 20";
                      }
                      return null;
                    },
                  ),
                ),

                // === Price ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 82, 91, 89)),
                    decoration: InputDecoration(
                      hintText: "e.g. 10000",
                      labelText: "Product Price (\$)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _price = double.tryParse(value ?? "") ?? 0.0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Product price can't be empty!";
                      }

                      final parsed = double.tryParse(value);
                      if (parsed == null) {
                        return "Product price must be a valid number!";
                      }

                      if (parsed <= 0) {
                        return "Product price must be greater than 0!";
                      }

                      return null;
                    },
                  ),
                ),
                    
                // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 82, 91, 89)),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "e.g. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur elementum mauris sed dolor hendrerit pharetra...",
                      labelText: "Product Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Product description can't be empty!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(
                                  cat[0].toUpperCase() + cat.substring(1)),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 82, 91, 89)),
                    decoration: InputDecoration(
                      hintText: "e.g. https://picsum.photos/200/300",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!;
                      });
                    }, 
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "URL Thumbnail can't be empty";
                      }
                      final urlPattern = r'^(http|https):\/\/[^ "]+$';
                      final regex = RegExp(urlPattern);

                      if (!regex.hasMatch(value)) {
                        return "Invalid URL Thumbnail format";
                      }

                      return null; 
                    },
                  ), 
                ),

                // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    activeTrackColor: Color.fromARGB(162, 32, 96, 2),
                    inactiveThumbColor: Color.fromARGB(255, 82, 91, 89),
                    activeColor: Color.fromARGB(255, 241, 233, 233),
                    title: Text(
                      "Mark as featured product",
                      style: TextStyle(
                        color: Color.fromARGB(255, 41, 49, 47)
                      ),
                    ),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),

                // === Save Button ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Color.fromARGB(162, 32, 96, 2)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('The Product has been successfully saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Description: $_description'),
                                      Text('Category: $_category'),
                                      Text('Thumbnail: $_thumbnail'),
                                      Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                      
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Color.fromARGB(255, 241, 233, 233),
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}