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

class StoreView extends StatelessWidget{
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
                title: new Text("Store"),
                pinned:true,
                expandedHeight: 360.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      new Image.asset(
                        'assets/storeCover0.jpg',
                        fit: BoxFit.cover,
                        height: 360.0
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

