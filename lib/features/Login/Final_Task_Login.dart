import 'package:flutter/material.dart';

import 'package:flutter_training/features/register/Final_Task_Register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../home/screens/Home_Screen.dart';

class FinalTaskLogin extends StatefulWidget {
  const FinalTaskLogin({super.key});

  @override
  State<FinalTaskLogin> createState() => _FinalTaskLoginState();
}

class _FinalTaskLoginState extends State<FinalTaskLogin> {
  var EmailController = TextEditingController(); // للتحكم في النص المدخل في حقل الإيميل
  var PAsswordController = TextEditingController(); // للتحكم في النص المدخل في حقل كلمة المرور
  // متغير لتحديد حالة ظهور أو إخفاء النص داخل حقل كلمة المرور
  bool isObscure = true;

  Future<void> _login() async {
    final email = EmailController.text;
    final password = PAsswordController.text;

    final response = await Supabase.instance.client
        .from('users')
        .select()
        .eq('email', email)
        .eq('password', password)
        .single();

    if (!mounted) return;

    if (response.error == null && response.data != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(key: response.data)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid email or password.")));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, // عرض الحاوية يمتد لملء الشاشة
                height: 270, // ارتفاع الحاوية
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // محاذاة النص إلى الأسفل
                    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                    children: [
                      Text(
                        'WELCOME BACK! Glad to see you, Again!', // العنوان الرئيسي
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        labelText: 'Enter your email', // تسمية الحقل
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
                        labelText: 'Enter your Password', // تسمية الحقل
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

                        },
                        color: Colors.deepPurple, // لون الزر
                        padding: EdgeInsets.all(14.0), // الحشو الداخلي للزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // زوايا مستديرة
                        ),
                        child: Text(
                          'Login', // النص داخل الزر
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
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
                                builder: (context) => FinalTaskRegister(),
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

extension on PostgrestMap {
  get error => null;

  get data => null;
}
