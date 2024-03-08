import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'books.dart';
import 'map_page.dart';
import 'package:book_me/components/styles.dart'; // Import the file where the gradient is defined

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _selectedIndex == 0 ? 'Vending Machines' : 'Books',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: AppGradients.monochromaticGreenGradient,
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const MapPage(),
          const BooksPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: AppGradients.monochromaticGreenGradient,
        child: GNav(
          backgroundColor: Colors.transparent, // Made transparent
          color: Colors.white,
          activeColor: Colors.grey.shade200,
          tabBackgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.location_on_outlined,
              text: 'Vending Machines',
            ),
            GButton(
              icon: Icons.menu_book_sharp,
              text: 'Books',
              gap: 8,
            ),
          ],
        ),
      ),
    );
  }
}

// Your gradient BoxDecoration definition in styles.dart remains the same.







// // sign user out method
// void signUserOut() {
//   FirebaseAuth.instance.signOut();
// }

  







// Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Home',
//           style: TextStyle(
//             color: Colors.grey[200],
//           ),
//         ),
//         backgroundColor: Colors.grey[700],
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(' logged in '),
//       ),
//     );