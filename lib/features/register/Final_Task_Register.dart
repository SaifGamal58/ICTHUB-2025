import 'package:flutter/material.dart';
import 'package:flutter_training/features/Login/Final_Task_Login.dart';

class FinalTaskRegister extends StatefulWidget {
  const FinalTaskRegister({super.key});

  @override
  State<FinalTaskRegister> createState() => _FinalTaskRegisterState();
}
var EmailController = TextEditingController(); // للتحكم في النص المدخل في حقل الإيميل
var PAsswordController = TextEditingController();// للتحكم في النص المدخل في حقل كلمة المرور
final NameController = TextEditingController(); // حقل كلمة المرور
final RegisterPasswordController = TextEditingController(); // حقل إعادة إدخال كلمة المرور
final GlobalKey<FormState> Formkey = GlobalKey();
// متغير لتحديد حالة ظهور أو إخفاء النص داخل حقل كلمة المرور
bool isObscure = true;
class _FinalTaskRegisterState extends State<FinalTaskRegister> {

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

                    TextField(
                      controller: NameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        labelText: 'UserName',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    // حقل إدخال الإيميل
                    TextField(

                      controller: EmailController, // المتحكم بحقل الإيميل
                      keyboardType: TextInputType.emailAddress, // لوحة مفاتيح خاصة بالبريد الإلكتروني
                      decoration: InputDecoration(
                        hintText:'Enter your email' ,
                        labelText: ' Email', // تسمية الحقل
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
                        hintText: 'Enter Your New password',
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
                        labelText: 'Confirm Password',
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
                    SizedBox(height: 20),
                    // زر تسجيل الدخول
                    Container(
                      width: double.infinity, // عرض الزر يمتد لملء الشاشة
                      child: MaterialButton(
                        onPressed: () {
                          // طباعة النصوص المدخلة في الحقول
                          print(EmailController.text);
                          print(PAsswordController.text);
                        },
                        color: Colors.deepPurple, // لون الزر
                        padding: EdgeInsets.all(14.0), // الحشو الداخلي للزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // زوايا مستديرة
                        ),
                        child: Text(
                          'Register', // النص داخل الزر
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FinalTaskLogin()),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
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
