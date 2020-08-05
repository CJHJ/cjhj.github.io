import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'dart:math';

enum MainLogoState { straight, wink, laugh }

class TitleBar extends StatefulWidget {
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  static const String straightLogoImagePath = 'assets/cjhj.jpg';
  static const String winkLogoImagePath = 'assets/cjhj_wink.png';
  static const String laughLogoImagePath = 'assets/cjhj_laugh.png';
  static const Duration winkDuration = Duration(milliseconds: 100);

  MainLogoState logoState = MainLogoState.straight;
  CountdownTimer countdownLogoTimer;

  void startLogoTimer(Duration duration) {
    this.countdownLogoTimer = new CountdownTimer(
      duration,
      Duration(seconds: 1),
    );

    var countdown = this.countdownLogoTimer.listen(null);
    countdown.onDone(() {
      this.countdownLogoTimer.cancel();

      Duration nextTimerDuration;
      if (logoState == MainLogoState.straight) {
        setState(() {
          this.logoState = MainLogoState.wink;
        });
        nextTimerDuration = winkDuration;
      } else {
        setState(() {
          this.logoState = MainLogoState.straight;
        });
        nextTimerDuration = generateDuration();
      }

      startLogoTimer(nextTimerDuration);
      countdown.cancel();
    });
  }

  void onLogoPress() {
    this.countdownLogoTimer.cancel();
    setState(() {
      this.logoState = MainLogoState.laugh;
    });
  }

  Duration generateDuration() {
    var rng = new Random();
    int generatedDurationNumber = rng.nextInt(5001) + 500;

    return Duration(milliseconds: generatedDurationNumber);
  }

  String getLogoPath() {
    if (this.logoState == MainLogoState.straight) {
      return straightLogoImagePath;
    } else if (this.logoState == MainLogoState.wink) {
      return winkLogoImagePath;
    }
    return laughLogoImagePath;
  }

  @override
  void initState() {
    super.initState();
    startLogoTimer(generateDuration());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () => onLogoPress(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        padding: EdgeInsets.all(0),
        child: Image(
          image: AssetImage(getLogoPath()),
        ),
      ),
    );
  }
}
