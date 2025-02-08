import 'package:flutter/material.dart';
import 'package:flutter_training/Task_3_Register_Page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
var EmailController = TextEditingController();

   var PAsswordController = TextEditingController();

   bool isObscure =true;

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
                            'Sign in to your Account',
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,
                          color: Colors.white),
                        ),
                        Text(
                          'Sign in to your Account',
                          style: TextStyle(color: Colors.white),
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
                         maxLength: 25,
                         controller:EmailController ,
                          keyboardType: TextInputType.emailAddress,
                          onSubmitted: (value)
                          {

                          },
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
                     onSubmitted: (value)
                     {


                     },
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
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           TextButton(onPressed: (){

                           },
                               child:Text(
                                   'Forgot Password?'
                               ,style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Colors.green,
                               ),

                               ) ),
                         ],
                       ),
                       Container(
                         width: double.infinity,
                         child: MaterialButton(onPressed: ()
                         {
                           print(EmailController.text);
                           print(PAsswordController.text);

                         },
                             color: Colors.green,
                             padding: EdgeInsets.all(14.0),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10)
                             ),
                             child:Text(
                                 'Login',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20
                               ),
                             )
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Expanded(
                               child:Divider(
                                 color: Colors.grey,
                                 thickness: 1,
                                 endIndent: 6,
                               ),
                           ),
                           Text(
                             'Or login with',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                           Expanded(
                             child:Divider(
                               color: Colors.grey,
                               thickness: 1,
                               indent: 6,
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 40,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                          OutlinedButton.icon(onPressed: ()
                          {

                          },
                              icon: Icon(
                                Icons.g_mobiledata
                              ),

                              label: Text(
                                  'Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                           OutlinedButton.icon(onPressed: ()
                           {

                           },
                               icon: Icon(
                                   Icons.facebook
                               ),

                               label: Text(
                                 'Facebook',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 ),
                               )
                           )


                         ],
                       ),
                       SizedBox(
                         height: 50,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           Text(
                               'Don\'t have an account?'
                           ),
                           TextButton(onPressed: ()
                           {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => RegisterPage()),
                             );

                           },
                               child:Text(
                                 'Register'
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
              ],
            ),
        ),
      ),
      );


  }
}
