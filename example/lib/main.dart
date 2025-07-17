// این نسخه نهایی و کامل پروژه مثال است.
// شامل اصلاحات معماری، رفع تمام خطاها و نمایش تمام ویجت‌ها.

import 'package:flutter/material.dart';
import 'package:text_fa/text_fa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مثال پکیج TextFa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Vazirmatn',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, height: 1.5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
      // FIX: Correctly pointing to the new StatefulWidget
      home: const MyHomePage(),
    );
  }
}

// FIX: Added the missing StatefulWidget class definition.
// این "جسم" ویجت بود که فراموش شده بود.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // FIX: This now correctly creates the state for MyHomePage.
  State<MyHomePage> createState() => _MyHomePageState();
}

// این "روح" ویجت است که اکنون به جسم صحیح خود متصل شده.
class _MyHomePageState extends State<MyHomePage> {
  // کنترلرها برای فیلدهای ورودی
  late final FaTextEditingController _smartController;
  late final TextEditingController _superController;

  @override
  void initState() {
    super.initState();
    _smartController =
        FaTextEditingController(text: 'Hello from smart controller!');
    _superController = TextEditingController(
        text: 'این یک شاهکار است.\nThis is a masterpiece.');
  }

  @override
  void dispose() {
    _smartController.dispose();
    _superController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // لیست جدید و تقویت‌شده از تمام متن‌های چالشی برای تست پکیج
    final List<Map<String, String>> testCases = [
      // Basic Cases
      {
        'title': 'متن کاملاً فارسی',
        'text': 'سلام، این یک متن کاملاً فارسی برای تست است.'
      },
      {
        'title': 'متن کاملاً انگلیسی',
        'text': 'Hello, this is a fully English text for testing.'
      },

      // Mixed Language Cases
      {
        'title': 'شروع با انگلیسی، غلبه با فارسی',
        'text': 'Flutter بهترین فریمورک برای ساخت اپلیکیشن‌های زیباست.'
      },
      {
        'title': 'شروع با فارسی، غلبه با انگلیسی',
        'text': 'فلاتر is an excellent framework developed by Google.'
      },
      {
        'title': 'متن انگلیسی با کلمه فارسی',
        'text': 'This is a great کلمه in an English sentence.'
      },
      {
        'title': 'متن متعادل (فارسی برنده)',
        'text': 'این یک test است. level بعدی سخت‌تر است.'
      },
      {
        'title': 'متن متعادل (انگلیسی برنده)',
        'text': 'This is a test. این هم یک آزمایش است.'
      },

      // Punctuation & Numbers
      {
        'title': 'متن ترکیبی با عدد و علامت',
        'text': 'قیمت این محصول 25,000 تومان است. (تخفیف ویژه!)'
      },
      {
        'title': 'متن با اعداد انگلیسی در فارسی',
        'text': 'نسخه جدید 3.14.1 منتشر شد.'
      },
      {
        'title': 'کد و متن فارسی',
        'text': 'برای نمایش متن از ویجت `Text()` استفاده می‌کنیم.'
      },
      {
        'title': 'آدرس اینترنتی در متن فارسی',
        'text': 'برای اطلاعات بیشتر به سایت flutter.dev مراجعه کنید.'
      },

      // Edge Cases
      {'title': 'متن فقط عدد و علامت', 'text': '123-456-7890!@#\$%^&*()'},
      {
        'title': 'متن با ایموجی',
        'text': 'عاشق برنامه‌نویسی با فلاتر هستم ❤️🚀'
      },
      {'title': 'متن کوتاه انگلیسی در فارسی', 'text': 'این یک متن OK است.'},
      {
        'title': 'متن چند خطی پیچیده',
        'text':
            'خط اول این متن فارسی است.\nThis is the second line.\nو خط سوم دوباره فارسی است!\nLine 4 is English again.'
      },
      {
        'title': 'متن با خطوط خالی',
        'text': 'خط اول.\n\nخط سوم بعد از یک خط خالی.'
      },
      {'title': 'فقط URL', 'text': 'https://flutter.dev'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('نمایش قدرت پکیج TextFa'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // بخش ورودی‌های هوشمند
            _buildSectionTitle('بخش ورودی‌های هوشمند (TextField)'),

            // ویجت انقلابی SuperTextFieldFa
            _buildCard(
              title: 'ویجت SuperTextFieldFa (شاهکار نهایی)',
              subtitle: 'هر خط جهت‌گیری مستقل دارد. کل متن را انتخاب کنید!',
              child: SuperTextFieldFa(
                controller: _superController,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'جادوی واقعی اینجاست...',
                  filled: true,
                  fillColor: Color(0xFFF0F4FF),
                ),
              ),
            ),

            // ویجت‌های قبلی
            _buildCard(
              title: 'ویجت TextFieldFa (چند خطی)',
              child: const TextFieldFa(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'جهت کل فیلد تغییر می‌کند...',
                ),
              ),
            ),

            _buildCard(
              title: 'کنترلر FaTextEditingController',
              child: ValueListenableBuilder<TextDirection>(
                valueListenable: _smartController.directionNotifier,
                builder: (context, direction, child) {
                  return TextField(
                    controller: _smartController,
                    textDirection: direction,
                    textAlign: TextAlign.start,
                  );
                },
              ),
            ),

            // بخش نمایش متن
            _buildSectionTitle('بخش نمایش متن (Text)'),

            ...testCases.map((item) {
              return _buildCard(
                title: item['title'] ?? 'بدون عنوان',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('با ویجت TextFa():',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFa(item['text'] ?? ''),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required String title, String? subtitle, required Widget child}) {
    return Card(
      elevation: 3,
      // FIX: Replaced deprecated withOpacity with withAlpha. (0.2 * 255 ~= 51)
      shadowColor: Colors.indigo.withAlpha(51),
      margin: const EdgeInsets.only(bottom: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
            const Divider(height: 24, thickness: 1),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
