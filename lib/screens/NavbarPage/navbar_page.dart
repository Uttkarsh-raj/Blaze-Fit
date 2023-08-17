import 'package:blaze_fit/constants/constants.dart';
import 'package:blaze_fit/screens/ChatPage/chat_page.dart';
import 'package:blaze_fit/screens/HomeScreen/home_screen.dart';
import 'package:blaze_fit/screens/MyProfile/profile.dart';
import 'package:flutter/material.dart';

final screen = [
  const HomeScreen(),
  const HomeScreen(),
  const MyProfilePage(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppColorsConstants.primaryBackgroundColor,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ChatPage(),
          ),
        ),
        child: const Icon(
          Icons.chat,
          size: 30,
          color: AppColors.darkGrey,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        // selectedItemColor: AppColorsConstants.secondaryPurpleColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        onTap: onItemTapped,
      ),
      body: screen[selectedIndex],
    );
  }
}
