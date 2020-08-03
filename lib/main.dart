import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cjhj_portfolio_site/colors.dart';
import 'package:cjhj_portfolio_site/components/shared/nav_bar.dart';
import 'package:cjhj_portfolio_site/components/shared/title_bar.dart';
import 'package:cjhj_portfolio_site/screens/home.dart';
import 'package:cjhj_portfolio_site/utils/animations.dart';

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
        primaryColor: generateMaterialColor(mainColor),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
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
  bool _isScreenVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          _isScreenVisible = true;
        });
      },
    );
  }

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
              flex: 6,
              child: AnimatedFadeMoveIn(
                isWidgetVisible: _isScreenVisible,
                child: TitleBar(),
              ),
            ),
            Expanded(
              flex: 1,
              child: AnimatedFadeMoveIn(
                isWidgetVisible: _isScreenVisible,
                child: HomeScreen(),
              ),
            ),
            Expanded(
              flex: 1,
              child: AnimatedFadeMoveIn(
                isWidgetVisible: _isScreenVisible,
                moveInDirection: MoveInDirection.fromBelow,
                child: NavBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
