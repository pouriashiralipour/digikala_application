import 'dart:async';

import 'package:digikala/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AmazingProduct extends StatelessWidget {
  final Color color1, color2;
  final List model;
  const AmazingProduct(
      {super.key,
      required this.color1,
      required this.color2,
      required this.model});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.5,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(model.length + 2, (index) {
            final amazing = model[index < 3 ? index : index - 3];
            return index == 0
                ? FirstOfferTile(size: size)
                : index == model.length + 1
                    ? GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          margin: const EdgeInsets.only(right: 8.0, left: 8.0),
                          width: size.width / 2.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_circle_left_outlined,
                                color: Color(0xffDF324E),
                                size: 50,
                              ),
                              Text(
                                'مشاهده همه',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      )
                    : AmazingProductTile(amazing: amazing);
          }),
        ),
      ),
    );
  }
}

class FirstOfferTile extends StatelessWidget {
  const FirstOfferTile({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(right: 8.0),
        width: size.width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CountdownTimer(),
            const Spacer(),
            SvgPicture.asset('assets/svg/Amazings.svg'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 27),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'مشاهده همه',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class AmazingProductTile extends StatelessWidget {
  const AmazingProductTile({super.key, required this.amazing});
  final ProductModel amazing;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(right: 8.0),
      width: size.width / 2.7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(amazing.image, fit: BoxFit.cover),
          const Spacer(),
          Text(
            amazing.title,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.justify,
          ),
          const Spacer(),
          if (amazing.isAvalaible)
            const Row(
              children: [
                Icon(
                  Icons.check,
                  size: 16,
                  color: Color(0xff87d3e1),
                ),
                Text(
                  'موجود در انبار دیجی کالا',
                  style: TextStyle(color: Color(0xff62666d), fontSize: 11),
                )
              ],
            )
          else
            const Text(
              'تنها 2 عدد در انبار باقیست',
              style: TextStyle(color: Color(0xffef394e), fontSize: 11),
            ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffef394e),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Text(
                    convertEnglishNumbersToPersian(amazing.discount.toString()),
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    convertEnglishNumbersToPersian(amazing.price.toString()),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    convertEnglishNumbersToPersian(amazing.oldPrice.toString()),
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        color: Color(0xffa1a3a8)),
                  ),
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              SvgPicture.asset(
                'assets/svg/toman.svg',
                width: 21,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;
  DateTime? endTime;

  @override
  void initState() {
    super.initState();
    loadEndTime();
    // startTimer();
  }

  void startTimer() {
    if (endTime == null) {
      endTime = DateTime.now()
          .add(const Duration(hours: 23, minutes: 59, seconds: 59));
      saveEndTime();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final remaining = endTime!.difference(DateTime.now());
        if (remaining.isNegative) {
          timer.cancel();
        } else {
          hours = remaining.inHours;
          minutes = remaining.inMinutes % 60;
          seconds = remaining.inSeconds % 60;
        }
      });
    });
  }

  Future<void> resetTimer() async {
    final prefs = await SharedPreferences.getInstance();
    endTime =
        DateTime.now().add(const Duration(hours: 15, minutes: 5, seconds: 16));
    await prefs.setString('endTime', endTime!.toIso8601String());
    startTimer();
  }

  Future<void> saveEndTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('endTime', endTime!.toIso8601String());
  }

  Future<void> loadEndTime() async {
    final prefs = await SharedPreferences.getInstance();
    final endTimeString = prefs.getString('endTime');

    if (endTimeString != null) {
      endTime = DateTime.parse(endTimeString);
      if (endTime!.isAfter(DateTime.now())) {
        startTimer();
      } else {
        endTime = null;
        startTimer();
      }
    } else {
      startTimer();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimeBox(convertEnglishNumbersToPersian(
                seconds.toString().padLeft(2, '0'))),
            const SizedBox(
              width: 5,
            ),
            const Text(":",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(
              width: 5,
            ),
            buildTimeBox(convertEnglishNumbersToPersian(
                minutes.toString().padLeft(2, '0'))),
            const SizedBox(
              width: 5,
            ),
            const Text(":",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(
              width: 5,
            ),
            buildTimeBox(convertEnglishNumbersToPersian(
                hours.toString().padLeft(2, '0'))),
          ],
        ),
      ],
    );
  }

  Widget buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

String convertEnglishNumbersToPersian(String input) {
  const englishToPersian = {
    '0': '۰',
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '۴',
    '5': '۵',
    '6': '۶',
    '7': '۷',
    '8': '۸',
    '9': '۹',
  };

  return input.split('').map((char) {
    return englishToPersian[char] ?? char;
  }).join('');
}
