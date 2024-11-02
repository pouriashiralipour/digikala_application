import 'package:digikala/screens/home/widgets/amazing_product.dart';
import 'package:digikala/screens/home/widgets/custom_app_bar.dart';
import 'package:digikala/screens/home/widgets/digi_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:digikala/screens/home/widgets/custom_slider.dart';
import 'package:digikala/screens/home/widgets/story_circle.dart'
    show StoryCircle;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const StoryCircle(),
                const CustomSlider(),
                const CustomDigiApp(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: 410,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                          image: AssetImage('assets/sliders/supermarket.png'))),
                ),
                const AmazingProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
