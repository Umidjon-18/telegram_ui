import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:telegram_ui/model/chat_model.dart';
import 'package:telegram_ui/pages/contacts_page.dart';
import 'package:telegram_ui/pages/lock_page.dart';
import 'package:telegram_ui/pages/search_page.dart';

import 'drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  List<String> myTabs = const [
    'All',
    'Own',
    'Group',
    'Channels',
    'Bots',
  ];

  List<ChatModel> allChats = [
    ChatModel(
        "Akramjon Simpl",
        'assets/images/im_user1.jpg',
        "Mayli Akramjon ofisga borganda bafurcha ko'rib chiqarmiz",
        true,
        '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
    ChatModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'Mayli Akramjon',
        true, '18:52'),
  ];

  bool isLocked = false;
  bool isVisible = true;

  scrollListener() {}

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: myTabs.length);
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'Telegram',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Hero(
            tag: 'lock',
            child: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (_, __, ___) => const LockPage()),),
              icon:isLocked? const Icon(
                MaterialCommunityIcons.lock,
                color: Colors.white,
              ):const Icon(
                MaterialCommunityIcons.lock_open_variant,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.id);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: size.width * 0.75,
        backgroundColor: Colors.grey,
        child: const LeftDrawer(),
      ),
      body: SafeArea(
        child: TitleScrollNavigation(
          barStyle: TitleNavigationBarStyle(
            style: const TextStyle(fontWeight: FontWeight.bold),
            deactiveColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 10),
            background: Colors.blueGrey[900]!,
            spaceBetween: 40,
          ),
          titles: myTabs,
          pages: [
            // #all chats
            NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                setState(() {
                  if (direction == ScrollDirection.reverse) {
                    isVisible = false;
                  } else if (direction == ScrollDirection.forward) {
                    isVisible = true;
                  }
                });
                return true;
              },
              child: Container(
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Colors.black, width: 1),
                  ),
                  color: Colors.blueGrey[850],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: allChats.length,
                  itemBuilder: (BuildContext context, int index) =>
                      chatItem(allChats[index]),
                ),
              ),
            ),
            // #own chats
            Container(
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.blueGrey[850],
              ),
              child: ListView.builder(
                itemCount: allChats.length,
                itemBuilder: (BuildContext context, int index) =>
                    chatItem(allChats[index]),
              ),
            ),
            // #group chats
            Container(
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.blueGrey[850],
              ),
              child: ListView.builder(
                itemCount: allChats.length,
                itemBuilder: (BuildContext context, int index) =>
                    chatItem(allChats[index]),
              ),
            ),
            // #channels
            Container(
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.blueGrey[850],
              ),
              child: ListView.builder(
                itemCount: allChats.length,
                itemBuilder: (BuildContext context, int index) =>
                    chatItem(allChats[index]),
              ),
            ),
            // #bots
            Container(
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.blueGrey[850],
              ),
              child: ListView.builder(
                itemCount: allChats.length,
                itemBuilder: (BuildContext context, int index) =>
                    chatItem(allChats[index]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 250),
        offset: isVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: isVisible ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, ContactsPage.id);
            },
            child: const Icon(Icons.edit),
          ),
        ),
      ),
    );
  }

  Widget chatItem(ChatModel chat) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // #profile image
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(chat.userPic),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // #username and last chat
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chat.username,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Text(
                          chat.date,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  chat.lastChatText.length < 35
                      ? chat.lastChatText
                      : '${chat.lastChatText.substring(0, 35)}...',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
