import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assigment_of_lrb/utils/Colors.dart';
import 'package:assigment_of_lrb/utils/Container_Style.dart';
import 'package:assigment_of_lrb/view/Login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: Styles.gradientDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  FaIcon(
                    FontAwesomeIcons.mailchimp,
                    color: Colors.white,
                    size: screenWidth * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello!\n",
                            style: TextStyle(
                              fontSize: screenWidth * 0.075,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Register to get started',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColors.paleSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(
                    hintText: 'Username (optional)',
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  _buildEmailField(),
                  SizedBox(height: screenHeight * 0.015),
                  _buildPasswordField(),
                  SizedBox(height: screenHeight * 0.015),
                  _buildConfirmPasswordField(),
                  SizedBox(height: screenHeight * 0.02),
                  _buildRegisterButton(),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDividerText("Or Register With"),
                  SizedBox(height: screenHeight * 0.015),
                  _buildSocialButtons(),
                  SizedBox(height: screenHeight * 0.02),
                  _buildLoginRedirect(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required ValueChanged<String> onChanged,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(color: const Color(0xFFE8ECF4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isEmailValid = _email.contains('@gmail.com');
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(color: isEmailValid ? Colors.green : Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@gmail.com')) {
              return 'Email must be a Gmail address';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isPasswordValid = _password.length >= 6;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(color: isPasswordValid ? Colors.green : Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isConfirmPasswordValid = _password == _confirmPassword;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
            color: isConfirmPasswordValid ? Colors.green : Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Confirm password',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _confirmPassword = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != _password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E232C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: _handleRegister,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerText(String text) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.02,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Color(0xFFE8ECF4),
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.045,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color(0xFFE8ECF4),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(
          FontAwesomeIcons.facebook,
          Colors.blue,
          () {
            // Facebook login functionality
          },
        ),
        _buildSocialButton(
          FontAwesomeIcons.google,
          Colors.red,
          () {
            // Google login functionality
          },
        ),
        _buildSocialButton(
          FontAwesomeIcons.github,
          Colors.black,
          () {
            // GitHub login functionality
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      IconData icon, Color color, VoidCallback onPressed) {
    final screenWidth = MediaQuery.of(context).size.width;
    return IconButton(
      icon: FaIcon(
        icon,
        color: Colors.white,
        size: screenWidth * 0.08,
      ),
      color: color,
      onPressed: onPressed,
      splashRadius: screenWidth * 0.1,
    );
  }

  Widget _buildLoginRedirect() {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      child: Text(
        "Already have an account? Login",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: screenWidth * 0.04,
        ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', _email);
        await prefs.setString('password', _password);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('You have been registered into our family.'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        });
      } catch (e) {
        // Handle registration errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration failed. Please try again.'),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
