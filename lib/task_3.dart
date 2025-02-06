import 'package:flutter/material.dart';

class SocialDashbord extends StatefulWidget {
  const SocialDashbord({super.key});

  @override
  State<SocialDashbord> createState() => _SocialDashbordState();
}

class _SocialDashbordState extends State<SocialDashbord> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        title: Center(
          child: Text(
              'Social Dashbord',style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0
              ),
              child: Text(
                'Profiles',
                style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                    radius:50 ,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                  ),
                    CircleAvatar(
                      radius: 12.0,
                      backgroundColor: Colors.white,

                    ),
                    CircleAvatar(
                      radius: 11.0,
                      backgroundColor: Colors.green,

                    )
                  ]
                ),
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius:50 ,
                        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                      ),
                    ]
                ),
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius:50 ,
                        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                      ),
                      CircleAvatar(
                        radius: 12.0,
                        backgroundColor: Colors.white,

                      ),
                      CircleAvatar(
                        radius: 11.0,
                        backgroundColor: Colors.green,

                      )
                    ]
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius:50 ,
                        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                      ),
                    ]
                ),
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius:50 ,
                        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                      ),
                      CircleAvatar(
                        radius: 12.0,
                        backgroundColor: Colors.white,

                      ),
                      CircleAvatar(
                        radius: 11.0,
                        backgroundColor: Colors.green,

                      )
                    ]
                ),
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius:50 ,
                        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png'),
                      ),

                    ]
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Post',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0
              ),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(15)
                )),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Stack(
                        alignment: Alignment.bottomLeft,
                      children :[
                        Image(
                        image: NetworkImage(
                            'https://media.istockphoto.com/id/841278554/photo/beautiful-morning-light-in-public-park-with-green-grass-field.jpg?s=612x612&w=0&k=20&c=rXOM3Uq9kPbpM5IWnCAnffHOP8KKpVKCJDMuNBlTNls='
                        ),
                          width: 330,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                       Container(
                         padding: EdgeInsets.all(10),
                           width: 330,
                         color: Colors.black.withAlpha(100),
                           child: Text('Amazing View!',style: TextStyle(color: Colors.white,fontSize: 25),)
                       ),
                      ]
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Likes: '+count.toString(),style:TextStyle(fontSize: 15)),

                  Row(
                    children: [
                      Container(
                        child: IconButton(
                              onPressed: (){
                                setState(() {
                                  count++;
                                });
                              },
                              icon:

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,

                                ),
                                child: Icon(Icons.thumb_up_alt),
                              )
                          ),
                      ),
                      Text('Like'),
                    ],
                  ),


                ],
              ),

            )
          ],


        ),
      ),



    );
  }
}
