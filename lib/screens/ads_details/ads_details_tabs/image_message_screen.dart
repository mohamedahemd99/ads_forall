import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageMessageScreen extends StatefulWidget {
  ImageMessageScreen(this.image);

  String image;

  @override
  _ImageMessageScreenState createState() => _ImageMessageScreenState();
}

class _ImageMessageScreenState extends State<ImageMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body:Hero(tag: "image", child:  InteractiveViewer(

          child:Container(
            height: double.infinity,
            width:  double.infinity,
            child:  Image.network(widget.image),
          )
        )));
  }
}
 const mainColor = Color(0xff46c0be);
 const mainFontStyle = TextStyle(color: fontColor, fontSize: 15);
 const fontColor = Colors.white;
