// Copyright 2018 PacNGO
// 
// Licensed using a modified Apache License, Version 0.1.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License 
// 
// 	in the root directory of the source repository that first laid a commit on it. 
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import "package:flutter/material.dart";
import "./main.dart" show ViewInk, ViewCard, CustomDrawer, DrawerCard;

class VolunteerView extends StatefulWidget {
  @override
  VolunteerViewState createState() => new VolunteerViewState();
}

class VolunteerViewState extends State<VolunteerView> {

  //Stopwatch clock = new Stopwatch();
  var count = 0;
  String _coverImage = 'assets/volunteerCover0.jpg';

  void _changeCover(){
    if (this.count > 2){
      setState((){
        this.count = 0;
      });
    }
    setState((){
      _coverImage = 'assets/volunteerCover${this.count}.jpg';
      this.count++;
    });



  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new GestureDetector(
        onTap: (){_changeCover();},
        child: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: new SliverAppBar(
                  backgroundColor: const Color(0xff000000),
                  pinned:true,
                  expandedHeight: 256.0,
                  forceElevated: innerBoxIsScrolled,
                  title: new Text("Volunteer"),
                  flexibleSpace: new FlexibleSpaceBar(
                    background: new Stack(
                      fit: StackFit.expand,
                      children: <Widget> [
                        new Image.asset(
                          _coverImage,
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
                  child: new ViewInk(
                    "MAKE A DIFFERENCE",
                    """
EACH OF US has the power to make a difference in the life of a homeless youth. Your Friendship, Time, Talents and Experiences can support a youth as they work towards a goal or look for friendship at the Oasis Center.

Here are the 5 ways you can volunteer with the Oasis Youth Programs:

¤ Outreach Volunteer: Go on street and school outreach with Street Hope to invite homeless and at-risk youth to The Coffee Oasis

¤ Oasis Youth Center Volunteer: Spend time in the Oasis Centers building relationships with youth, playing games, facilitating activities, and connecting youth with resources

¤ Mentor: Mentor a youth in Partnering Hope and help them reach their goals

¤ Teen Line Volunteer: Answer the Crisis Teen Line and offer support and help them reach their goals

¤ Shelter Volunteer: Spend a few hours in an evening at the Youth Shelter assisting the shelter counselor and caring for the youth residents
                    """
                  ),
                  
                ),
                new Image.asset("assets/volunteerCard0.png"),
                new Material(
                  child: new ViewInk(
                    "HOW DO I BECOME A VOLUNTEER?",
                    """
1. Attend a Volunteer Orientation
They are held the first Saturday of every month from 9am-11am.
You can RSVP online here.

2. Create an account
Making an account here will give you access to your volunteer info.

3. Fill out an application
Our applications are online here! Make sure to log in to your account first.

4. Do a background check
Send a picture or scan of your Drivers License to our office at connect@thecoffeeoasis.com                
                    """
                  ),

                ),
                new Image.asset("assets/volunteerCard1.png")
              ]
            )
          )
        )
        
      )
    );
  }
}

