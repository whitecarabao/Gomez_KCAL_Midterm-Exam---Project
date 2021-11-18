import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:kcal_gomez/main.dart';

Color buttonClr = Color(0xffFEFAEF);
Color txtClr = Color(0xff5C513B);
Color foodBgClr = Color(0xff91C789);
Color foodTxClr = Color(0xffFFFFFFF);

Color faveBgClr = Color(0xffF4F9F3);
Color faveTxClr = Color(0xff9ACB92);
int screenVal = 1;

chgScrVal(int val) {
  screenVal = val;
}

clrResolver() {
  if (screenVal == 1) {
    print("val 1");
    foodBgClr = Color(0xff91C789);
    foodTxClr = Color(0xffFFFFFF);
    faveBgClr = Color(0xffF4F9F3);
    faveTxClr = Color(0xff9ACB92);
  } else if (screenVal == 2) {
    print("val 2");
    foodBgClr = Color(0xffF4F9F3);
    foodTxClr = Color(0xff9ACB92);
    faveBgClr = Color(0xff91C789);
    faveTxClr = Color(0xffFFFFFF);
  }
}

class HomeBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageBody(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    ));
  }
}

class HomePageBody extends StatelessWidget {
  final Widget child;

  const HomePageBody({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomePageGen(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    ));
  }
}

class HomePageGen extends StatelessWidget {
  final Widget child;

  const HomePageGen({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size sz = MediaQuery.of(context).size; //h and w of device
    return Container(
      color: Colors.white,
      height: sz.height,
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Column(
              // mainAxisAlignment:
              //      MainAxisAlignment.center, //Center Row contents horizontally,
              // crossAxisAlignment:
              //  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Text("", style: TextStyle(fontSize: 10)),
                Text("",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),

                // Text("Hello!",
                //    textAlign: TextAlign.center, style: TextStyle(fontSize: 120)),
                Text("", style: TextStyle(fontSize: 30)),
                Row(
                  children: [
                    Text("                          "),
                    TextButton(
                        onPressed: () {
                          chgScrVal(1);
                          //(context as Element).reassemble();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          clrResolver();
                        },
                        child: Text("Foods",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(115, 55)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(foodTxClr),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(foodBgClr),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0)),
                                    side: BorderSide(color: foodBgClr))))),
                    TextButton(
                        onPressed: () {
                          chgScrVal(2);
                          clrResolver();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: Text("Recipes",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(115, 55)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(faveTxClr),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(faveBgClr),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0)),
                                    side: BorderSide(color: faveBgClr))))),
                    Text(" ", style: TextStyle(fontSize: 100)),
                  ],
                ),

                contentsMaker(context),
              ])
        ],
      ),
    );
  }
}

contentsMaker(BuildContext context) {
  if (screenVal == 1) {
    return Column(children: [
      Row(
        children: [
          Text("        "),
          TextButton.icon(
              icon: Image.asset("assets/cookie.png", width: 100, height: 80),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodDisp()));

                // Navigator.push(
                //    context,
                //MaterialPageRoute(
                //builder: (context) => const HomePage()));
              },
              label: Text("Cookie",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(125, 85)),
                  foregroundColor: MaterialStateProperty.all<Color>(txtClr),
                  backgroundColor: MaterialStateProperty.all<Color>(buttonClr),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          side: BorderSide(color: buttonClr))))),
          Text("            "),
          TextButton.icon(
              icon: Image.asset("assets/cake.png", width: 70, height: 80),
              onPressed: () {
                // Navigator.push(
                //    context,
                //MaterialPageRoute(
                //builder: (context) => const HomePage()));
              },
              label: Text("Cakes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(125, 85)),
                  foregroundColor: MaterialStateProperty.all<Color>(txtClr),
                  backgroundColor: MaterialStateProperty.all<Color>(buttonClr),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          side: BorderSide(color: buttonClr))))),
        ],
      ),
    ]);
  } else if (screenVal == 2) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Text("", style: TextStyle(fontSize: 100)),
          Image.asset("assets/salad.png", scale: 0.4),
          Text(" ", style: TextStyle(fontSize: 40)),
          Text("👉🥲👈🏼", style: TextStyle(fontSize: 30)),
          Text("No Recipes Found",
              style: TextStyle(fontFamily: "ModernSanSerif7", fontSize: 30)),
          Text("", style: TextStyle(fontSize: 30)),
          Align(
              alignment: Alignment.center,
              child: Text(
                  "You did not save any recipes. Please don't look for any, the developer ran out of time and energy to implement the necessary screen                    ",
                  style: TextStyle(fontSize: 17, height: 1.3)))
        ]));
  }
}
