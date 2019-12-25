import 'package:http/http.dart' as http;
import 'dart:convert';
class Book {
  final String bookName;
  final int bookPrice;
  final String imgUrl;
  final String description;
  final String author;

  double rating = 0;
  Book({this.bookName,this.bookPrice,this.imgUrl,this.author,this.description});
  
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json['name'] as String,
      bookPrice: json['price'] as int,
      imgUrl: json['imgUrl'] as String,
      description: json['description'] as String,
      author:  json['author'] as String
    );
  }
}