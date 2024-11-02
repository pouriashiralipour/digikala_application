import 'package:digikala/models/digi_app_model.dart';
import 'package:flutter/material.dart';

class CustomDigiApp extends StatelessWidget {
  const CustomDigiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: List.generate(
              DigiAppModel.items.length - 1,
              (index) => Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 73,
                        height: 73,
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(DigiAppModel.items[index].img),
                        radius: 30,
                      ),
                    ],
                  ),
                  Text(
                    DigiAppModel.items[index].title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 73,
                    height: 73,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFF0F0F1),
                      child: Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
              const Text(
                'بیشتر',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
