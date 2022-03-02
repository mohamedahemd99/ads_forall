import 'dart:collection';

import 'package:ads/lancher.dart';
import 'package:ads/models/all_vendors_model.dart';
import 'package:ads/screens/resourse/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactAdsScreen extends StatefulWidget {
  ContactAdsScreen(this.data);

  Data data;

  @override
  _ContactAdsScreenState createState() => _ContactAdsScreenState();
}

class _ContactAdsScreenState extends State<ContactAdsScreen> {
  var myMarkers = HashSet<Marker>();

  Widget googleMap({lat, long, function}) {
    return GoogleMap(
      // zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      // compassEnabled: false,
      // myLocationButtonEnabled: false,
      // myLocationEnabled: false,
      // tiltGesturesEnabled: false,
      // zoomGesturesEnabled: false,
      // buildingsEnabled: false,
      // rotateGesturesEnabled: false,
      // scrollGesturesEnabled: false,
      // onTap: (_) {
      //   AppLauncher.openMap(lat, long);
      // },
      initialCameraPosition: CameraPosition(
        zoom: 8,
        target: LatLng(lat, long),
      ),
      onMapCreated: function,
      markers: myMarkers,
    );
  }

  Widget buildContacts({Function function, icon, String phone}) {
    return Row(
      children: [
        IconButton(
          onPressed: function,
          icon: icon,
          color: AppColors.mainColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          phone,
          style: AppColors.mainFontStyle.copyWith(
              color: AppColors.mainColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget buildContactIcon({Function function, icon}) {
    return IconButton(
      onPressed: function,
      icon: icon,
      color: AppColors.mainColor,
    );
  }

  Data data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    myMarkers.add(
      Marker(
          markerId:
          MarkerId(data.id.toString()),
          position: LatLng(
            double.parse(data.latitude),
            double.parse(data.longitude),
          ),
          onTap: () {
            AppLauncher.openMap(
              double.parse(data.latitude),
              double.parse(data.longitude),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.data != null ? SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              buildContacts(
                phone: data.phone,
                function: () {
                  AppLauncher.makePhoneCall("${data.phone}");
                },
                icon: FaIcon(FontAwesomeIcons.phone),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      function: () {
                        if (data.facebook != null && data.facebook.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.facebook}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no facebook")));
                        }
                      }),
                  buildContactIcon(
                      icon: Icon(Icons.email),
                      function: () {
                        if (data.email != null && data.email.isNotEmpty) {
                          AppLauncher.launchInBrowser("${data.email}");
                        } else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no email")));
                        }
                      }),
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      function: () {
                        if (data.twitter != null && data.twitter.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.twitter}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no twitter")));
                        }
                      }),
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.youtube),
                      function: () {
                        if (data.youtube != null && data.youtube.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.youtube}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no youtube")));
                        }
                      }),
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      function: () {
                        if (data.instagram != null && data.instagram.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.instagram}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no instagram")));
                        }
                      }),
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.weebly),
                      function: () {
                        if (data.website != null && data.website.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.website}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no website")));
                        }
                      }),
                  buildContactIcon(
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      function: () {
                        if (data.whatsapp != null && data.whatsapp.isNotEmpty)
                          AppLauncher.launchInBrowser("${data.whatsapp}");
                        else {
                          return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("it has no whatsapp")));
                        }
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: googleMap(

                  lat: double.parse(data.latitude),
                  long: double.parse(data.longitude),
                  function: (GoogleMapController googleMapController) {
                    setState(() {
                      if (data.locations.isNotEmpty) {
                        for (int i = 0; i < data.locations.length; i++) {
                          myMarkers.add(
                            Marker(
                                markerId:
                                MarkerId(data.locations[i].id.toString()+data.locations[i].longitude),
                                position: LatLng(
                                  double.parse(data.locations[i].latitude),
                                  double.parse(data.locations[i].longitude),
                                ),
                                onTap: () {
                                  AppLauncher.openMap(
                                    double.parse(data.locations[i].latitude),
                                    double.parse(data.locations[i].longitude),
                                  );
                                }),
                          );
                        }
                      }
                      print(myMarkers);
                    });
                    print(myMarkers.length);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "there are ${data.locations.length +
                      1} location for this vendor",
                  style: AppColors.mainFontStyle.copyWith(
                      color: AppColors.mainColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ) : CircularProgressIndicator(),
    );
  }
}
