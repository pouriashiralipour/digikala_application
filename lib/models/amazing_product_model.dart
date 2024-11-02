class AmazingProductModel {
  final String title, image, price, oldPrice, discount;
  final bool isAvalaible;

  AmazingProductModel(
      {required this.title,
      required this.image,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.isAvalaible});

  static final List<AmazingProductModel> items = [
    AmazingProductModel(
        title: 'هدفون بلوتوثی کلومن مدل K-TW21',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/f634bfc57e3015608b62f96580ede98e31f21254_1704626412.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '749,000',
        oldPrice: '1,647,000',
        discount: '55%',
        isAvalaible: false),
    AmazingProductModel(
        title: 'ساعت هوشمند ورنا مدل W49 Ultra',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/c0842c295c19f3b88e8491777eb5314379641645_1718703653.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '515,000',
        oldPrice: '690,000',
        discount: '25%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'قرص جوشان مولتی ویتامین بسته 20 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/67637aa1fe0b3f0c053367801d61da1f2e368621_1641210331.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '31,000',
        oldPrice: '91,600',
        discount: '66%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'لامپ ال ای دی 15 وات سایروکس مدل A70 پایه E27 بسته دو عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/c2e2c5627af1778c9f127997d13fe70b2e6099e3_1693394926.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '89,000',
        oldPrice: '119,000',
        discount: '25%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'ماشین اصلاح موی سر و صورت کیمی مدل KM-1893',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/3f64c8dc55c84891c9fae2c11a0304e87eb3fb3d_1662229021.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '2,222,000',
        oldPrice: '5,200,000',
        discount: '57%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'ماشین اصلاح موی صورت شارژی لایچی مدل L-9892',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/07141418014df9355ad1b8437247cf43f0591ce7_1729083429.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '999,000',
        oldPrice: '2,100,000',
        discount: '57%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'شطرنج چیندر تویز مدل مگنتی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/66fbc1341352cca2bc8fa0b61df4e1b61acc9ad0_1722836163.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '130,000',
        oldPrice: '200,000',
        discount: '35%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'شورت مردانه پوشاک ناطقیان مدل پادار سوپر نخ پنبه کد 3',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/115c5e2c9fd704a2d851ad764129d76e5d001bad_1725830254.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '114,000',
        oldPrice: '149,000',
        discount: '23%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'دفتر مشق 50 برگ تیما مدل Ford-x بسته 12 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/fb0ea59903b3c7e47804be1bee841f5b12f6fb9a_1656784537.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '326,000',
        oldPrice: '407,000',
        discount: '20%',
        isAvalaible: true),
    AmazingProductModel(
        title: 'شارژر فندکی 18 وات تسکو مدل BFM 2220',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/6dfe3d7035abdfdf80b521298051207ee0f8d643_1697461776.jpg?x-oss-process=image/resize,m_lfit,h_300,w_300/format,webp/quality,q_80',
        price: '904,900',
        oldPrice: '1,116,500',
        discount: '19%',
        isAvalaible: true),
  ];
}
