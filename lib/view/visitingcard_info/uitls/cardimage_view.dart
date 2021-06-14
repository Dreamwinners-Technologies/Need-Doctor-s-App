import 'package:flutter/material.dart';

class CardImageView extends StatelessWidget {
  CardImageView(this.cardImageUrl);

  final String cardImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: cardImageUrl,
            child: Image.network(
              cardImageUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
