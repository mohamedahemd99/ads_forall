import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';

class ProductAdsScreen extends StatefulWidget {
  const ProductAdsScreen({Key key}) : super(key: key);

  @override
  _ProductAdsScreenState createState() => _ProductAdsScreenState();
}

class _ProductAdsScreenState extends State<ProductAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text("Product Ads Screen",style: AppColors.mainFontStyle,),),
    );
  }
}
