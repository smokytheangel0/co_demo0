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
buy coffee give opportunity
the coffee oasis businesses play a vital role in changing the world for homeless youth
they provide opportunities for youth and gathering places for the communtiy
they also support coffee farm communities by using only direct trade beans which translates into fair wages
and community development for the farmers

theres two main ways the businesses play a role in caring for homeless youth: job
internships and coffee roasting. youth can participate in job internships at the various coffee oasis businesses
learning skills and gaining confidence as they work towards permanent employment
the coffee oasis also roasts its own coffee in the brumerton burwell cafe and operates four
different business locations all business proceeds support the oasis youth programs
that offer resourcecs like a youth shelter case management and a ayouth center

so when you get a latte or a bag of coffee you not only know you coffee is fresh and excellently made but itso also making a difference

*/

class CoffeeView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      color: const Color(0xFF327271),
     
      child: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 105.0),
          ),
          
          new Material(
            child: new ViewInk(
              "BUY COFFEE. GIVE OPPORTUNITY.",
              """
The Coffee Oasis buisinesses play a vital role in changing the world for homeless youth. They provide opportunities for youth and gathering places for the community. They also support coffee farm communities by using only Direct Trade beans, which translates into fair wages and community development for the farmers.

There's two main ways the businesses play a role in caring for the homeless youth: job internships and coffee roasting. Youth can participate in job internships at the various Coffee Oasis businesses, learning skills and gaining Confidence, as they work towards permanent employment. The Coffee Oasis also roasts its own coffee in the Bremerton Burwell Cafe and operates four different business locations. All business proceeds support the Oasis Youth Programs that offer resources like a youth shelter, case management, and youth center.

So when you get a latte or a bag of coffee you not only know your coffee is fresh and excellently made, but it's also making a difference.



                          Browse the store:              
              """
            )
          ),
          new Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0)
          ),
          new ViewCard(
            "STORE",
            new Icon(Icons.explore),
            "/StoreView"
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0)
          ),

        ],
      )

    );
  }
}
