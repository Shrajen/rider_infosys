import 'package:flutter/material.dart';
import 'package:riderdbms/home.dart';
import 'home.dart';
import 'package:riderdbms/search.dart';

void main() {
  runApp(new MaterialApp(
      title: "Start",
      home: new Start(),
      routes: <String, WidgetBuilder>{
        "/Second": (BuildContext context) => new Second(),
        "/Start": (BuildContext context) => new Start(),
        "/Wrapper": (BuildContext context) => new MyApp(),
        "/Search": (BuildContext context) => new Search(),
//        "/Login": (BuildContext context) => new Login()
      }));
}

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StartState();
  }
}

class StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Rider Information System",
          style: new TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.red,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("Images/44.jpg"),
//                          image: NetworkImage('https://scontent.fktm1-1.fna.fbcdn.net/v/t1.0-9/87024585_2755568624550658_961766730898604032_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=7L4hFKvnhWUAX99FVfx&_nc_ht=scontent.fktm1-1.fna&oh=76da636a43ef8e99a1f8ec5d70f7aeef&oe=5E9FBEF1'),
                            fit: BoxFit.fill)),
                  ),
                  Text('RiderInfo_System',
                      style: TextStyle(fontSize: 22, color: Colors.black54)),
                  Text('riderinfo@gmail.com',
                      style: TextStyle(color: Colors.black54))
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.of(context).pushNamed("/Start");
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: null,
          )
        ],
      ))),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                color: const Color(0xff000000),
                image: DecorationImage(
                  image: AssetImage("Images/4.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(1), BlendMode.dstATop),
                )),
          ),
          new Padding(padding: new EdgeInsets.all(20.0)),
          new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(20.0)),
                new Container(
                    margin: const EdgeInsets.only(top: 425.5),
                    color: Colors.red,
                    child: new TextButton.icon(
                      label: Text(
                        'Rider Registration',
                        style: new TextStyle(fontSize: 28),
                      ),
                      icon: new Icon(Icons.input),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/Wrapper");
                      },
                    )),
                new Padding(padding: new EdgeInsets.all(15.0)),
                new Container(
                    color: Colors.red,
                    child: new TextButton.icon(
                      label: Text(
                        'Search Information',
                        style: new TextStyle(fontSize: 28),
                      ),
                      icon: new Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/Search");
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


//class Login extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return new LoginState();
//  }
//
//}
//class LoginState extends State<Login>{
//  final TextEditingController _userController = new TextEditingController();
//  final TextEditingController _passwordController = new TextEditingController();
//  String _welcomeString = "";
//  void _erase(){
//    setState(() {
//      _userController.clear();
//      _passwordController.clear();
//
//    });
//  }
//
//  void _showWelcome(){
//    setState(() {
//      if(_userController.text.isNotEmpty
//          && _passwordController.text.isNotEmpty){
//        _welcomeString = _userController.text;
//      }else
//        _welcomeString = "Nothing";
//
//    });
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Login"),
//          backgroundColor: Colors.red,
//          //centerTitle: true,
//        ),
//        backgroundColor: Colors.blueGrey,
//
//        body: new Container(
//          alignment: Alignment.topCenter,
//          //listview for scrolling
//          child: new ListView(
//            children: <Widget>[
//              //image/profile
//              new Image.asset(
//                'images/face.png',
//                width: 90.0,
//                height: 90.0,
////            color: Colors.grey,
//              ),
//              new Padding(padding: const EdgeInsets.all(14.0)),
//              new Container(
//                padding: new EdgeInsets.all(18.0),
//                height: 200,
//                width: 380,
//                color: Colors.black12,
//                child: new Column(
//                  children: <Widget>[
//                    new TextField(
//                      controller: _userController,
//                      decoration: new InputDecoration(
//                          hintText: 'UserName',
//                          icon: new Icon(Icons.person)
//                      ),
//                    ),
//                    new TextField(
//                      controller: _passwordController,
//                      decoration: new InputDecoration(
//                          hintText: 'Password',
//                          icon: new Icon(Icons.lock)
//                      ),
//                      //obsure for hiding password
//                      obscureText: true,
//                    ),
//
//                    new Padding(padding: new EdgeInsets.all(10.5),),
//                    new Center(
//                      child: new Row(
//                        children: <Widget>[
//                          //login
//                          new Container(
//                            margin: const EdgeInsets.only(left: 38.8),
//                            child: new RaisedButton(
//                              onPressed: _showWelcome,
//                              color: Colors.redAccent,
//                              child: new Text("Login",
//                                  style: new TextStyle(
//                                    fontSize: 17,
//                                  )
//                              ),
//                            ),
//                          ),
//                          new Container(
//                            margin: const EdgeInsets.only(left: 110.8),
//                            child: new RaisedButton(
//                              onPressed: _erase,
//                              color: Colors.redAccent,
//                              child: new Text("Clear",
//                                  style: new TextStyle(
//                                    fontSize: 17,
//                                  )
//                              ),
//                            ),
//
//                          )
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//
//              ),
//
//              new Padding(padding: const EdgeInsets.all(14.0)),
//              new Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//
//                children: <Widget>[
//                  new Text('Welcome, $_welcomeString',
//                    style: new TextStyle(
//                        color: Colors.redAccent,
//                        fontSize: 20,
//                        fontWeight: FontWeight.w900
//
//                    ),
//                  )
//                ],
//              )
//            ],
//          ),
//        )
//    );
//  }
//
//}