import 'package:assigment_of_lrb/view/Profile_screen.dart';
import 'package:assigment_of_lrb/view/Widgets/Booking_screen.dart';
import 'package:assigment_of_lrb/view/Widgets/Home_topcontainer.dart';
import 'package:flutter/material.dart';
import 'package:assigment_of_lrb/utils/Container_Style.dart';
import 'package:assigment_of_lrb/view/Widgets/Stack_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide in from the right
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0); // Slide in from the left
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }
  }

  void _showCircularIndicator() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 25,
        left: MediaQuery.of(context).size.width / 2 - 25,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent FAB from moving when keyboard is shown
      body: Container(
        height: screenHeight,
        decoration: Styles.gradientDecoration,
        child: Column(
          children: [
            const ProfileHeader(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 370, // Adjust this height based on your content
                child: StackCardSlider(),
              ),
            ),
            Container(
              height: screenHeight * 0.15,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Become a Patron To start Earnings",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, bottom: 8.0, left: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color(0xff00416a).withOpacity(0.5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Known as",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    height: screenHeight * 0.2,
                    width: screenHeight * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.02),
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 3,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(3, 2))
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/known.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Add space at the bottom
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          // Handle FAB press action here
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
        child: IconButton(
          onPressed: _showCircularIndicator,
          icon: const Icon(Icons.handshake),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 229, 229, 229),
        notchMargin: 12.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: BottomNavigationBar(
            selectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', color: Colors.black),
            unselectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', color: Colors.black),
            iconSize: 20,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
