# flutter_training

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              bottomRight: Radius.circular(35),
            ),

              color: Colors.teal,
          ),
          padding: EdgeInsets.all(8),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Who Am i?',style: TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight.bold ),
              ),
              Text(
                'flutter Developer',
                style: TextStyle(
                    decoration:TextDecoration.underline
                ),
              ),


              Row(
                children: [
                  Image(image:
                  NetworkImage('https://cdn-icons-png.flaticon.com/128/12245/12245107.png'),

                  height: 100,
                    width: 100,

                  ),


                  Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text('Name: Saif Gamal'),
],
),
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('dafaffaff'),
],
),
],
)
],

          ),

        ),