import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:kcal_gomez/main.dart';

Color buttonClr = Color(0xffFF9386);

class LandingPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return landingPageGen(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    ));
  }
}

bodyGenFunc(String assetLoc, String header, String smallText) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(assetLoc),
      Text(header, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
      Text("",
          style: TextStyle(
            fontSize: 20,
          )),
      Text(smallText,
          style: TextStyle(
              fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w400))
    ],
  );
}

createKey() {
  return Column(
    children: [
      Row(
        children: [
          Text("", style: TextStyle(fontSize: 230)),
          Text("            Already have an account?  ",
              style: TextStyle(fontSize: 20)),
          Linkify(
              text: "Log In",
              style: TextStyle(color: Colors.green, fontSize: 19),
              linkStyle: TextStyle(
                color: Colors.green,
              ))
        ],
      )
    ],
  );
}

callTitle(String title) {
  return Column(
    children: [
      Text("",
          style: TextStyle(
            fontSize: 20,
          )),
      Text(title,
          style: TextStyle(
              color: Colors.green,
              fontSize: 50,
              fontFamily: "ModernSansSerif",
              fontWeight: FontWeight.w500))
    ],
  );
}

class landingPageGen extends StatelessWidget {
  final Widget child;

  const landingPageGen({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size sz = MediaQuery.of(context).size; //h and w of device
    return Container(
      color: Colors.blue[900],
      height: sz.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          IntroductionScreen(
            pages: [
              PageViewModel(
                titleWidget: callTitle("kcal"),
                bodyWidget: bodyGenFunc("assets/intro1.png", "Eat Healthy!",
                    "Maintaining good health should be the primary focus of everyone"),
                footer: createKey(),
              ),
              //decoration: PageDecoration(bodyAlignment: )),

              PageViewModel(
                titleWidget: callTitle("kcal"),
                bodyWidget: bodyGenFunc("assets/intro2.png", "Healthy Recipes!",
                    "Browse thousands of healthy recipes from all over the world."),
                footer: createKey(),
              ),

              PageViewModel(
                  titleWidget: callTitle("kcal"),
                  bodyWidget: bodyGenFunc(
                      "assets/intro3.png",
                      "Track Your Health",
                      "With amazing inbuilt tools you can track your progress."),
                  footer: createKey()),
            ],
            done: const Text("Ok"),
            onDone: () {},
            showNextButton: false,
          ),
          Positioned(
            bottom: 150,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Text("Get Started",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(250, 65)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(buttonClr),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: buttonClr))))),
          )
        ],
      ),
    );
  }
}
