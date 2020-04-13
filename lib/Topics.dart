import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';
import 'package:flutter/services.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new Topics());
}

//void main() => runApp(Topics());

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  Container Cards(String imageVal, String heading, String subHeading) {
    return Container(
      width: 120,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          child: Container(
            child: Wrap(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image(
                      image: AssetImage(imageVal),
                      height: 100,
                      width: 80,
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      heading,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      subHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                  child: LinearProgressIndicator(
                    value: 10 / 20,
                    backgroundColor: Colors.grey[100],
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 3,
              title: Text(
                "Talk Sindhi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.share),
                  color: Color.fromRGBO(156, 9, 9, 10),
                  onPressed: () {},
                ),
                // action button
                IconButton(
                  icon: Icon(Icons.search),
                  color: Color.fromRGBO(156, 9, 9, 10),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.language),
                  color: Color.fromRGBO(156, 9, 9, 10),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                labelPadding:
                    EdgeInsetsDirectional.only(start: 40, end: 40, bottom: 0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(156, 9, 9, 10),
                ),
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Vocabulary")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Conversation")),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              Container(
                color: Color.fromRGBO(255, 227, 215, 10),
                child: ListView(
                  padding: EdgeInsets.only(bottom: 5),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Cards('assets/tiger.png', 'Animals', '10/20'),
                        ),
                        Container(
                          child: Cards('assets/birds.png', 'Birds', '10/20'),
                        ),
                        Container(
                          child: Cards('assets/colors.png', 'Color', '10/20'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child:
                              Cards('assets/creature.png', 'Creature', '10/20'),
                        ),
                        Container(
                          child: Cards('assets/dress.png', 'Dress', '10/20'),
                        ),
                        Container(
                          child: Cards(
                              'assets/education.png', 'Education', '10/20'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Cards('assets/fruits.png', 'Fruits', '10/20'),
                        ),
                        Container(
                          child: Cards('assets/health.png', 'Health', '10/20'),
                        ),
                        Container(
                          child: Cards('assets/nature.png', 'Nature', '10/20'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(),
            ]),
            bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.home),
                  color: Color.fromRGBO(156, 9, 9, 10),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                title: Text('Topics',
                    style: TextStyle(color: Color.fromRGBO(156, 9, 9, 10))),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.chrome_reader_mode),
                  color: Color.fromRGBO(156, 9, 9, 10),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Topics()),
                    );
                  },
                ),
                title: Text('Topics',
                    style: TextStyle(color: Color.fromRGBO(156, 9, 9, 10))),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.person_outline),
                  color: Color.fromRGBO(156, 9, 9, 10),
                ),
                title: Text('Account',
                    style: TextStyle(color: Color.fromRGBO(156, 9, 9, 10))),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.settings),
                  color: Color.fromRGBO(156, 9, 9, 10),
                ),
                title: Text('Settings',
                    style: TextStyle(color: Color.fromRGBO(156, 9, 9, 10))),
              ),
            ]),
          )),
    );
  }
}
