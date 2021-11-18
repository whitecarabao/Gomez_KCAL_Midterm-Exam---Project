import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:kcal_gomez/main.dart';

Color txtClr = Color(0xff5C513B);

Color buttonClr = Color(0xffFEFAEF);

class FoodDispPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FoodPageGen(
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

class FoodPageGen extends StatelessWidget {
  final Widget child;

  const FoodPageGen({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size sz = MediaQuery.of(context).size; //h and w of device
    return Container(
        color: Colors.white,
        height: sz.height,
        width: sz.width,
        padding: EdgeInsets.all(20),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          ListView(
            children: [
              Text("                            "),

              Positioned(
                  top: 100,
                  child: TextButton.icon(
                      icon: Image.asset("assets/cookie.png",
                          width: 80, height: 80),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDisp()));
                        // Navigator.push(
                        //    context,
                        //MaterialPageRoute(
                        //builder: (context) => const HomePage()));
                      },
                      label: Text("Cookie",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(350, 95)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(txtClr),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(buttonClr),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      side: BorderSide(color: buttonClr)))))),
              Text("", style: TextStyle(fontSize: 15)), //filler
              Text(
                  "A cookie is a baked or cooked food that is typically small, flat and sweet. It usually contains flour, sugar, egg and some type of oil, fat, or butter. it may include other ingredients such as raisins, oats, chocolate chip, nuts, etc. \n\nIn most English-speaking counties, except for the United States, crunchy cookies are called biscuits. Many Canadians also use this term. Chewier biscuits are sometimes called cookies even in the United Kingdom. [3] Some cookies may also be named by their shape, such as date squares or bars.",
                  style: TextStyle(fontSize: 20, height: 1.7)),
              Text("", style: TextStyle(fontSize: 20)),
              Text("Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Row(
                children: [
                  Image.asset("assets/cookiegal1.jpg", width: 150),
                  Text("            ", style: TextStyle(fontSize: 10)),
                  Image.asset("assets/cookiegal2.jpg", width: 150)
                ],
              ),
              Row(
                children: [Image.asset("assets/cookiegal3.jpg", width: 175)],
              )
            ],
          ),
          Positioned(
            bottom: 70,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Text("Add to Favorites",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(250, 65)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffFF9386)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xffFF9386)))))),
          ),
        ]));
  }
}
