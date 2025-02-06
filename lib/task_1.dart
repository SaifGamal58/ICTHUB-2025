import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  bottomRight: Radius.circular(35),
                ),
                color: Colors.teal,
              ),
              width: 300,
              height: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                     Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Who Am i?',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Flutter Developer',style: TextStyle(decoration: TextDecoration.underline,fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                          'https://cdn-icons-png.flaticon.com/128/12245/12245107.png',alignment: AlignmentDirectional.bottomStart,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                    'Name: Saif Gamal',
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  count++;
                                                });
                                              },
                                              icon: Icon(Icons.add))
                                        ),
                                      ),
                                      Text(
                                         'age '+count.toString()+' year'
                                        ),
                                      IconButton(
                                          onPressed: (){
                                            setState(() {
                                              count--;
                                            });
                                          },
                                          icon:Icon(Icons.remove))
                                    ],
                                  ),
                                  Text(
                                    'Alshorok Academy'
                                  ),
                                ],
                              )
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
      ) ,
    );
  }
}