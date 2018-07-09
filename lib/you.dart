import "package:flutter/material.dart";
import "./main.dart" show ViewInk, ViewCard;

class YouView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: const Color(0xFF327271),
      child: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 120.0),
          ),
          new Container(            
            //color: const Color(0xFFFFFFFF),
            child: new ViewCard(
              "GIVE",
              new Icon(Icons.favorite),
              "/GiveView"
              ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),

          new Container(
            //color: const Color(0xFFFFFFFF),
            child: new ViewCard(
              "VOLUNTEER",
              new Icon(Icons.group),
              "/VolunteerView"
              ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),

          new Container(
            //color: const Color(0xFFFFFFFF),
            child: new ViewCard(
              "DONATE RESOURCES",
              new Icon(Icons.memory),
              "/ResourcesView"
              ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0)
          ),
          new Material(
            color: const Color(0xFFFFFFFF),
            child: new ViewInk(
              "MAKE A DIFFERENCE IN YOUR CITY",
              """
The Coffee Oasis is what it is because over the years, one person at a time, people decided to give their time, talents and treasures to something bigger than themselves. Whether it was volunteering as a mentor or giving sleeping bags in the winter, people like you have built a community of care and true family that brings lasting change to kids on the street.

We call this 'neighboring' -- to love and live in such a way where you truly know your neighbor and share life with them. 

That's what getting involved is all about. It's about getting to know someone's story and sharing your own, to see your community and the people in it transformed. Get involved today!
              """
            ),
            
          )          
          

        ],
      )

    );
  }
}

