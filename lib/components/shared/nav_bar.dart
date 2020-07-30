import 'package:flutter/material.dart';

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
