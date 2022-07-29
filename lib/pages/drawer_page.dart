import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:telegram_ui/pages/settings_page.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      width: double.infinity,
      child: Column(
        children: [
          // #user info
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 10),
            color: Colors.blueGrey[800],
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // #profile icon
                    Container(
                      width: MediaQuery.of(context).size.width * 1.8 / 9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/im_profile.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    // #theme switcher icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // #user info and phone number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Umidjon Yoqubov',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '+998 903003625',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // #profile change dropdown icon
                    Transform.rotate(
                      angle: math.pi / 2,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // #telegram futures
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              child: SingleChildScrollView(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      futureItem(Icons.people_outline, 'New group'),
                      futureItem(Icons.person_outline, 'Contacts'),
                      futureItem(Icons.call_outlined, 'Calls'),
                      futureItem(
                          Icons.location_history_outlined, 'People Nearby'),
                      futureItem(Icons.bookmark_outline, 'Saved Messages'),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, SettingsPage.id),
                          child:
                              futureItem(Icons.settings_outlined, 'Settings')),
                      const Divider(
                        height: 1,
                        thickness: 2,
                      ),
                      futureItem(Icons.person_add_outlined, 'Invite Friends'),
                      futureItem(Icons.settings_outlined, 'Telegram Features'),
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

  Widget futureItem(IconData icon, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13),
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 25),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
