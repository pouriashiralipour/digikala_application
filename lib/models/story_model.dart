class StoryModel {
  final String title, img;
  final List<String> story;

  StoryModel({required this.title, required this.img, required this.story});

  static final List<StoryModel> items = [
    StoryModel(
      story: [
        'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
        'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
      ],
      title:
          'این یک متن نمونه است که می‌خواهیم آن را کوتاه کنیم و فقط بخشی از آن را نمایش دهیم...',
      img: 'assets/digi_app/d1.png',
    ),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'بومی ومحلی', img: 'assets/digi_app/d2.jpg'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/d8f56b00ab6f9676f1b6b09339efe575601e6d56_1730277323.webp'
    ], title: 'سوپرمارکت پرتخفیف', img: 'assets/digi_app/d3.png'),
    StoryModel(story: [
      'assets/sliders/d8f56b00ab6f9676f1b6b09339efe575601e6d56_1730277323.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'دعوت میلیونی', img: 'assets/digi_app/d4.png'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'جایزه پلاس', img: 'assets/digi_app/d5.png'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'دیجی کالا مهر', img: 'assets/digi_app/d6.png'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'حراج استایل', img: 'assets/digi_app/d7.png'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'خرید چکی', img: 'assets/digi_app/d8.png'),
    StoryModel(story: [
      'assets/sliders/a3ee8cd66f1b225690b3db008d125db27141e775_1730525452.webp',
      'assets/sliders/339e146482a10355645286800d215af3305a6d5f_1730286704.gif'
    ], title: 'دیجی کالاسرویس', img: 'assets/digi_app/d9.png'),
  ];
}
