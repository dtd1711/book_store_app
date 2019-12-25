import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import './book_model.dart';
import 'book_product.dart';

List<Book> parseBooks(String responeBody) {
  final parsed = json.decode(responeBody).cast<Map<String, dynamic>>();

  return parsed.map<Book>((json) => Book.fromJson(json)).toList();
}

Future<List<Book>> fetchBooks(http.Client client) async {
  final response =
      await client.get('https://bookstore-8000.restdb.io/rest/books');

  return compute(parseBooks, response.body);
}

class ListProducts extends StatefulWidget {
  final List<Book> initProducts;

  ListProducts(this.initProducts);

  @override
  State<StatefulWidget> createState() {
    return _ListProductsState();
  }
}

class _ListProductsState extends State<ListProducts> {
  List<Book> _products = [];
  @override
  void initState() {
    _products = widget.initProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      children: List.generate(_products.length, (index) {
        return BookProductWidget(_products[index]);
      }),
    );
  }
}
