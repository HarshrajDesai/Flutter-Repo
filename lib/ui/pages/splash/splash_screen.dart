import 'package:flutter/material.dart';
import 'package:neosao_task/ui/pages/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isButtonVisible = false; // Control the visibility of the button

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a delay to simulate bottom-up animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isButtonVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                foregroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/v2/C5103AQEaWFxTETMa2g/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1558695842759?e=1733961600&v=beta&t=zMbMRDKHdYs7z9MrRE0Oc8qc_FSzv7ymOKGBUEcaNxs"),
              ),
            ),

            // AnimatedContainer for button with bottom-up animation
            AnimatedContainer(
              duration: const Duration(seconds: 1), // Duration of the animation
              curve: Curves.easeInOut, // Animation curve
              margin: EdgeInsets.only(
                top: _isButtonVisible ? 20 : 300, // Animate from off-screen (300) to top (20)
              ),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    'home',
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFF134074),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
