import 'package:assigment_of_lrb/utils/Container_Style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Top Center Image
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/profile_image.jpeg'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Bottom Text
                    const Text(
                      'Flutter Developer',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Hamood Ahmad Hassan',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 20),

                    // Divider
                    const Divider(),
                    const SizedBox(height: 20),

                    // Grid View with Titles and Icons
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildGridItem(
                            context, FontAwesomeIcons.cog, 'Settings'),
                        _buildGridItem(context, FontAwesomeIcons.wallet,
                            'Billing Details'),
                        _buildGridItem(context, FontAwesomeIcons.userCheck,
                            'User Management'),
                        _buildGridItem(context, FontAwesomeIcons.infoCircle,
                            'Information'),
                        _buildGridItem(
                            context, FontAwesomeIcons.commentDots, 'Feedback'),
                        _buildGridItem(context, FontAwesomeIcons.signOutAlt,
                            'Logout', Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String title,
      [Color? iconColor]) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon,
                size: 32.0, color: iconColor ?? Theme.of(context).primaryColor),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color:
                    iconColor ?? Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
