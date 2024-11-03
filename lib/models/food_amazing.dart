import 'package:digikala/models/product_model.dart';

class FoodAmazing implements ProductModel {
  @override
  final String title;
  @override
  final String image;
  @override
  final String discount;
  @override
  final String price;
  @override
  final String oldPrice;
  @override
  final bool isAvalaible;

  FoodAmazing(
      {required this.title,
      required this.image,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.isAvalaible});

  static final List<FoodAmazing> items = [
    FoodAmazing(
        title: 'کافی میکس 1 × 2 مولتی کافه - 14 گرم بسته 24 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/f3ee9b82551be511f362c2b8c86af705c273b76a_1605615839.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '144,900',
        oldPrice: '207,000',
        discount: '30%',
        isAvalaible: true),
    FoodAmazing(
        title:
            'نوار بهداشتی مای لیدی مدل سوپر پد همیشه خشک سایز خیلی خیلی بزرگ بسته 7 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/cecabf12f6a9c8105e6fe7327de378c104426141_1727184421.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '37,500',
        oldPrice: '52,200',
        discount: '28%',
        isAvalaible: true),
    FoodAmazing(
        title: 'برنج ایرانی هاشمی طبیعت - 4.5 کیلوگرم',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/b2dbfb224121661bdaff2d1d486325daabfc94fb_1620537077.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '535,100',
        oldPrice: '629,550',
        discount: '15%',
        isAvalaible: true),
    FoodAmazing(
        title: 'مایع جرمگیر و تمیز کننده من مدل A2 حجم 1000 میلی لیتر',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/2402b1de2810d23db956bd0189d9534395d616a7_1636780781.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '28,600',
        oldPrice: '25,000',
        discount: '13%',
        isAvalaible: true),
    FoodAmazing(
        title:
            'مایع لباسشویی احیا کننده پرسیل مخصوص لباس های ظریف و ابریشمی و پشمی وزن 1 کیلوگرم',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/ce71767fdbf07ac35196f7aeb1dd890c5ed1576f_1727529114.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '101,000',
        oldPrice: '123,000',
        discount: '18%',
        isAvalaible: true),
    FoodAmazing(
        title: 'دستمال توالت سافتلن بسته 12 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/3b99900e57435c85fef5d25d6a2c204e2ad5457a_1609669518.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '166,800',
        oldPrice: '202,300',
        discount: '18%',
        isAvalaible: true),
    FoodAmazing(
        title: 'دستمال توالت فول تایم مدل رولی بسته 4 عددی',
        image:
            'https://dkstatics-public.digikala.com/digikala-products/e62bb8071a4731d01b6ba22a21438d71cd6e69f1_1671955823.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90',
        price: '45,900',
        oldPrice: '57,800',
        discount: '35%',
        isAvalaible: true),
  ];
}
