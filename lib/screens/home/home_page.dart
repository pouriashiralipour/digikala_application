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
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              StoryCircle(),
              CustomSlider(),
              CustomDigiApp(),
            ],
          ),
        ),
      ),
    );
  }
}
