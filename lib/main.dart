import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/pages.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';
import 'package:introduction_slider/source/presentation/widgets/widgets.dart';
import 'package:sigproyect/pages/homepage.dart';

void main() => runApp(MaterialApp(



    debugShowCheckedModeBanner: false,
    home: MyApp()

));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: Image.asset('assets/1.png'),
          title: Text("Encuentra lo que buscas"),
          backgroundColor: Colors.white,

        ),
        IntroductionSliderItem(
          logo: Image.asset('assets/2.png'),
          title: Text("Sin perderte en el camino"),
          backgroundColor: Colors.white,
        ),
        IntroductionSliderItem(
          logo: Image.asset('assets/3.png'),
          title: Text("Conoce tus tiendas favoritas"),
          backgroundColor: Colors.white,
        ),
      ],
      done: Done(
        child: Icon(Icons.done),
        home: HomePage(),
      ),
      next: Next(child: Icon(Icons.arrow_forward,color: Colors.red,)),
      back: Back(child: Icon(Icons.arrow_back,color: Colors.red,)),
      dotIndicator: DotIndicator(
        selectedColor: Colors.red,
      ),
    );
  }
}