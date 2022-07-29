import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = "settings_page";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[800] ?? Colors.blueGrey,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            // Navigator.pop(context, HomePage.id);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(MaterialIcons.qr_code),
          ),
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(children: [
        SafeArea(
          child: Container(
            color: Colors.blueGrey[900],
            child: Column(
              children: [
                // #profile area
                Container(
                  color: Colors.blueGrey[800],
                  width: double.infinity,
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // #profile image
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: size.height * 0.07,
                            height: size.height * 0.07,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/im_profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // #user info and state
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Umidjon Yoqubov',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'online',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    // #user account info
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: size.height * 0.22,
                      color: Colors.blueGrey[900],
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      'Account',
                                      style: TextStyle(
                                          color: Colors.blue[300],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    const Text(
                                      '+998 90 3003625',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Text(
                                      'Tap to change phone number',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'None',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Bio',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Add a few words about yourself',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 10,
                      color: Colors.black,
                    ),
                    // #settings container
                    Container(
                      color: Colors.blueGrey[900],
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          settingsItem(Icons.notifications_outlined,
                              'Notifications and sound', null),
                          settingsItem(
                              Icons.lock_outline, 'Privacy and Security', null),
                          settingsItem(
                              Feather.pie_chart, 'Data and Storage', null),
                          settingsItem(
                              Feather.message_circle, 'Chat Settings', null),
                          settingsItem(Icons.sticky_note_2_outlined,
                              'Stickers and Emoji', null),
                          settingsItem(
                              Icons.folder_outlined, 'Chat Folders', null),
                          settingsItem(Icons.devices_sharp, 'Devices', null),
                          settingsItem(Feather.globe, 'Language', null),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 10,
                      color: Colors.black,
                    ),
                    // #telegram premium
                    Container(
                      color: Colors.blueGrey[900],
                      width: double.infinity,
                      height: size.height * 0.06,
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: const Icon(
                              Icons.star_rounded,
                              size: 40,
                              color: Color.fromARGB(255, 222, 15, 245),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Telegram Premium',
                            style: TextStyle(
                                color: Color.fromARGB(232, 249, 245, 245),
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 10,
                      color: Colors.black,
                    ),
                    Container(
                      color: Colors.blueGrey[900],
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 20),
                            child: Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          settingsItem(
                              FontAwesome.commenting_o, 'Ask a Question', null),
                          settingsItem(
                              MaterialIcons.help_outline, 'Telegram FAQ', null),
                          settingsItem(null, 'Language',
                              'assets/images/verified_user.png'),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        // $add profile picture button
        Transform.translate(
          offset: Offset(size.width * 0.8, size.height * 0.064),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    height: size.height * 0.5,
                    color: Colors.blueGrey[800],
                  );
                },
              );
            },
            child: Container(
              width: size.height * 0.07,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue[300]),
              child: const Center(
                  child: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.white,
                size: 30,
              )),
            ),
          ),
        ),
      ]),
    );
  }

  Widget settingsItem(IconData? icon, String settingsName, String? image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: image == null
              ? Icon(
                  icon,
                  size: 30,
                  color: Colors.white30,
                )
              : Image(
                  image: AssetImage(image),
                  width: 30,
                  color: Colors.white30,
                ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.2, color: Colors.black),
              ),
            ),
            child: Text(
              settingsName,
              style: const TextStyle(
                  color: Color.fromARGB(218, 254, 254, 254), fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
//end
}
