import 'package:flutter/material.dart';
import 'package:gaibandha/View/SportsNews/SportsAllNews.dart' as AllNews;
import 'package:gaibandha/View/SportsNews/Sports_Gallery.dart' as Gallery;

class SportsNews extends StatefulWidget {
  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews>with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller= new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("নদ ও নদী"),
        backgroundColor: Color(0xFF272b4a),

        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,
          tabs: [
            new Tab(icon: Icon(Icons.view_headline,),text: "নদ ও নদী",),
            new Tab(icon: Icon(Icons.image,),text: "গ্যালারী",),


          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: [
          AllNews.SportsNews(),
          Gallery.SportsNews_Gallery(),
        ],
      ),

    );
  }
}
