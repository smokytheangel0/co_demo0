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
import "./main.dart" show ViewInk, ViewCard;

/*
this is loosely formatted text that is in the images


change the world fo homeless youth
drug abuse homelessness. vielence. poverty
THese are real problems affecting real kids in our community
ou hope is to transform the lives of homeless and street involved youth through
  street hope: street and school outreach
  oasis centers: youth centers and resources
  partnering hope cas management and mentoring
  hope inc job training and internships
  oasis hope home: shelter and stability
  crisis intervention- guidance and safety

our goal is to be out there. wherever they arev in the midst of whatever theyre going through
to compassionately guide troubled and at risk youth into lives of dignity integrity and responsibility
to see not just youth lives changed but the world around them change and become a place that cares for hurting youth

the coffee oasis offers all resources services activities and programs without regard to religious beliefs race color gender ethnicity sexual orientation oor disablity
*/


class YouthView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //this starts the tree at a material
    return new Material(
      //this material has a blue color
      color: const Color(0xFF327271),
      //on top of it (further up the tree)
      child: new ListView(
        //is a listview (scroll list)
        //it has a box of widgets stacked on it
        children: <Widget>[
          //inside the list view
          //we put three containers with
          //images stacked on top of each
          new Container(
            padding: new EdgeInsets.only(top: 170.0),
            child: new Image.asset(
              "assets/clubCard0.jpg"
            ),

          ),
          new Container(
            padding: new EdgeInsets.only(top: 40.0),
            child: new Image.asset(
              "assets/clubCard1.png"
            ),

          ),
          new Container(
            padding: new EdgeInsets.symmetric(vertical:40.0),
            child: new Image.asset(
              "assets/clubCard2.png"
            ),

          ),

        ],
      )

    );  }
}

/*
*/
