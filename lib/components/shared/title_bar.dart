import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar>
    with SingleTickerProviderStateMixin {
  bool _isScreenVisible = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setVisible(context));
  }

  void setVisible(context) {
    setState(() {
      _isScreenVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        transform: Matrix4.translationValues(
            _isScreenVisible ? 0.0 : -100.0, 0.0, 0.0),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
          opacity: _isScreenVisible ? 1.0 : 0.0,
          child: Image(
            image: AssetImage('assets/cjhj.jpg'),
          ),
        ),
      ),
    );
  }
}
