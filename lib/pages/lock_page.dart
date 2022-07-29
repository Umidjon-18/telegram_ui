import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:telegram_ui/pages/home_page.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);
  static const String id = 'lock_page';
  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  Map<String, String> keyboardItems = {
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
    '1': '',
    '2': 'ABC',
    '3': 'DEF',
  };
  int shakeCount = 1;
  late TextEditingController passwordController;
  late ShakeAnimationController shakeAnimationController =
      ShakeAnimationController();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordController.addListener(() {
      if (passwordController.text.length == 4) {
        if (passwordController.text == '3333') {
          Navigator.pushReplacementNamed(context, HomePage.id);
        } else {
          shakeAnimationController.start();
          passwordController.text = '';
          setState(() {});
        }
      }
    });
  }

  passwordWriter(String command) {
    if (command == "backspace") {
      if (passwordController.text.isNotEmpty) {
        passwordController.text = passwordController.text
            .substring(0, passwordController.text.length - 1);
      }
    } else {
      passwordController.text += command;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              // #lock icon
              const Hero(
                tag: 'lock',
                child: Icon(
                  MaterialCommunityIcons.lock,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ShakeAnimationWidget(
                shakeAnimationController: shakeAnimationController,
                shakeAnimationType: ShakeAnimationType.LeftRightShake,
                shakeRange: 0.2,
                shakeCount: shakeCount,
                isForward: false,
                child: const Text(
                  'Enter your Telegram passcode',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              // #password field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                  controller: passwordController,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: const InputDecoration(
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
              ),
              // #password keyboard
              Expanded(
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: GridView.builder(
                    reverse: true,
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1 / 1),
                    itemBuilder: (BuildContext context, int index) {
                      return keyboardItem(keyboardItems.keys.elementAt(index),
                          keyboardItems.values.elementAt(index));
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                ),
                height: size.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: IconButton(
                        splashRadius: 50,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.zero,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                width: size.width * 0.9,
                                height: size.height * 0.22,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[800],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Telegram',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.015),
                                    const Text(
                                      'Confirm fingerprint to continue',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.015),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blueGrey,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.fingerprint,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Touch sensor',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'CANCEL',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.blue[200]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.fingerprint,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onTap: () {
                        passwordWriter('0');
                        setState(() {});
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "0",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onTap: () {
                        passwordWriter('backspace');
                        setState(() {});
                      },
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.backspace,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget keyboardItem(String number, String characters) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onTap: () {
        passwordWriter(number);
        setState(() {});
      },
      child: Ink(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            Text(
              characters,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
