import 'package:digikala/models/category_model.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'خرید بر اساس دسته بندی',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 15),
            child: SizedBox(
              height: size.height / 2.1,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: CategoryModel.items.length,
                itemBuilder: (context, index) {
                  final item = CategoryModel.items[index];
                  return Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(
                                10.0), // حاشیه را کمی کمتر کردیم
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                item.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
