import 'package:flutter/material.dart';
import 'package:cjhj_portfolio_site/components/shared/nav_bar.dart';
import 'package:cjhj_portfolio_site/components/shared/title_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String appTitle = 'CJHJ Portfolio Site';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: appTitle),
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
