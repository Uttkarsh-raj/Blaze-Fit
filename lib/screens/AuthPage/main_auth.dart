import 'package:blaze_fit/screens/HomeScreen/home_screen.dart';
import 'package:blaze_fit/screens/Signup/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const SignUp();
          }
        },
      ),
    );
  }
}

// final User user = FirebaseAuth.instance.currentUser!;
// UserModle? userData;

// final screen = [
//   const PostPage(),
//   const MessagesPage(),
//   const SearchLawyerPage(),
// ];

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int selectedIndex = 0;
//   void onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.miniCenterDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColorsConstants.primaryBackgroundColor,
//         onPressed: () => Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => const NewPostPage(),
//           ),
//         ),
//         child: const Icon(
//           IconlyBold.plus,
//           size: 40,
//           color: AppColorsConstants.tertiaryBlackColor,
//         ),
//       ),
//       extendBody: true,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         selectedItemColor: AppColorsConstants.secondaryPurpleColor,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message_outlined),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search_outlined),
//             label: 'Search',
//           ),
//         ],
//         // type: BottomNavigationBarType.shifting,
//         onTap: onItemTapped,
//       ),
//       body: screen[selectedIndex],
//     );
//   }
// }