import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import './book_model.dart';

class BookDetail extends StatelessWidget {
  final Book product;

  BookDetail(this.product);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book Detail'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              width: screenSize.width - 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    product.imgUrl,
                    fit: BoxFit.cover,
                  ),
                  RatingBar(
                    initialRating: product.rating,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _ ) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      product.rating = rating;
                    },
                  ),
                  Text(
                    product.bookName,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    product.bookPrice.toString(),
                    style:TextStyle(
                      fontSize: 30.0, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      product.description,
                      softWrap: true,
                    )
                  )
                ],
              ),
            )
          )
        )
      )
    );
  }
}
