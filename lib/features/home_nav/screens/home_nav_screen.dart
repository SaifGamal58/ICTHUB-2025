import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/features/Final%20Task/Final-Task_Profile.dart';
import 'package:flutter_training/features/home_nav/cubit/bottom_nav_cubit.dart';

import '../../home/screens/Home_Screen.dart';

class BottomNavLayout extends StatelessWidget {
  BottomNavLayout({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    ProfilePage(user: {},),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.deepPurple,
              onTap: (index) {
                context.read<BottomNavCubit>().changeIndex(index);
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Counter',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
