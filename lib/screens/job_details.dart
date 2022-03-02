import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key key}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "aaa",
      )),
      body: _buildJobsList(),
    );
  }

  _buildJobsList() {
    return ListTile(
        leading: Icon(Icons.list),
        trailing: Text(
          "GFG",
          style: TextStyle(color: Colors.green, fontSize: 15),
        ),
        title: Text("AAAAA"));
  }
}
