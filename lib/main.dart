import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CJHJ Portfolio Site',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CJHJ Portfolio Site'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: TitleBar(),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Under Construction',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: NavBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleBar extends StatefulWidget {
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setVisible(context));
  }

  void setVisible(context) {
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: _visible ? 1.0 : 0.0,
        child: Image(
          image: AssetImage('assets/cjhj.jpg'),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFBFB2A3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavBarButton(
            text: 'Home',
          ),
          NavBarButton(
            text: 'Work',
          ),
          NavBarButton(
            text: 'Experience',
          ),
          NavBarButton(
            text: 'Music',
          ),
          NavBarButton(
            text: 'About',
          ),
        ],
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  NavBarButton({this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
