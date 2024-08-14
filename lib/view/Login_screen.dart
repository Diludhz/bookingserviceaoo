import 'package:assigment_of_lrb/utils/Colors.dart';
import 'package:assigment_of_lrb/utils/Container_Style.dart';
import 'package:assigment_of_lrb/view/Home_screen.dart';
import 'package:assigment_of_lrb/view/Register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final bool showSnackbar;

  const LoginScreen({super.key, this.showSnackbar = false});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    if (widget.showSnackbar) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackbar(
            'You have been registered into our family.', Colors.green);
      });
    }
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(const Duration(milliseconds: 600));

      final prefs = await SharedPreferences.getInstance();
      final storedEmail = prefs.getString('email') ?? '';
      final storedPassword = prefs.getString('password') ?? '';

      if (_email == storedEmail && _password == storedPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        _showSnackbar('Login successful!', Colors.green);
      } else {
        _showSnackbar('Invalid email or password.', Colors.red);
      }
    } catch (e) {
      _showSnackbar('An error occurred. Please try again.', Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget buildTextField({
      required String hintText,
      IconData? suffixIcon,
      required Function(String) onChanged,
      bool obscureText = false,
      Function()? suffixIconOnTap,
    }) {
      return Container(
        height: screenHeight * 0.08, // Adjust height relative to screen height
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                screenWidth * 0.02, // Adjust padding relative to screen width
            vertical:
                screenHeight * 0.01, // Adjust padding relative to screen height
          ),
          child: TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
              suffixIcon: suffixIcon != null
                  ? GestureDetector(
                      onTap: suffixIconOnTap,
                      child: Icon(suffixIcon, color: AppColors.ebony),
                    )
                  : null,
              border: InputBorder.none, // Removes the default border
            ),
          ),
        ),
      );
    }

    Widget buildSocialButton(String assetPath) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(
                screenWidth * 0.03), // Adjust padding relative to screen width
            child: Image.asset(assetPath,
                height: screenHeight *
                    0.05), // Adjust image size relative to screen height
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: Styles.gradientDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  FaIcon(
                    FontAwesomeIcons.mailchimp,
                    color: Colors.white,
                    size: screenWidth * 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome back! ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Glad',
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.orange,
                          ),
                        ),
                        TextSpan(
                          text: "\n  to See you, Again!",
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: AppColors.paleSlate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  buildTextField(
                    hintText: 'Enter your email',
                    onChanged: (value) => _email = value,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  buildTextField(
                    hintText: 'Enter your password',
                    suffixIcon: _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: _obscurePassword,
                    onChanged: (value) => _password = value,
                    suffixIconOnTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Implement forgot password functionality here
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Login Button
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.studio,
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: const Color(0xFF1E232C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                onPressed: _handleLogin,
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.04),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: const Text(
                          "Or Login With",
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Colors.black),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      buildSocialButton("assets/images/fb.png"),
                      SizedBox(width: screenWidth * 0.02),
                      buildSocialButton("assets/images/google.png"),
                      SizedBox(width: screenWidth * 0.02),
                      buildSocialButton("assets/images/apple.png"),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF35C2C1),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height *
              0.03), // Top margin for Snackbar
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
