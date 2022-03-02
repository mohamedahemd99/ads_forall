import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';

class JobsAdsScreen extends StatefulWidget {
  const JobsAdsScreen({Key key}) : super(key: key);

  @override
  _JobsAdsScreenState createState() => _JobsAdsScreenState();
}

class _JobsAdsScreenState extends State<JobsAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black ,
      body: Center(child: Text("Jobs Ads Screen",style: AppColors.mainFontStyle,),),
    );
  }
}
