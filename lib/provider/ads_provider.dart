// import 'dart:convert';
//
// import 'package:ads/models/all_vendors_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class AllVendorsProvider extends ChangeNotifier
// {
//   String country;
//   VendorType category;
//   AllVendorsModel allVendorsModel;
//   AllVendorsModel filteredVendorsModel;
//   List<VendorType> vendorTypeModel;
//   List<dynamic> countries = [];
//   int vendor_type_id;
//   Future<void> getAllVendors() async {
//     final url = "http://forallfa.org/api/allvendors";
//     http.get(Uri.parse(url)).then((value) {
//       allVendorsModel = AllVendorsModel.fromJson(json.decode(value.body));
//       notifyListeners();
//       // print("model.data[0].vendorType");
//     }).catchError((error) {
//       print("${error.toString()}");
//     });
//   }
//
//   Future<void> getFilteredVendors(String country, int vendor_type_id) async {
//     final url =
//         "http://forallfa.org/api/filtervendor?country=$country&vendor_type_id=$vendor_type_id";
//     http.get(Uri.parse(url)).then((value) {
//       print(country);
//       print(vendor_type_id);
//       print(value.body);
//
//       filteredVendorsModel = AllVendorsModel.fromJson(json.decode(value.body));
//       print("${filteredVendorsModel.data[0].name}");
//       notifyListeners();
//     }).catchError((error) {
//       print("${error.toString()}");
//     });
//   }
//
//   Future<void> getAllCountries() async {
//     final url = "http://forallfa.org/api/countries";
//     http.get(Uri.parse(url)).then((value) {
//       List<dynamic> countries1 = jsonDecode(value.body);
//       print(countries1);
//       for (int i = 0; i < countries1.length; i++) {
//         if (countries1[i] != null) countries.add(countries1[i]);
//       }
//       print(countries);
//       notifyListeners();
//     }).catchError((error) {
//       print("${error.toString()}");
//     });
//   }
//
//   Future<void> getAllVendorTypes() async {
//     final url = "http://forallfa.org/api/vendor/types";
//     http.get(Uri.parse(url)).then((value) {
//       print(value.body);
//       Iterable list = json.decode(value.body);
//       vendorTypeModel =
//           list.map((model) => VendorType.fromJson(model)).toList();
//       print(vendorTypeModel[0]);
//     }).catchError((error) {
//       print("${error.toString()}");
//     });
//   }
//
// }