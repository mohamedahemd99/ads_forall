import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';

import 'image_message_screen.dart';

class GalleryAdsScreen extends StatefulWidget {
  GalleryAdsScreen(this.imgs);

  List<String> imgs;

  @override
  _GalleryAdsScreenState createState() => _GalleryAdsScreenState();
}

class _GalleryAdsScreenState extends State<GalleryAdsScreen> {


  @override
  Widget build(BuildContext context) {
    print(widget.imgs);
    return widget.imgs.isEmpty
        ?Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "no Images",
          style: AppColors.mainFontStyle,
        ),
      ),
    )
        :  Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
          ),
          itemCount: widget.imgs.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => navigateTo(
                  context, ImageMessageScreen(widget.imgs[index])),
              child: Hero(
                tag: "image",
                child: Image.network(widget.imgs[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));