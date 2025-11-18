// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) => List<ProductsEntry>.from(json.decode(str).map((x) => ProductsEntry.fromJson(x)));

String productsEntryToJson(List<ProductsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
    int id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    int productsViews;
    int? userId;
    UserUsername? userUsername;

    ProductsEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.productsViews,
        required this.userId,
        required this.userUsername,
    });

    factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        id: int.parse(json["id"].toString()),
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        productsViews: json["products_views"],
        userId: json["user_id"],
        userUsername: userUsernameValues.map[json["user_username"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "products_views": productsViews,
        "user_id": userId,
        "user_username": userUsernameValues.reverse[userUsername],
    };
}

enum UserUsername {
    JOHANNES1103,
    USER1,
    USER2
}

final userUsernameValues = EnumValues({
    "johannes1103": UserUsername.JOHANNES1103,
    "user1": UserUsername.USER1,
    "user2": UserUsername.USER2
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
