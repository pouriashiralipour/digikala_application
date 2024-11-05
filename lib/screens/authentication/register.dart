import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onClose;

  const RegisterPage({super.key, required this.onClose});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {
                    widget.onClose();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/svg/Digikala-cropped.svg',
                color: const Color(0xffED1944),
                width: size.width * 0.4,
              ),
              SvgPicture.asset(
                'assets/svg/full-horizontal.svg',
                color: const Color(0xffED1944),
                width: size.width * 0.15,
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              const Text(
                'برای ورود و یا ثبت نام در دیجی کالا شماره موبایل با پست \nالکترونیک خود را وارد نمایید',
                style: TextStyle(
                    height: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'شماره موبایل یا پست الکترونیک',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      //   floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      // حذف خطای ورودی خالی
                      removeError(
                          error:
                              'لطفاً شماره موبایل یا پست الکترونیک را وارد کنید');

                      // بررسی ایمیل و شماره موبایل
                      String emailPattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp emailRegex = RegExp(emailPattern);

                      String phonePattern = r'^(?:\+98|0)?9\d{9}$';
                      RegExp phoneRegex = RegExp(phonePattern);

                      if (emailRegex.hasMatch(value) ||
                          phoneRegex.hasMatch(value)) {
                        removeError(
                            error:
                                'لطفاً یک شماره موبایل معتبر یا ایمیل وارد کنید');
                      } else if (value.isNotEmpty) {
                        addError(
                            error:
                                'لطفاً یک شماره موبایل معتبر یا ایمیل وارد کنید');
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        addError(
                            error:
                                'لطفاً شماره موبایل یا پست الکترونیک را وارد کنید');
                        return '';
                      }

                      String emailPattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp emailRegex = RegExp(emailPattern);

                      String phonePattern = r'^(?:\+98|0)?9\d{9}$';
                      RegExp phoneRegex = RegExp(phonePattern);

                      if (!emailRegex.hasMatch(value) &&
                          !phoneRegex.hasMatch(value)) {
                        addError(
                            error:
                                'لطفاً یک شماره موبایل معتبر یا ایمیل وارد کنید');
                        return '';
                      }

                      removeError(
                          error:
                              'لطفاً یک شماره موبایل معتبر یا ایمیل وارد کنید');
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FormError(errors: errors),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    print("ورود کلیک شد");
                    if (_formKey.currentState!.validate()) {
                      print("ورودی معتبر است");
                      _formKey.currentState!.save();
                    } else {
                      print("ورودی نامعتبر است");
                    }
                  },
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 50.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffED1944), // Button color
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                    ),
                    child: const Center(
                      child: Text(
                        'ورود به دیجی کالا', // Text on the button
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Divider(),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Text(
                'با ورود و یا ثبت نام در دیجی کالا شما شرایط و قوانین استفاده از سرویس های سایت\nدیجی کالا و قوانین حریم خصوصی آن را می پذیرید.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  height: 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });
  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      errors.length,
      (index) => formErrorText(error: errors[index]),
    ));
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          error,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
