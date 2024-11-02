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
              (index) {
                final app = DigiAppModel.items[index];
                return DigiAppTile(app: app);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: Color(0xFF62666d),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'بیشتر',
                  style: TextStyle(color: Color(0xFF424750)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DigiAppTile extends StatelessWidget {
  const DigiAppTile({super.key, required this.app});

  final DigiAppModel app;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Column(
        children: [
          Image.asset(
            app.img,
            width: 60,
            height: 60,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            app.title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF424750)),
          )
        ],
      ),
    );
  }
}
