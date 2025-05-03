import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_test/app/screen/register/sigin_screens.dart';
import 'package:project_test/app/utils/button_sigin_up.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            // color: Colors.black.withOpacity(0),
          ),
          // Centered Content with Blur Effect
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/154107800?s=400&u=11caa76aa5bdaf58a4726e698ba1cdf9dcdf6eb1&v=4"),
                      ),
                      const SizedBox(height: 30),

                      // Welcome Text
                      const Text(
                        'Welcome to Our App!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Get Started Button
                      Buttonsign_in_up(
                        text: 'Get Started',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
