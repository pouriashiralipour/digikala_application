import 'package:digikala/models/amazing_product_model.dart';
import 'package:digikala/models/food_amazing.dart';
import 'package:digikala/models/grid_slide_model.dart';
import 'package:digikala/screens/home/widgets/amazing_product.dart';
import 'package:digikala/screens/home/widgets/category_section.dart';
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
                    image: AssetImage('assets/sliders/supermarket.png'),
                  ),
                ),
              ),
              AmazingProduct(
                color1: const Color(0xffDF324E),
                color2: const Color(0xffEF5561),
                model: AmazingProductModel.items,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: GridSlideModel.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          GridSlideModel.items[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              AmazingProduct(
                color1: const Color(0xff04B254),
                color2: const Color(0xff03A24D),
                model: FoodAmazing.items,
              ),
              const SizedBox(height: 20),
              const CategorySection(),
            ],
          ),
        ),
      ),
    );
  }
}
