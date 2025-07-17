// این نسخه نهایی و کامل پروژه مثال است.
// شامل بخش‌های مجزا برای نمایش قدرت Text و TextField.

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
        primarySwatch: Colors.deepPurple,
        // fontFamily: 'Vazirmatn',
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // یک کنترلر هوشمند برای نمایش قدرت FaTextEditingController
  late final FaTextEditingController _smartController;

  @override
  void initState() {
    super.initState();
    _smartController =
        FaTextEditingController(text: 'Hello from smart controller!');
  }

  @override
  void dispose() {
    _smartController.dispose();
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // بخش ورودی‌های هوشمند
          _buildSectionTitle('بخش ورودی‌های هوشمند (TextField)'),

          _buildCard(
            title: 'ویجت TextFieldFa',
            child: const TextFieldFa(
              decoration: InputDecoration(
                hintText: 'اینجا بنویسید و جادو را ببینید...',
                labelText: 'با ویجت TextFieldFa',
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
                  decoration: const InputDecoration(
                    labelText: 'با کنترلر هوشمند',
                    hintText: 'اینجا هم بنویسید...',
                  ),
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
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold)),
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
                  const SizedBox(height: 16),
                  const Text('با اکستنشن .fa():',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(item['text'] ?? '').fa(),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
