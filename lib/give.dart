import "package:flutter/material.dart";
import "./main.dart" show ViewInk, ViewCard, CustomDrawer, DrawerCard;

class GiveView extends StatelessWidget{
  void onPressed(BuildContext context){
    Navigator.of(context).pushNamed('/NotView');
  }

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
                title: new Text("Give"),
                pinned:true,
                expandedHeight: 256.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      new Image.asset(
                        'assets/giveCover0.jpg',
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
        body: new Material(
          color: const Color(0xFF327271),
          child: new ListView(
            children: <Widget> [
              
              new Padding(
                padding: const EdgeInsets.only(top: 55.0)
              ),
            
              new Material(
                color: const Color(0xFFFFFFFF),
                child: new ViewInk(
                  "Homeless youth are in need of opportunity",
                  """
Opportunity to gain stability, housing, employment, education, hope, love, and family.

These opportunities only happen because people give.

Your gift IS making a difference!

When you give you know that 100% of your gift is going directly to Oasis youth programs that create these opportunities for homeless youth!

¤ \$10 provides hygiene items and laundry service
¤ \$25 provides a month of case management
¤ \$50 provides one night's stay in the shelter
¤ \$150 provides a jop internship stipend

The Coffee Oasis is a registered 501(c)3 non-profit organization.

All donations given to The Coffee Oasis are tax-deductible
                  """
                )
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0)
              ),
              new Container(
                padding: new EdgeInsets.symmetric(horizontal: 15.0),
                child: new Card(
                  color: const Color(0xffc9c3bb),
                  child: new Ink(
                    child: new FlatButton(
                    
                      padding: new EdgeInsets.symmetric(vertical: 50.0),
                      child: new Row(children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.symmetric(horizontal: 55.0),
                          child: new Icon(Icons.monetization_on),
                        ),
                        new Flexible( 
                          child: new Text("GIVE",
                                        softWrap: true,
                                        style: new TextStyle(fontSize: 18.0))
                        )
                      ]),
                    onPressed: (){onPressed(context);}
                    
                    ),
                  )
                )
                
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0)
              ),
              //new Image.asset("assets/giveCard0.png"),
            
              
            ]
          )
        )
      )
    );
  }
}

