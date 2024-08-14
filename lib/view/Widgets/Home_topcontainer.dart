import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.28, // Adjusted height relative to screen height
      width: double.infinity,

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff00416a), Color(0xffe4e5e6)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: Colors.black.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        border: Border.all(color: Colors.white),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
              screenWidth * 0.05), // Padding relative to screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: screenHeight *
                            0.03, // Adjusted radius relative to screen height
                        backgroundImage: const AssetImage(
                            'assets/images/profile_image.jpeg'), // Replace with your avatar image
                      ),
                      SizedBox(
                          width: screenWidth *
                              0.03), // Adjusted spacing relative to screen width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Morning!',
                            style: TextStyle(
                              fontSize:
                                  screenHeight * 0.025, // Adjusted font size
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Hamood Ahmad Hassan',
                            style: TextStyle(
                              fontSize:
                                  screenHeight * 0.02, // Adjusted font size
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                      border: Border.all(
                        color: const Color.fromARGB(60, 218, 218, 218),
                      ),
                    ),
                    child: IconButton(
                      icon: const Badge(
                        smallSize: 10,
                        backgroundColor: Color.fromARGB(255, 255, 17, 0),
                        alignment: Alignment.topRight,
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                      onPressed: () {
                        // Add your notification logic here
                      },
                      color: Colors.white,
                      iconSize: screenHeight * 0.035, // Adjusted icon size
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: screenHeight *
                      0.03), // Adjusted spacing relative to screen height
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Al Bateen Towers-Hirdiyah St-',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: screenHeight * 0.018), // Adjusted font size
                  prefixIcon: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(
                          screenWidth * 0.03), // Adjusted padding
                      child: Image.asset(
                        'assets/images/locationpin.png', // Replace with your image asset
                        width: screenHeight * 0.025, // Adjusted size
                        height: screenHeight * 0.025, // Adjusted size
                        color: const Color.fromARGB(255, 255, 17, 0),
                      ),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(
                          screenWidth * 0.03), // Adjusted padding
                      child: Image.asset(
                        'assets/images/target.png', // Replace with your image asset
                        width: screenHeight * 0.025, // Adjusted size
                        height: screenHeight * 0.025, // Adjusted size
                        color: Colors.black,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black), // Text color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
