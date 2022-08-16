import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  // final String url;
  GameCard({
    required this.title,
    required this.thumbnailUrl,
    // required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //container

      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

      width: MediaQuery.of(context).size.width / 2.3,
      height: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          // Image

          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),

      child: Stack(
        children: [
          //title

          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: BorderedText(
                  strokeWidth: 1.5,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
