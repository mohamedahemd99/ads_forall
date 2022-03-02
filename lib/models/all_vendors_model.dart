import 'package:location/location.dart';

class AllVendorsModel {
  bool status;
  String message;
  List<Data> data;

  AllVendorsModel({this.status, this.message, this.data});

  AllVendorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int id;
  String name;
  String description;
  String phone;
  String email;
  String address;
  String latitude;
  String longitude;
  int vendorTypeId;
  String facebook;
  String youtube;
  String whatsapp;
  String twitter;
  String website;
  String instagram;
  String logo;
  String featureImage;
  int rating;
  List<String>imgs;
  List<Locations>locations;
  VendorType vendorType;

  Data({
    this.id,
    this.imgs,
    this.name,
    this.description,
    this.phone,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
    this.vendorTypeId,
    this.facebook,
    this.youtube,
    this.whatsapp,
    this.twitter,
    this.website,
    this.instagram,
    this.logo,
    this.featureImage,
    this.rating,
    this.vendorType,
    this.locations,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    vendorTypeId = json['vendor_type_id'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    whatsapp = json['whatsapp'];
    twitter = json['twitter'];
    website = json['website'];
    instagram = json['instagram'];
    logo = json['logo'];
    featureImage = json['feature_image'];
    rating = json['rating'];
    if (json['imgs'] != null) {
      imgs = <String>[];
      json['imgs'].forEach((v) {
        imgs.add(v);
      });
    }
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations.add( Locations.fromJson(v));
      });
    }

    vendorType = json['vendor_type'] != null
        ? new VendorType.fromJson(json['vendor_type'])
        : null;
  }
}

class VendorType {
  num id;
  String name;
  String nameAr;
  String slug;

  VendorType({
    this.id,
    this.name,
    this.nameAr,
    this.slug,
  });

  VendorType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    slug = json['slug'];
  }
}

class Locations {
  num id;
  String longitude;
  String latitude;
  Locations({
    this.id,
    this.longitude,
    this.latitude,
  });

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
}
