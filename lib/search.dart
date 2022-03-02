/*

import 'package:challenge_task/challenge/model/model.dart';
import 'package:challenge_task/challenge/widget/product_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var items = [];

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> mallSearchList = [];
    mallSearchList.addAll(json);
    if (query.isNotEmpty) {
      List<Map<String, dynamic>> tempListData = [];
      mallSearchList.forEach((item) {
        if (item["status"].contains(query)) {
          tempListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(tempListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(mallSearchList);
      });
    }
  }

  @override
  void initState() {
    items.addAll(json);
    super.initState();
  }

  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: search,
              onChanged: (value) {
                filterSearchResults(value);
              },
              onSubmitted: (value) {
                setState(() {
                  search.text = value;
                });
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                List<String> tags = json[index]["tags"];
                return ProductCardWidget(index: index, tags: tags);
              },
              itemCount: items.length,
            ),
          ],
        ),
      )),
    );
  }
}
*/
