import 'package:flutter/material.dart';
import 'package:flutter_training/Task_3_Register_Page.dart'; // استيراد صفحة التسجيل

// تعريف صفحة تسجيل الدخول كـ StatefulWidget لأنها تحتوي على عناصر ديناميكية
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// تعريف حالة صفحة تسجيل الدخول
class _LoginPageState extends State<LoginPage> {
  // المتحكمات (Controllers) لحقول الإدخال
  var EmailController = TextEditingController(); // للتحكم في النص المدخل في حقل الإيميل
  var PAsswordController = TextEditingController(); // للتحكم في النص المدخل في حقل كلمة المرور

  // متغير لتحديد حالة ظهور أو إخفاء النص داخل حقل كلمة المرور
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // واجهة الصفحة الرئيسية
      body: GestureDetector(
        // إخفاء لوحة المفاتيح عند الضغط في أي مكان خارج حقول النص
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          // إضافة ميزة التمرير لتجنب قص العناصر إذا زادت محتويات الصفحة
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // محاذاة العناصر إلى الأعلى
            children: [
              // الجزء العلوي من الصفحة (خلفية وصورة ونصوص)
              Container(
                width: double.infinity, // عرض الحاوية يمتد لملء الشاشة
                height: 250, // ارتفاع الحاوية
                color: Colors.teal, // لون الخلفية
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    // صورة الخلفية
                    Image.network(
                      'https://cdn.pixabay.com/photo/2022/01/28/18/32/leaves-6975462_640.png',
                      fit: BoxFit.cover, // ملء الصورة للحاوية
                      height: 250, // ارتفاع الصورة
                    ),
                    // النصوص فوق الصورة
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // محاذاة النص إلى الأسفل
                        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                        children: [
                          Text(
                            'Sign in to your Account', // العنوان الرئيسي
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Sign in to your Account', // العنوان الفرعي
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // الحقول النصية والأزرار
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // حقل إدخال الإيميل
                    TextField(
                      maxLength: 25, // الحد الأقصى لعدد الأحرف
                      controller: EmailController, // المتحكم بحقل الإيميل
                      keyboardType: TextInputType.emailAddress, // لوحة مفاتيح خاصة بالبريد الإلكتروني
                      decoration: InputDecoration(
                        labelText: 'Email', // تسمية الحقل
                        border: OutlineInputBorder(), // إطار الحقل
                      ),
                    ),
                    SizedBox(height: 20), // مسافة بين الحقول

                    // حقل إدخال كلمة المرور
                    TextField(
                      controller: PAsswordController, // المتحكم بحقل كلمة المرور
                      keyboardType: TextInputType.visiblePassword, // لوحة مفاتيح خاصة بكلمات المرور
                      obscureText: isObscure, // تحديد إخفاء النص
                      decoration: InputDecoration(
                        labelText: 'Password', // تسمية الحقل
                        border: OutlineInputBorder(), // إطار الحقل
                        suffixIcon: IconButton(
                          // زر لتغيير حالة إظهار/إخفاء كلمة المرور
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure; // عكس الحالة
                            });
                          },
                          icon: isObscure
                              ? Icon(Icons.visibility_off) // أيقونة الإخفاء
                              : Icon(Icons.visibility_rounded), // أيقونة الإظهار
                        ),
                      ),
                    ),

                    // زر "نسيت كلمة المرور"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // محاذاة الزر إلى اليمين
                      children: [
                        TextButton(
                          onPressed: () {
                            // وظيفة النقر على الزر (فارغة حاليًا)
                          },
                          child: Text(
                            'Forgot Password?', // النص المعروض
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green, // لون النص
                            ),
                          ),
                        ),
                      ],
                    ),

                    // زر تسجيل الدخول
                    Container(
                      width: double.infinity, // عرض الزر يمتد لملء الشاشة
                      child: MaterialButton(
                        onPressed: () {
                          // طباعة النصوص المدخلة في الحقول
                          print(EmailController.text);
                          print(PAsswordController.text);
                        },
                        color: Colors.green, // لون الزر
                        padding: EdgeInsets.all(14.0), // الحشو الداخلي للزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // زوايا مستديرة
                        ),
                        child: Text(
                          'Login', // النص داخل الزر
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20), // مسافة بين العناصر

                    // خط فاصل مع النص "أو تسجيل الدخول باستخدام"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey, // لون الخط
                            thickness: 1, // سماكة الخط
                          ),
                        ),
                        Text(
                          'Or login with', // النص الفاصل
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey, // لون الخط
                            thickness: 1, // سماكة الخط
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40), // مسافة بين العناصر

                    // أزرار تسجيل الدخول باستخدام Google و Facebook
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            // وظيفة زر Google
                          },
                          icon: Icon(Icons.g_mobiledata), // أيقونة Google
                          label: Text(
                            'Google', // النص داخل الزر
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            // وظيفة زر Facebook
                          },
                          icon: Icon(Icons.facebook), // أيقونة Facebook
                          label: Text(
                            'Facebook', // النص داخل الزر
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50), // مسافة بين العناصر

                    // رابط للانتقال إلى صفحة التسجيل
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'), // النص العادي
                        TextButton(
                          onPressed: () {
                            // الانتقال إلى صفحة التسجيل
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register', // النص داخل الزر
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green, // لون النص
                            ),
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
      ),
    );
  }
}
