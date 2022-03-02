import 'package:ads/models/all_vendors_model.dart';
import 'package:ads/screens/ads_details/ads_details_tabs/ads_about.dart';
import 'package:ads/screens/ads_details/ads_details_tabs/ads_gallery.dart';
import 'package:ads/screens/ads_details/ads_details_tabs/ads_product.dart';
import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';
import 'ads_details_tabs/ads_contact.dart';
import 'ads_details_tabs/ads_jobs.dart';
import 'ads_details_tabs/image_message_screen.dart';

class AdsDetailsScreen extends StatefulWidget {
  final Data data;

  AdsDetailsScreen({this.data});

  @override
  _AdsDetailsScreenState createState() => _AdsDetailsScreenState();
}

class _AdsDetailsScreenState extends State<AdsDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
        backgroundColor: AppColors.mainColor,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  navigateTo(context, ImageMessageScreen(widget.data.logo));
                },
                child: Hero(
                  tag: "image",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${widget.data.logo}"),
                    radius: 28,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data.name}",
                  style: AppColors.mainFontStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("${widget.data.name}", style: AppColors.secondFontStyle),
              ],
            ))
          ],
        ),
        bottom: TabBar(
          controller: controller,
          tabs: [
            buildTab(text: "About"),
            buildTab(text: "Jobs"),
            buildTab(text: "Product"),
            buildTab(text: "Gallery"),
            buildTab(text: "Contact"),
          ],
        ),
      ),
      body: TabBarView(
        physics:NeverScrollableScrollPhysics() ,
        controller: controller,
        children: [
          AboutAdsScreen(des: widget.data.description),
          JobsAdsScreen(),
          ProductAdsScreen(),
          GalleryAdsScreen(widget.data.imgs),
          ContactAdsScreen(widget.data),
        ],
      ),
    );
  }
}

Widget buildTab({String text}) {
  return Tab(
    child: Text(
      text,
      style: AppColors.mainFontStyle.copyWith(fontSize: 10),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
