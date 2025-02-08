import 'package:flutter/material.dart';
import 'package:flutter_training/Task_3_Login_Page.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
final EmailController = TextEditingController();
final NameController = TextEditingController();
final PAsswordController = TextEditingController();
final RegisterPasswordController = TextEditingController();
final GlobalKey<FormState> Formkey=GlobalKey();
bool isObscure =true;

class _RegisterPageState extends State<RegisterPage> {
  String?_errorMessage;
  void_validatePassword()
  {
    setState(() {
      if(PAsswordController.text==RegisterPasswordController.text){
        _errorMessage=null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('Password updated successfully!')),

        );
      }else{
        _errorMessage="Password do not match!";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=> FocusManager.instance.primaryFocus?.unfocus() ,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height:250,
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Create your Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: Formkey,
                  child: Column(
                      children: [
                        TextField(
                          maxLength: 25,
                          controller: NameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'FullName',
                              border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          maxLength: 25,
                          controller: EmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(

                          controller: PAsswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                              labelText: 'password',
                              border: OutlineInputBorder(),
                              suffixIcon:IconButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      isObscure = !isObscure;
                                    }
                                    );
                                  },
                                  icon: isObscure?
                                  Icon(Icons.visibility_off)
                                      :Icon(Icons.visibility_rounded))
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                  
                          controller: RegisterPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObscure,
                          validator: (value)
                          {
                            if(value==null|| value.isEmpty){
                              return "This field is required";
                            }
                            return null;
                  
                  
                          },
                          decoration: InputDecoration(
                              labelText: 'Repeatpassword',
                              border: OutlineInputBorder(),
                              errorText: _errorMessage,
                              suffixIcon:IconButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      isObscure = !isObscure;
                                    }
                                    );
                                  },
                                  icon: isObscure?
                                  Icon(Icons.visibility_off)
                                      :Icon(Icons.visibility_rounded))
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: double.infinity,
                          child: MaterialButton(onPressed: ()
                          {
                            if(Formkey.currentState!.validate()){

                            }
                            print(NameController.text);
                            print(EmailController.text);
                            print(PAsswordController.text);
                  
                  
                          },
                              color: Colors.green,
                              padding: EdgeInsets.all(14.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:Text(
                                'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              )
                          ),
                        ),
                  
                        SizedBox(
                          height: 40,
                        ),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                  
                            Text(
                                'I have an account?'
                            ),
                            TextButton(onPressed: ()
                            {

                              Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                  
                            },
                                child:Text(
                                  'Login'
                                  ,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                  
                                ) ),
                          ],
                        ),
                  
                  
                      ]
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
