import 'package:flutter/material.dart';

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
