import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_sccreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1), vsync: this, upperBound: 100.0);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    // padding: EdgeInsets.only(left: 60.0),
                    child: Image.network(
                        "https://i.pinimg.com/originals/be/ac/96/beac96b8e13d2198fd4bb1d5ef56cdcf.jpg"),
                    height: controller.value,
                  ),
                ),
                Text(
                  ' ${controller.value.toInt()}',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "login",
              colors: Colors.blue,
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: "register",
              colors: Colors.red,
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colors, this.onpress, this.title});

  final Color colors;
  final String title;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
