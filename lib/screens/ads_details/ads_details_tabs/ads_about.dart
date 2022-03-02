import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';

class AboutAdsScreen extends StatefulWidget {
   final String des;
  const AboutAdsScreen({Key key,this.des}) : super(key: key);

  @override
  _AboutAdsScreenState createState() => _AboutAdsScreenState();
}

class _AboutAdsScreenState extends State<AboutAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Padding(child: Text("${widget.des}",style: AppColors.mainFontStyle),padding: EdgeInsets.all(10),)
    );
  }
}
