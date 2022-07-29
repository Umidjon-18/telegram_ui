import 'package:flutter/material.dart';
import 'package:telegram_ui/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.2,
          vertical: size.height * 0.16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // #telegram icon
            Container(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/ic_telegram.png'),
                      width: size.width * 0.2,
                    ),
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      'Telegram',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            // #password and username fields
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Login',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // #sign up button
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: const Text('SIGN UP')))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
