import 'package:flutter/material.dart';

// تعريف الصفحة كـ StatefulWidget لأنها تحتوي على متغيرات ديناميكية
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// حالة الصفحة
class _HomeScreenState extends State<HomeScreen> {
  int count = 0; // متغير لحفظ العمر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صندوق يحتوي على المعلومات الشخصية
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22), // زاوية مستديرة في الأعلى يسار
                  bottomRight: Radius.circular(35), // زاوية مستديرة في الأسفل يمين
                ),
                color: Colors.teal, // لون الخلفية
              ),
              width: 300,
              height: 300,
              child: Column(
                children: [
                  SizedBox(height: 25),

                  // عنوان "Who Am I?"
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Who Am I?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  // نص "Flutter Developer" مع خط تحت النص
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Flutter Developer',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // صف يحتوي على الصورة والمعلومات الشخصية
                  Row(
                    children: [
                      // صورة الأيقونة
                      Container(
                        width: 125,
                        height: 125,
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/128/12245/12245107.png',
                          alignment: AlignmentDirectional.bottomStart,
                        ),
                      ),

                      // توسيع العمود ليأخذ باقي المساحة المتاحة
                      Expanded(
                        child: Column(
                          children: [
                            // عرض الاسم
                            Container(
                              child: Text('Name: Saif Gamal'),
                            ),

                            Column(
                              children: [
                                // صف يحتوي على زر زيادة العمر، عرض العمر، وزر تقليل العمر
                                Row(
                                  children: [
                                    // زر زيادة العمر
                                    Expanded(
                                      child: Container(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              count++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ),
                                    ),

                                    // عرض العمر الحالي
                                    Text('Age $count year'),

                                    // زر تقليل العمر
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count--;
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                  ],
                                ),

                                // عرض اسم الأكاديمية
                                Text('Alshorok Academy'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
