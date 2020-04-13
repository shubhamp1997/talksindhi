import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'Topics.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 227, 215, 10)),
          ),
          Center(
            child: Image(
              image: AssetImage('assets/splashmain.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 45, top: 350),
            child: Text(
              'Speak \nSindhi',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 705, 60, 20),
            child: Text(
              "Presented by,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(240, 690, 50, 10),
            child: Image.asset(
              'assets/powerd_by_logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );
    List data= json.decode(response.body);
    print(data[1]["title"]);
  }

  Container MyArticles(String imageVal, String heading, String subHeading) {
    return Container(
      width: 150,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          child: Container(
            child: Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Image(
                      image: AssetImage(imageVal),
                      height: 100,
                      width: 80,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(
                      heading,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(subHeading),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/language.png'),
                            height: 100,
                            width: 100,
                          ),
                          Text('Choose Language')
                        ],
                      ),
                      content: Container(
                        height: 150,
                        child: Column(
                          children: <Widget>[
                            Text("Select your prefered Language"),
                            Container(
                              width: 100,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 5),
                                child: FlatButton(
                                  color: Color.fromRGBO(156, 9, 9, 10),
                                  child: Text(
                                    'English',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: FlatButton(
                                  color: Color.fromRGBO(156, 9, 9, 10),
                                  child: Text(
                                    'हिन्दी',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 150, top: 10),
            child: Image(
              image: AssetImage('assets/ic_landing_image.png'),
              width: 200,
              height: 200,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "Welcome to Sindhi Sangat",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Made Easy",
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(156, 9, 9, 10)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Dedicated to the promotion of Sindhi Language Culture & Heritage",
              style:
                  TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 252,
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 227, 215, 10),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 12),
                      height: 20,
                      width: 6,
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(156, 9, 9, 10),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 10),
                      child: Text("Sindhi Sangat Apps",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 70),
                height: 265,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 5),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MyArticles('assets/example.png', 'Learn Sindhi',
                        'Available on'), //First Card
                    MyArticles('assets/example.png', 'Speak Sindhi',
                        'Coming soon'), //Second Card
                    MyArticles('assets/example.png', 'Learn Sindhi',
                        'Coming soon'), //ThirdCard
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
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
          onPressed: getData,
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
    );
  }
}

