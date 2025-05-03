import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_test/app/screen/home/homescreens.dart';
import 'package:project_test/app/screen/register/sigin_screens.dart';
import 'package:project_test/app/utils/toast.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({Key? key}) : super(key: key);

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;

  Future<void> signUpWithEmailAndPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      Showmessage(context, "password not much please try again !",
          icon: Icons.error_outline_rounded,
          backgroundColor: const Color.fromARGB(255, 238, 54, 54));
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Showmessage(context, "Sign up successfull welcom",
          icon: Icons.error_outline_rounded,
          backgroundColor: const Color.fromARGB(255, 76, 237, 58));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen())); // Navigate back to the login screen
    } on FirebaseAuthException catch (e) {
      Showmessage(context, "Can't sign up please try again!",
          icon: Icons.error_outline_rounded,
          backgroundColor: const Color.fromARGB(255, 238, 54, 54));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white24),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.person_outline, size: 48, color: Colors.white),
                const SizedBox(height: 10),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Please enter your information to sign up',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                // Email Field
                _buildTextField(
                  controller: emailController,
                  hintText: 'Email Address',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 15),
                // Password Field
                _buildTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                // Confirm Password Field
                _buildTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.white10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: signUpWithEmailAndPassword,
                        child: const Text('Sign Up',
                            style: TextStyle(color: Colors.white)),
                      ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Sign In',
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() => isPasswordVisible = !isPasswordVisible);
                },
              )
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
