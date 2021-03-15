import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class LatestPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  LatestPostDetails(this.snapshot);

  @override
  _LatestPostDetailsState createState() => _LatestPostDetailsState();
}

class _LatestPostDetailsState extends State<LatestPostDetails> {
  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      LatestPostDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.snapshot.data["title"]),
        //title: Text(widget.snapshot.data["title"]),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),
      body: new ListView(
        children: [
          // 1st container image
          new Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height - 400,
            //height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(
                widget.snapshot.data["image"],
                //height: 250.0,
                height: MediaQuery.of(context).size.height - 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 1st container end image
          SizedBox(
            height: 6.0,
          ),
          new Container(
            color: Color(0xFF272B4A),
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height + 765,
            //height: 900.0,
            child: new Column(
              children: [
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new CircleAvatar(
                        child: new Text(
                          widget.snapshot.data["title"][0],
                          style: TextStyle(
                            fontSize: 21.0,
                          ),
                        ),
                        backgroundColor: Color(0xFF222240),
                      ),
                      new SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: new Text(
                          widget.snapshot.data["title"],
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height + 600,
                  child: new Text(
                    widget.snapshot.data["content"][0] +
                        "\n\n" +
                        widget.snapshot.data["content"][1] +
                        "\n\n" +
                        widget.snapshot.data["content"][2] +
                        "\n\n" +
                        widget.snapshot.data["content"][3] +
                        "\n\n" +
                        widget.snapshot.data["content"][4] +
                        "\n\n" +
                        widget.snapshot.data["content"][5]+
                        "\n\n" +
                        widget.snapshot.data["content"][6]
                    ,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
