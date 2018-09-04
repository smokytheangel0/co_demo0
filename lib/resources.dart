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

class ResourcesView extends StatelessWidget{
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
                title: new Text("Resources"),
                pinned:true,
                expandedHeight: 256.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      new Image.asset(
                        'assets/youCover0.jpg',
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
                  "DONATE RESOURCES\n\tgive dignity",
                  """
It's amazing what we can take for granted on a daily basis; being able to shower before work or having a clean shirt to change into.

Many youth who come to The Coffee Oasis are in need of basic items like a warm coat or shampoo. When you donate resources it's more than just a physical gift; it gives dignity to someone. It says "I care about you." Your donations make a BIG difference.                  
                  """
                )
              ),
              new Image.asset("assets/resourceCard0.png"),
              new Material(
                child: new ViewInk(
                  "WHEN CAN I DROP OFF MY DONATION?",
                  """
Bremerton Oasis Center / 1pm-5pm, M-F
837 4th St, Bremerton, WA (up the stairs in the back)

Port Orchard Oasis Center / 1pm-5pm, M-F
807A Bay St, Port Orchard, WA (up the stairs in the back)

Poulsbo Oasis Center (right-hand door near basketball hoop) / 1pm-5pm, M-F
780 NE Iverson Rd, Poulsbo, WA                  
                  """
                )
              )
            ]
          )
        )
      )
    );
  }
}

