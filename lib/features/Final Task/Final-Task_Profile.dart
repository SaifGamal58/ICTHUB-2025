import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});
  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 125,),
              Container(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/10050/10050042.png',),
                    ),

                    const CircleAvatar(
                      radius: 18.0,
                      child: Icon(Icons.camera_alt_outlined,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Text("Name: ${user['name']}"),

              Text("Email: ${user['email']}"),

              Text("Phone: ${user['phone']}"),
            ],
          ),
        ),
      ),
    );
  }
}
