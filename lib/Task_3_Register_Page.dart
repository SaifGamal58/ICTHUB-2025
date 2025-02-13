import 'package:flutter/material.dart';
import 'package:flutter_training/Task_3_Login_Page.dart';

// تعريف صفحة التسجيل كـ StatefulWidget لأنها تحتوي على عناصر ديناميكية
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// المتحكمات (Controllers) لحقول الإدخال
final EmailController = TextEditingController(); // حقل البريد الإلكتروني
final NameController = TextEditingController(); // حقل الاسم الكامل
final PAsswordController = TextEditingController(); // حقل كلمة المرور
final RegisterPasswordController = TextEditingController(); // حقل إعادة إدخال كلمة المرور
final GlobalKey<FormState> Formkey = GlobalKey(); // مفتاح التحقق من صحة النموذج
bool isObscure = true; // متغير لتحديد حالة إظهار/إخفاء كلمة المرور

// حالة صفحة التسجيل
class _RegisterPageState extends State<RegisterPage> {
  String? _errorMessage; // متغير لتخزين رسالة الخطأ

  // التحقق من تطابق كلمتي المرور
  void _validatePassword() {
    setState(() {
      if (PAsswordController.text == RegisterPasswordController.text) {
        _errorMessage = null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully!')),
        );
      } else {
        _errorMessage = "Passwords do not match!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // إخفاء لوحة المفاتيح عند الضغط في أي مكان خارج حقول النص
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // الجزء العلوي من الصفحة (الخلفية والصورة والنصوص)
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.teal,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    // صورة الخلفية
                    Image.network(
                      'https://cdn.pixabay.com/photo/2022/01/28/18/32/leaves-6975462_640.png',
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                    // النصوص فوق الصورة
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register', // عنوان الصفحة
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Create your Account', // النص الإرشادي
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // نموذج إدخال البيانات
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: Formkey, // مفتاح التحقق من صحة الإدخال
                  child: Column(
                    children: [
                      // حقل الاسم الكامل
                      TextField(
                        maxLength: 25,
                        controller: NameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // حقل البريد الإلكتروني
                      TextField(
                        maxLength: 25,
                        controller: EmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      // حقل كلمة المرور
                      TextField(
                        controller: PAsswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure, // إخفاء النص
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            // زر إظهار/إخفاء كلمة المرور
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: isObscure
                                ? Icon(Icons.visibility_off) // أيقونة الإخفاء
                                : Icon(Icons.visibility_rounded), // أيقونة الإظهار
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // حقل إعادة إدخال كلمة المرور
                      TextFormField(
                        controller: RegisterPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Repeat Password',
                          border: OutlineInputBorder(),
                          errorText: _errorMessage, // عرض رسالة الخطأ في حال عدم تطابق كلمات المرور
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility_rounded),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),

                      // زر التسجيل
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            if (Formkey.currentState!.validate()) {
                              _validatePassword(); // التحقق من صحة كلمة المرور
                            }
                            print(NameController.text);
                            print(EmailController.text);
                            print(PAsswordController.text);
                          },
                          color: Colors.green,
                          padding: EdgeInsets.all(14.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),

                      // الانتقال إلى صفحة تسجيل الدخول
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('I have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
