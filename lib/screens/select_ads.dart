import 'dart:convert';
import 'package:ads/models/all_vendors_model.dart';
import 'package:ads/screens/resourse/colors.dart';
import 'package:ads/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ads_details/ads_details.dart';
import 'package:http/http.dart' as http;

class AdsSelection extends StatefulWidget {
  @override
  _AdsSelectionState createState() => _AdsSelectionState();
}

class _AdsSelectionState extends State<AdsSelection> {
  String country;
  String city;
  VendorType category;
  AllVendorsModel allVendorsModel;
  AllVendorsModel filteredVendorsModel;
  List<VendorType> vendorTypeModel;
  List<dynamic> countries = [
    "France",
    "Spain",
    "Greece",
    "egypt",
    "Turkey",
    "saudia arabia"
  ];
  List<dynamic> cities = ["paris", "cairo", "madrid", "amman"];
  int vendor_type_id;
  bool refresh = false;

  Future<void> getAllVendors() async {
    final url = "http://forallfa.org/api/allvendors";
    http.get(Uri.parse(url)).then((value) {
      print(value.statusCode);
      refresh = false;
      allVendorsModel = AllVendorsModel.fromJson(json.decode(value.body));
      // debugPrint("model.data[0].vendorType");
      setState(() {});
    }).catchError((error) {
      debugPrint("${error.toString()}");
    });
  }

  Future<void> getFilteredVendors(
      {String country, String city, int vendor_type_id}) async {
    final url =
        "http://forallfa.org/api/filtervendor?country=$country&vendor_type_id=$vendor_type_id&city=$city";
    http.get(Uri.parse(url)).then((value) {
      print(value.statusCode);
      debugPrint(country);
      debugPrint(vendor_type_id.toString());
      debugPrint(value.body);
      filteredVendorsModel = AllVendorsModel.fromJson(json.decode(value.body));
      debugPrint("${filteredVendorsModel.data[0].name}");
    }).catchError((error) {
      debugPrint("${error.toString()}");
    });
  }

  //
  // Future<void> getAllCountries() async {
  //   final url = "http://forallfa.org/api/countries";
  //   http.get(Uri.parse(url)).then((value) {
  //     print(value.statusCode);
  //
  //     List<dynamic> countries1 = jsonDecode(value.body);
  //     countries1.map((e) {
  //       if(e!=null&&country.contains(e)==false){
  //         countries.add(e);
  //       }
  //     });
  //     debugPrint(countries1.toString());
  //     // for (int i = 0; i < countries1.length; i++) {
  //     //   if (countries1[i] != null)
  //     //     if(country.contains(countries1[i])==false)
  //     //        countries.add(countries1[i]);
  //     // }
  //     debugPrint(countries.toString());
  //     setState(() {});
  //   }).catchError((error) {
  //     debugPrint("${error.toString()}");
  //   });
  // }
  //
  // Future<void> getAllCities() async {
  //   final url = "http://forallfa.org/api/cities";
  //   http.get(Uri.parse(url)).then((value) {
  //     print(value.statusCode);
  //
  //     List<dynamic> cities1 = jsonDecode(value.body);
  //     debugPrint(cities1.toString());
  //     for (int i = 0; i < cities1.length; i++) {
  //       if (cities1[i] != null && cities1[i].toString().isNotEmpty) cities.add(cities1[i]);
  //     }
  //     debugPrint(cities.toString());
  //     setState(() {});
  //   }).catchError((error) {
  //     debugPrint("${error.toString()}");
  //   });
  // }

  Future<void> getAllVendorTypes() async {
    final url = "http://forallfa.org/api/vendor/types";
    http.get(Uri.parse(url)).then((value) {
      print(value.statusCode);

      debugPrint(value.body);
      Iterable list = json.decode(value.body);
      vendorTypeModel =
          list.map((model) => VendorType.fromJson(model)).toList();
      debugPrint(vendorTypeModel[0].toString());
    }).catchError((error) {
      debugPrint("${error.toString()}");
    });
  }

  void _build() async {
    await getAllVendors();
    // await getAllCities();
    await getAllVendorTypes();
    // await getAllCountries();
  }

