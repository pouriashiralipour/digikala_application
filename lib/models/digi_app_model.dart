class DigiAppModel {
  final String title, img;

  DigiAppModel({required this.title, required this.img});

  static final List<DigiAppModel> items = [
    DigiAppModel(title: 'دریافت وام', img: 'assets/digi_app/d1.png'),
    DigiAppModel(title: 'بومی ومحلی', img: 'assets/digi_app/d2.jpg'),
    DigiAppModel(title: 'سوپرمارکت \nپرتخفیف', img: 'assets/digi_app/d3.png'),
    DigiAppModel(title: 'دعوت میلیونی', img: 'assets/digi_app/d4.png'),
    DigiAppModel(title: 'جایزه پلاس', img: 'assets/digi_app/d5.png'),
    DigiAppModel(title: 'دیجی کالا مهر', img: 'assets/digi_app/d6.png'),
    DigiAppModel(title: 'حراج استایل', img: 'assets/digi_app/d7.png'),
    DigiAppModel(title: 'خرید چکی', img: 'assets/digi_app/d8.png'),
    DigiAppModel(title: 'دیجی کالاسرویس', img: 'assets/digi_app/d9.png'),
  ];
}
