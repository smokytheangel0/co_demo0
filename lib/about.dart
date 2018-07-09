import "package:flutter/material.dart";
import "./main.dart" show ViewInk, ViewCard, CustomDrawer, DrawerCard;

class AboutView extends StatelessWidget{
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
                title: new Text("Who Are We?"),
                pinned:true,
                expandedHeight: 256.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      new Image.asset(
                        //there are three images to go through here
                        //so we need to make this stateful
                        //and create a string builder to output
                        //below based on a duration
                        //then i think we have to do a did update
                        'assets/aboutCover0.jpg',
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
        body: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 105.0),
            ),
            
            new ViewInk(
              "MISSION STATEMENT",
              """
Changing the world for homeless youth in one community after another through evidence-based youth programs supported by sustainable coffee businesses.              
              """
            ),
            new ViewInk(
              "WHAT DO WE DO?",
              """
The Coffee Oasis is a faith-based, non-profit organization that consists of two things: coffee businesses and youth programs.           

Our cafés provide community gathering places, and serve our self-roasted coffee from direct-trade coffee beans. The Coffee Oasis youth programs offer friendship, belonging, resources, and opportunity to homeless and street-oriented youth, ages 13-25. All proceeds from the businesses support the Oasis youth programs.
              """
            ),
            new ViewInk(
              "OUR HOPE",
              """
Our hope is that youth know that they are wanted -- that they belong. They don't need to keep running, angry and alone. We hope they grow up to be good and wise men and women. We hope they are restored in relationship with their family, their community, and God.              
              """
            )
          ],
        )//content
      )
    );
  }
}