  @override
  void initState() {
    super.initState();
    _build();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              setState(() {
                getAllVendors().then((value) {
                  refresh = !refresh;
                });
              });
            },
            child: Text(
              "get all ads ",
              style: AppColors.mainFontStyle,
            ),
          )
        ],
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          "ForAll Ads",
          style: AppColors.mainFontStyle.copyWith(fontSize: 20),
        ),
      ),
      body: (allVendorsModel != null &&
              countries.isNotEmpty &&
              vendorTypeModel.isNotEmpty)
          ? Padding(
              padding: EdgeInsets.all(10),
              child: _buildBody(allVendorsModel.data),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _buildBody(data) {
    return Column(
      children: [
        _buildRowField(),
        SizedBox(
          height: 5,
        ),
        data != null && !refresh
            ? Expanded(child: buildListItems(data))
            : CircularProgressIndicator(),
      ],
    );
  }

  _buildRowField() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.canvasColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField<dynamic>(
                    isExpanded: true,
                    alignment: AlignmentDirectional.bottomCenter,
                    menuMaxHeight: 200,
                    dropdownColor: AppColors.mainColor,
                    iconEnabledColor: AppColors.mainColor,
                    value: country,
                    items: countries
                        .map(
                          (label) => DropdownMenuItem<String>(
                            child: Text(
                              label.toString(),
                              style: TextStyle(
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: label,
                          ),
                        )
                        .toList(),
                    hint: Text('country',
                        style: TextStyle(
                          color: AppColors.fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    onChanged: (value) {
                      setState(() {
                        country = value;
                        // vendor_type_id = value.id;
                        if (city != null &&
                            vendor_type_id != null &&
                            country != null) {
                          getFilteredVendors(
                                  country: country,
                                  vendor_type_id: vendor_type_id,
                                  city: city)
                              .then((value) {});
                        }
                        setState(() {});
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.canvasColor,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<dynamic>(
                  isExpanded: true,
                  alignment: AlignmentDirectional.bottomCenter,
                  menuMaxHeight: 200,
                  dropdownColor: AppColors.mainColor,
                  iconEnabledColor: AppColors.mainColor,
                  value: city,
                  items: cities
                      .map(
                        (label) => DropdownMenuItem<String>(
                          child: Text(
                            label.toString(),
                            style: TextStyle(
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: label,
                        ),
                      )
                      .toList(),
                  hint: Text('city',
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                      // vendor_type_id = value.id;
                      if (city != null &&
                          vendor_type_id != null &&
                          country != null) {
                        getFilteredVendors(
                                country: country,
                                vendor_type_id: vendor_type_id,
                                city: city)
                            .then((value) {});
                      }
                      setState(() {});
                    });
                  },
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.canvasColor,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField<VendorType>(
                  isExpanded: true,
                  alignment: AlignmentDirectional.centerStart,
                  menuMaxHeight: 200,
                  dropdownColor: AppColors.mainColor,
                  iconEnabledColor: AppColors.mainColor,
                  value: category,
                  items: vendorTypeModel
                      .map(
                        (vendorType) => DropdownMenuItem(
                          child: Text(
                            vendorType.name,
                            style: TextStyle(
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: vendorType,
                        ),
                      )
                      .toList(),
                  hint: Text('category',
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  onChanged: (value) {
                    category = value;
                    vendor_type_id = value.id;
                    if (city != null &&
                        vendor_type_id != null &&
                        country != null) {
                      getFilteredVendors(
                              country: country,
                              vendor_type_id: vendor_type_id,
                              city: city)
                          .then((value) {});
                    }
                    setState(() {});
                  },
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
          child: Text(
            "select country and category to search ",
            style: AppColors.mainFontStyle,
          ),
        ),
        MaterialButton(
            color: AppColors.canvasColor,
            onPressed: () {
              setState(() {
                if (filteredVendorsModel != null)
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SearchScreen(filteredVendorsModel)));
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.mainColor,
                ),
                Text(
                  "search",
                  style: AppColors.secondFontStyle,
                ),
              ],
            )),
      ],
    );
  }

  buildListItems(List<Data> data) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildVendor(data[index]);
      },
    );
  }

  _buildVendor(Data data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.network(
          "${data.logo}",
          width: 70,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${data.name}",
              overflow: TextOverflow.ellipsis,
              style: AppColors.mainFontStyle,
            ),
            Text(
              "${data.description}",
              style: AppColors.secondFontStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RatingBarIndicator(
              rating: data.rating.toDouble(),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        onTap: () async {
          if (data != null) {
            debugPrint(data.toString());
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AdsDetailsScreen(data: data)));
          }
        },
      ),
    );
  }
}
