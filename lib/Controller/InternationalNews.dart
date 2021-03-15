import 'package:flutter/material.dart';
import 'package:gaibandha/View/InternationalNews/InternationalAllNews.dart' as allnews;
import 'package:gaibandha/View/InternationalNews/InternationalNews_Gallery.dart' as gallery;
import 'package:gaibandha/View/InternationalNews/InternationalNews_PostDetails.dart';

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews>with SingleTickerProviderStateMixin {

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
        title: Text("নামকরণ ও ইতিহাস"),
        backgroundColor: Color(0xFF272b4a),

        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,
          tabs: [
            new Tab(icon: Icon(Icons.view_headline,),text: "নামকরণ ও ইতিহাস",),
            new Tab(icon: Icon(Icons.image,),text: "গ্যালারী",),


          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: [
          allnews.InternationNews(),
          gallery.Internationalnews_gallery(),
        ],
      ),

    );
  }
}
