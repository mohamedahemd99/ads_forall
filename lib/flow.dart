import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation;
  Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2,end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4,end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75,end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(CurvedAnimation(parent: animationController
        , curve: Curves.easeOut));
    super.initState();
    animationController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  right: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.transparent,
                          height: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),degOneTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            label:"العاب",
                            onClick: (){
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(252),degOneTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            label:"سوبر ماركت",
                            onClick: (){
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(234),degTwoTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            label:"محلات",
                            onClick: (){
                              print('Second button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(216),degThreeTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            label:"معلومات",
                            onClick: (){
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(198),degThreeTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            label:"مواقف",
                            onClick: (){
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),degThreeTranslationAnimation.value * 250),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(

                            label:"super market",
                            onClick: (){
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(

                          menu: true,
                          onClick: (){
                            if (animationController.isCompleted) {
                              animationController.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )

                    ],
                  ))
            ],
          ),
        )
    );
  }
}


class CircularButton extends StatelessWidget {

  final String label;
  final Function onClick;
  final bool menu;

  CircularButton({this.label, this.onClick,this.menu=false});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF46c0be),shape: BoxShape.circle),
      width: 70,
      height: 70,
      child: IconButton(icon:menu?Icon(Icons.menu):Text(label,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)) ,onPressed: onClick),
    );
  }
}

