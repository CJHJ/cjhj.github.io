import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavBarButton(
            text: 'Home',
          ),
          NavBarButton(
            text: 'Works',
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
  String mainColor = '252626';

  int parseHexColorFromString(String color, String opacity) {
    return int.parse(opacity + color, radix: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(parseHexColorFromString(mainColor, 'FF')),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Color(parseHexColorFromString(mainColor, '55')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
