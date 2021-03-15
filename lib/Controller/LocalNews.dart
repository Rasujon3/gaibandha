import 'package:flutter/material.dart';
import 'package:gaibandha/View/LocalNews/LocalAllNews.dart' as allnews;
import 'package:gaibandha/View/LocalNews/LocalNewsGallery.dart' as gallery;

class LocalControllerNews extends StatefulWidget {
  @override
  _LocalControllerNewsState createState() => _LocalControllerNewsState();
}

class _LocalControllerNewsState extends State<LocalControllerNews>with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller= new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("দর্শনীয় স্থান"),
        backgroundColor: Color(0xFF272b4a),

        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,
          tabs: [
            new Tab(icon: Icon(Icons.view_headline,),text: "দর্শনীয় স্থান",),
            new Tab(icon: Icon(Icons.image,),text: "গ্যালারী",),


          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: [
          allnews.LocalNews(),
          gallery.LocalNews_Gallery(),
        ],
      ),

    );
  }
}
