import 'package:assigment_of_lrb/utils/Container_Style.dart';
import 'package:assigment_of_lrb/view/Login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false; // Loading state

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: SplashTextWidget(size: size),
              ),
            ),
            const Spacer(), // Push buttons to the bottom
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, // Responsive padding
                vertical: size.height * 0.03,
              ),
              child: Column(children: [
                _buildButton(context,
                    label: "Login",
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.transparent,
                    onPressed: _handleLoginPressed),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginPressed() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required Color color,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    final double buttonWidth =
        MediaQuery.of(context).size.width * 0.8; // Responsive width

    return SizedBox(
      width: buttonWidth, // Responsive width
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.03), // Responsive padding
          child: _isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.green,
                  strokeWidth: 3.0,
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width *
                        0.04, // Responsive font size
                  ),
                ),
        ),
      ),
    );
  }
}

class SplashTextWidget extends StatefulWidget {
  final Size size;

  const SplashTextWidget({
    super.key,
    required this.size,
  });

  @override
  _SplashTextWidgetState createState() => _SplashTextWidgetState();
}

class _SplashTextWidgetState extends State<SplashTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _bounceAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double titleFontSize = widget.size.width * 0.19;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _bounceAnimation,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Service\n',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ),
                TextSpan(
                  text: 'Booking\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ),
                TextSpan(
                  text: 'App',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
