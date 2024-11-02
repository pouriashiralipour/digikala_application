import 'package:digikala/models/amazing_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AmazingProduct extends StatelessWidget {
  const AmazingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.5,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffef4056), Color(0xffef394e)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              List.generate(AmazingProductModel.items.length + 2, (index) {
            final amazing =
                AmazingProductModel.items[index < 3 ? index : index - 3];
            return index == 0
                ? FirstOfferTile(size: size)
                : index == AmazingProductModel.items.length + 1
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
                                color: Color(0xffef4056),
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
            SvgPicture.asset('assets/svg/Amazings.svg'),
            const SizedBox(
              height: 20,
            ),
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
  final AmazingProductModel amazing;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(right: 8.0),
      width: size.width / 2.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(amazing.image, fit: BoxFit.cover),
          const Spacer(),
          Text(
            amazing.title,
            style: const TextStyle(fontSize: 13),
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
              const Text('تومان'),
            ],
          )
        ],
      ),
    );
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
}
