import 'package:assigment_of_lrb/view/Widgets/Booking_screen.dart';
import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: StackCardSlider()));
}

class StackCardSlider extends StatefulWidget {
  const StackCardSlider({super.key});

  @override
  State<StackCardSlider> createState() => _StackCardSliderState();
}

class _StackCardSliderState extends State<StackCardSlider> {
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
      overlayEntry.remove(); // Remove the indicator
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BookingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define gradient color lists
    List<List<Color>> valuesDataGradients = [
      [const Color(0xff00416a), const Color(0xffe4e5e6)],
      [const Color(0xff00416a), const Color(0xffe4e5e6)],
      [const Color.fromRGBO(0, 65, 106, 1), const Color(0xffe4e5e6)],
    ];

    // Define colors for top-left corners
    List<Color> topLeftCornerColors = [
      Colors.red,
      Colors.green,
      Colors.black,
    ];

    // Define texts for each container
    List<String> topCenterTexts = [
      "Let's Do Today",
      "Let's Schedule",
      "It's Urgent"
    ];
    List<String> bottomCenterTexts = [
      "Need IT today? We Can HELP!",
      "Let's Arrange Help Later!",
      "Need Help ASAP!"
    ];
    List<String> buttonTexts = [
      "Let's Do Today",
      "Let's Schedule",
      "It's Urgent"
    ];

    List<Widget> valuesWidget = [];
    for (int i = 0; i < valuesDataGradients.length; i++) {
      valuesWidget.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(
            colors: valuesDataGradients[i],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(100)),
                  child: Container(
                    width: 90,
                    height: 150,
                    color:
                        topLeftCornerColors[i], // Solid color with no overlays
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        topCenterTexts[i],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        bottomCenterTexts[i],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: _showCircularIndicator,
                          child: Text(
                            buttonTexts[i],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        topCenterTexts[i],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return CardSlider(
      cards: valuesWidget,
      bottomOffset: .002,
      cardHeight: 0.75,
      containerHeight: MediaQuery.of(context).size.height - 100,
      itemDotOffset: -0.05,
    );
  }
}
