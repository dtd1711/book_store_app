import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import './list_products.dart';
import './book_model.dart';

Future<List<Book>> getBook() async {
  var bookData = await http.get('https://bookstore-8000.restdb.io/rest/books', headers: {'x-apiKey': "5e017990b68f0802dd3e5cc8"});
  print(bookData);
  var jsonBookData = json.decode(bookData.body);
  print(jsonBookData);
  List<Book> books = []; 

  for(var b in jsonBookData) {
    Book book = Book.fromJson(b);

    books.add(book);
  }
  print(books.length);
  return books;
}

void main() => runApp(BookStoreApp());

class BookStoreApp extends StatelessWidget {
  final List<Book> initBook = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              
              ),
              ListTile(
                title: Text('Log In'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Book Store'),
        ),
        body: FutureBuilder<List<Book>>(
          future: getBook(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData ? ListProducts(snapshot.data) : Center(child: Text("Loading..."),);
          },
        ),
      ),
    );
  }
}
