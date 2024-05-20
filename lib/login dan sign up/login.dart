import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perpustakaan/dashboard.dart';
import 'package:perpustakaan/login%20dan%20sign%20up/auth_service.dart';
import 'package:perpustakaan/login%20dan%20sign%20up/signup.dart';
import 'package:perpustakaan/login%20dan%20sign%20up/widgets/button.dart';
import 'package:perpustakaan/login%20dan%20sign%20up/widgets/textfield.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text("Login",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
            SizedBox(height: 8,),
            const Text("Please login to continue",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 40),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                label: "Login",
                onPressed: _login,
              ),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Sign Up", style: TextStyle(color: Color.fromARGB(255, 144, 210, 238), fontSize: 16,)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const signup()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const dashboard()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}