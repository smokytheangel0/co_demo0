//these are comments on one line
/* <--
  these are
  multi
| line
v comments
*/


//this is where we ask the libraries
//for their books ;)
import "package:flutter/material.dart";
import "dart:async" show Future;

//this is where bring in the
//other pages of this main book
import "./volunteer.dart" as volunteer;
import "./resources.dart" as resources;
import "./youth.dart" as youth;
import "./coffee.dart" as coffee;
import "./you.dart" as you;
import "./give.dart" as give;
import "./about.dart" as about;
import "./blog.dart" as blog;
import "./store.dart" as store;
import "./pageNOT.dart" as not;

/*
questions that must be answered as input to an 
automated folder creation tool how many views does
the server app have (can be none)

should be able to fire it back up on an already
created tree and change folder/file names

instead of page names use view names
saying that all programmers do is write code is
like saying all a barista does is speak english

create a rust wrapper for mac, linux, windows and web
this will allow us to be able to push views to all
those using the video game style opengl views :3
*/


//do not be afraid if you are lacking context dear
//reader, rush on and tackle this book with the app
//in hand
//0

//these are the helpers for
//the documentation at the top
//of the main() function

//vvvv <-- this is the type of inBOX0
String inBOX0 = "we can add some";

//vvvv <-- this is the function's output type
String yellow_out(inBOX0){
  String wordBOX0 = " more words";
  inBOX0 = inBOX0 + wordBOX0;
  return inBOX0;
}

class Green{
  Green();
}

/*
if you are not familiar with category logic, 
classes are basically prescriptions of object attributes
importantly when viewed in this context, individual classes
may contain usage of other classes' attributes

classes are Green */Green green = new Green();/*

you usually take a copy of a specific class
and put it into a box to be used locally only
the box usually only fit a specific class of contents

boxes are white */String white = "this box is called white";
/* and are usually typed with a class

functions are class attributes also called methods
they prescribe several algorithms that allow the class
to express its usage, its workflow recipes if you will

these dont have yellow under them when they are used
in the program itself, they just arent defined correctly above

functions are yellow */yellow(){}/*

they take inputs at the suspiciously hole shaped thing
where the user of the function puts boxes holding
ingredients

they drop their outputs into a box

*/String outBOX0 = yellow_out(inBOX0);/*

finally grey text behind two // characters
labels the end bracket depth by the class name
that is nearest to the matching start bracket
*/


void main() {
  runApp(new MaterialApp(
    home: new PageFrame0(),

    //the following allows you to start each
    //different view (the part after the ':')
    //just by typing the brown string 
    //(saves alot of work)
    routes:  <String, WidgetBuilder> {
      '/GiveView': (BuildContext context) => new give.GiveView(),
      '/VolunteerView' : (BuildContext context) => new volunteer.VolunteerView(),
      '/ResourcesView' : (BuildContext context) => new resources.ResourcesView(),
      '/AboutView' : (BuildContext context) => new about.AboutView(),
      '/BlogView' : (BuildContext context) => new blog.BlogView(),
      '/StoreView' : (BuildContext context) => new store.StoreView(),
      '/NotView' : (BuildContext context) => new not.View()
    }
  ));
}


//the following two classes are actually one Widget
//the tree in the state class 
//is the main page with tabs
//the default tab selected is 'youth'
class PageFrame0 extends StatefulWidget {
  @override
  PageFrame0State createState() => new PageFrame0State();
}


//This is the class that defines 
//what the actual page frame will look like
class PageFrame0State extends State<PageFrame0>
with SingleTickerProviderStateMixin {

  //this is the box for the tab controller
  TabController controller;
  //START
  //this sets up a new tab controller 
  //everytime the app is started
  @override
  void initState(){
    super.initState();
    //puts it in the box we made
    controller = new TabController(vsync: this, length: 3);
  }
  //this gets rid of it when
  //it is not needed
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //END
  
  //START
  //this allows you to press the back button
  //and go to the 'youth' tab which is now default
  Future<bool> _onWillPop() {
    //if the index in the tab controller box
    //is already set to the first index
    if (controller.index == 0){
      return new Future<bool>.value(true);
    }
    else {
      //otherwise set the index to the first position
      controller.index = 0;
      return new Future<bool>.value(false);
    }
  }
  //END

  @override
  Widget build(BuildContext context){
    return new WillPopScope(
      //this sets the function to run 
      //in the event of a back button press
      onWillPop: _onWillPop,

      //this is the skeleton of the view parts
      //it carries a drawer 
      //and the app bar, tab bar
      //and essentially the page views
      child: new Scaffold(
        drawer: new CustomDrawer(),

        //this is the code bloat that has to be
        //introduced by use of the animation
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),

                //this is where the actual parts
                // of the app bar are defined
                child: new SliverAppBar(
                  backgroundColor: const Color(0xff000000),
                  title: new Text("Coffee Oasis"),
                  pinned:true,
                  expandedHeight: 256.0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: new FlexibleSpaceBar(
                    background: new Stack(
                      fit: StackFit.expand,
                      children: <Widget> [
                        //cover image
                        new Image.asset(
                          'assets/coffeeCover0.jpg',
                          fit: BoxFit.cover,
                          height: 256.0
                        )
                      ]
                    )
                  ),

                  bottom: new TabBar(
                    //this is the same controller
                    //in the box we set up earlier
                    controller: controller,
                    //these are three tabs with icons stacked on them
                    //in a box fitted for Tab objects
                    tabs: <Tab>[
                      new Tab(
                        icon: new ImageIcon(
                          new AssetImage("assets/sun.png"),
                        )
                      ),

                      new Tab(
                        icon: new ImageIcon(
                          new AssetImage("assets/coffee.png"),
                        )
                      ),

                      new Tab(
                        icon: new ImageIcon(
                          new AssetImage("assets/child.png"),
                        )
                      )
                    ],
                  )
                )
              )
            ];
          },

          //this is where the page shows below the appbar,
          //three tabs worth
          body: new TabBarView(
            controller: controller,

            /*this kind of box has
              been seen but probably
              not yet understood*/
            
            //this is a list box
            //it is a partitioned box
            //that is typed with a class
            children: <Widget>[
              //tab index 0 (a widget)
              new youth.YouthView(),
              //tab index 1 (a widget)
              new coffee.CoffeeView(),
              //tab index 2 (a widget)
              new you.YouView()
            ],
          )
        )
        
      )
    );
  }
}

