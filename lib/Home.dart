import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaibandha/Controller/InternationalNews.dart';
import 'package:gaibandha/Controller/LocalNews.dart';
import 'package:gaibandha/Controller/PoliticsNews.dart';
import 'package:gaibandha/Controller/SportsNews.dart';


import 'dart:async';
import 'DetailsLatestPost.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future getallpost() async {
    var firestore = Firestore.instance;

    QuerySnapshot snap =
    await firestore.collection("upojela").getDocuments(); // latestnews
    return snap.documents;
  } // get data from server, table name internationalnews

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getallpost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("গাইবান্ধা জেলা"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: new Drawer(
        child: Container(
          color: Color(0xFF272B4A),
          child: new ListView(
            children: [
              new UserAccountsDrawerHeader(
                accountName: new Text("গাইবান্ধা জেলা"),
                accountEmail: null,
                decoration: new BoxDecoration(
                  color: Color(0xFF222240),
                ),
              ),
              new ListTile(
                title: Text(
                  "নামকরণ ও ইতিহাস",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> InternationalNews()));
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              new ListTile(
                title: Text(
                  "দর্শনীয় স্থান",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> LocalControllerNews()));
                },
                leading: new Icon(
                  Icons.sports,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              new ListTile(
                title: Text(
                  "নদ ও নদী",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> SportsNews()));
                },
                leading: new Icon(
                  Icons.local_bar_rounded,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              new ListTile(
                title: Text(
                  "কৃতি ব্যক্তিত্ব",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PoliticsNews()));
                },
                leading: new Icon(
                  Icons.accessibility_new_sharp,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF222240),
      body: FutureBuilder(
        future: getallpost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "Data Loading...",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: onRefresh,
              backgroundColor: Colors.green,
              color: Colors.white,
              child: ListView(
                children: [
                  // 1st container start
                  new Container(
                    height: 210.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "সাতটি উপজেলা",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new SizedBox(
                          height: 5.0,
                        ),
                        new Container(
                          height: 150.0,
                          margin: EdgeInsets.only(top: 8.0),
                          child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Color(0xFF272B4A),
                                  width: MediaQuery.of(context).size.width - 100,
                                  margin: EdgeInsets.only(left: 10.0),
                                  //height: 150.0,
                                  child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      new Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: new Image.network(
                                            snapshot.data[index].data["image"],
                                            fit: BoxFit.cover,
                                            height: 149,
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        width: 10.0,
                                      ),
                                      new Expanded(
                                        flex: 2,
                                        child: new Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            LatestPostDetails(
                                                                snapshot.data[index])));
                                              },
                                              child: new Text(
                                                snapshot.data[index].data["title"],
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            new SizedBox(
                                              height: 5.0,
                                            ),
                                            new Text(
                                              snapshot.data[index].data["content"][0],
                                              //snapshot.data[index].data["content"],
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            new SizedBox(
                                              height: 20.0,
                                            ),
                                            new Container(
                                              child: new Row(
                                                children: [
                                                  new Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.deepOrange,
                                                  ),
                                                  new SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  new Text(
                                                    "View",
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  // 1st container end

                  new SizedBox(
                    height: 1.0,
                  ),

                  // Second Container carousol slider start

                  new Container(
                    margin: EdgeInsets.all(5.0),
                    height: 150.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        boxFit: BoxFit.cover,
                        autoplay: true,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 600),
                        dotSize: 7.0,
                        dotIncreasedColor: Color(0xFFFF335C),
                        dotBgColor: Colors.transparent,
                        dotPosition: DotPosition.bottomCenter,
                        dotColor: Colors.green,
                        dotVerticalPadding: 10.0,
                        showIndicator: true,
                        borderRadius: true,
                        indicatorBgPadding: 7.0,
                        images: [
                          //Image.network('https://thefinancialexpress.com.bd/uploads/1537114417.jpg'),

                          NetworkImage(
                              'https://2.bp.blogspot.com/-Crr_dxVZ_wE/Vwm-E6zJKlI/AAAAAAAAAyI/MpHp8m_uWqAg9toxHu3gvVC6pLKzqSPwQ/s1600/Boys%2Bschool.jpg'),
                          NetworkImage(
                              'https://hrm.dghs.gov.bd//files/2016-08-07_061500_g4Ai9uRGiphE_sadullapur@uhfpo.dghs.gov.bd.jpg'),
                          NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Fulsori_Ghat_Gaibandha.jpg/1200px-Fulsori_Ghat_Gaibandha.jpg'),
                          NetworkImage(
                              'https://www.jamuna.tv/wp-content/uploads/2019/05/gobindogonj-paurosova.jpg'),
                          NetworkImage(
                              'https://3.bp.blogspot.com/-SRh8MrAALY4/V87pZCHhrII/AAAAAAAAACo/5hyzG8JlfEUXxEHrArezEkWcR9NKFzgRACLcB/w1200-h630-p-k-no-nu/acloffice.jpg'),
                          NetworkImage(
                              'https://www.fns24.com/resources/images/137052_image_url_Saghata%20photo..jpg'),
                          NetworkImage(
                              'https://cdn.jagonews24.com/media/imgAllNew/BG/2019November/pic-saghta-gaibandha-20200412152034.jpg'),
                          NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbYLTeX5GOxCNsizDQaP0u13wG5WZbKHkTEg&usqp=CAU'),
                        ],
                      ),
                    ),
                  ),

                  // Second Container carousol slider End

                  SizedBox(
                    height: 6.0,
                  ),
                  // third container start
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 300.0,
                    child: Column(
                      children: [
                        // first container in 3rd
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF272b4a),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    InternationalNews()));
                                      },
                                      child: Text(
                                        "নামকরণ ও ইতিহাস",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF272b4a),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    LocalControllerNews()));
                                      },
                                      child: Text(
                                        "দর্শনীয় স্থান",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // first container in 3rd end
                        SizedBox(
                          height: 10.0,
                        ),
                        // second container in 3rd start
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF272b4a),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => SportsNews()));
                                      },
                                      child: Text(
                                        "নদ ও নদী",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF272b4a),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => PoliticsNews()));
                                      },
                                      child: Text(
                                        "কৃতি ব্যক্তিত্ব",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // second container in 3rd end
                      ],
                    ),
                  )
                  // third container end
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
