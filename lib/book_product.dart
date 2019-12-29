import 'package:book_store/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_model.dart';
import './book_detail.dart';

class BookProductWidget extends StatelessWidget {
  final Book product;

  BookProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetail(product)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 5,
              child: Image.network(
                product.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
              product.bookName,
              style: TextStyle(
                color: Colors.blue,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Text(product.bookPrice.toString()),
                  FlatButton(
                    onPressed:() => cart.add(product),
                    child: cart.cartItems.contains(product) ? Icon(Icons.check,semanticLabel: "Added",) : Text("Add"),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