//this class (also called object or widget)
//defines the transparent card elements 
//with text on them
//that are used in the app drawer 
//(accessed using the the three bar icon top left)
class DrawerInk extends StatelessWidget{
  //these are the receiving boxes
  //that are going to be used
  //to sort the stuff the coder gives 
  //to the object when they use it
  final String text;
  final Icon icon;

  //this is the box that the route
  //is delivered in, it is a string type
  //and the contents look like this "/ViewAddress"
  final String route;

  //this part collects all the neccisary boxes
  //from a coder in order to display their contents
  //and navigate to addresses within the app
  DrawerInk(this.text, this.icon, this.route);

  //this is where the navigation
  //is defined using pieces from
  //the app context (a collection
  //of information about the parts
  //of the app)
  void onPressed(BuildContext context){
    Navigator.of(context).pushNamed(this.route);
  }
  @override
  Widget build(BuildContext context){
    //this is the start of the tree
    //for the drawer buttons
    return new FlatButton(
      padding: new EdgeInsets.symmetric(vertical: 15.0),
      //color: Colors.white,     
      child: new Row(children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(horizontal:10.0),
          child: this.icon
        ),
        new Flexible( 
          child: new Text(this.text,
                        softWrap: true)
        )
      ]),
    onPressed: (){onPressed(context);}
    );

  }
}


//this is the drawer object
//here we define the pieces in that
class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //this is the start of the tree 
    //for the drawer
    return new Drawer(
      child: new Container(
        color: const Color(0xffc9c3bb),        
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/mainlogo.jpg"),
                  fit: BoxFit.cover
                )
              )
            ),
            new DrawerInk(
              "about us",
              new Icon(Icons.assessment),
              "/AboutView"
            ),
            new DrawerInk(
              "read our blog",
              new Icon(Icons.book),
              "/BlogView"
            ),
            new DrawerInk(
              "our store is full of goodies",
              new Icon(Icons.explore),
              "/StoreView"
            ),
            new DrawerInk(
              "cart",
              new Icon(Icons.credit_card),
              "/NotView"
            )
          ]
        ),
        
      )
    );
  }
}


//this describes the portions of the page
//that have no apparent card, just text
class ViewInk extends StatelessWidget{
  final String text;
  final String title;

  ViewInk(this.title, this.text);

  @override
  Widget build(BuildContext context){
    //this is teh start of the tree
    //for the object used to display text
    //without using a card underneath
    return new Container(
      padding: new EdgeInsets.all(25.0),
      child: new Column(children: <Widget>[
        new Center(
          child: new Text(this.title, 
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Open Sans",
              fontSize: 17.4,
              color: const Color(0xFFc2421f)
              
            )),
        ),
        new Text("\n"),
        new Flexible(
          child: new Center(                    
            child: new Text(this.text,
                          softWrap: true,
                          style: new TextStyle(
                            fontFamily: "Open Sans"
                          ))
          )          
        )
      ],
      mainAxisSize: MainAxisSize.min),

    );

  }
}

//this describes the cards 
//within the main pages which
//have a background raised card
//with text content on top
//these almost always navigate
//to another view when tapped
class ViewCard extends StatelessWidget{
  final String text;
  final Icon icon;
  final String route;

  ViewCard(this.text, this.icon, this.route);

  void onPressed(BuildContext context){
    Navigator.of(context).pushNamed(this.route);
  }

  @override
  Widget build(BuildContext context){
    //this is the start of the tree
    //for the viewcard object
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0),
      child: new Card(
        color: const Color(0xffc9c3bb),
        child: new Ink(
          child: new FlatButton(
          
            padding: new EdgeInsets.symmetric(vertical: 30.0),
            child: new Row(children: <Widget>[
              new Container(
                padding: new EdgeInsets.symmetric(horizontal: 55.0),
                child: this.icon
              ),
              new Flexible( 
                child: new Text(this.text,
                              softWrap: true)
              )
            ]),
          onPressed: (){onPressed(context);}
          
          ),
        )
      )
      
    );
  }
}

