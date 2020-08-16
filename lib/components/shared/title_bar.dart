import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'dart:math';

enum MainLogoState { straight, wink, laugh }

class TitleBar extends StatefulWidget {
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  Image straightLogoImage = Image.asset('assets/cjhj.jpg');
  Image winkLogoImage = Image.asset('assets/cjhj_wink.png');
  Image laughLogoImage = Image.asset('assets/cjhj_laugh.png');
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

  Image getLogo() {
    if (this.logoState == MainLogoState.straight) {
      return straightLogoImage;
    } else if (this.logoState == MainLogoState.wink) {
      return winkLogoImage;
    }
    return laughLogoImage;
  }

  @override
  void initState() {
    super.initState();
    startLogoTimer(generateDuration());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(straightLogoImage.image, context);
    precacheImage(winkLogoImage.image, context);
    precacheImage(laughLogoImage.image, context);
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
        child: getLogo(),
      ),
    );
  }
}
