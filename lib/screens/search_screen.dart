import 'package:ads/models/all_vendors_model.dart';
import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ads_details/ads_details.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen(this.filteredVendors);

  AllVendorsModel filteredVendors;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  AllVendorsModel filteredVendors;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    filteredVendors.data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      filteredVendors=widget.filteredVendors;
      print(filteredVendors);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {

                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.chevron_left),
          ),
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          title: Text(
            "ForAll Ads",
            style: AppColors.mainFontStyle.copyWith(fontSize: 20),
          ),
        ),
        body: filteredVendors.data != null
            ? Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: filteredVendors.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Image.network(
                    "${filteredVendors.data[index].logo}",
                    width: 70,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${filteredVendors.data[index].name}",
                        style: AppColors.mainFontStyle,
                      ),
                      Text(
                        "${filteredVendors.data[index].description}",
                        style: AppColors.secondFontStyle,
                      ),
                      RatingBarIndicator(
                        rating:
                        filteredVendors.data[index].rating.toDouble(),
                        itemBuilder: (context, index) =>
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  onTap: () {
                    print(filteredVendors.data[index]);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AdsDetailsScreen(
                                data: filteredVendors.data[index])));
                  },
                ),
              );
            },
          ),
        )
            : Center(
          child: Center(
            child: Text(
              "No Vendors yet",
              style: AppColors.mainFontStyle,
            ),
          ),
        ),
      );
    },);
  }
}
