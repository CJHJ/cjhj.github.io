import 'package:flutter/material.dart';
import 'package:cjhj_portfolio_site/utils/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth * 0.032;
    double maxTextSize = 20.0;

    return Expanded(
      child: FlatButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize < maxTextSize ? textSize : maxTextSize,
            color: Theme.of(context).primaryColor,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
