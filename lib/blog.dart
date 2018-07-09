import "package:flutter/material.dart";
import "./main.dart" show ViewInk, ViewCard, CustomDrawer, DrawerCard;

class BlogView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: new SliverAppBar(
                backgroundColor: const Color(0xff000000),
                title: new Text("Blog"),
                pinned:true,
                expandedHeight: 256.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      new Image.asset(
                        'assets/blogCover0.jpg',
                        fit: BoxFit.cover,
                        height: 256.0
                      )
                    ]
                  )
                ),
              )
            )
          ];
        },
        body: new Text("test5")//content
      )
    );
  }
}

