import 'package:flutter/material.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:telegram_ui/pages/home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const id = 'search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchTabs = const [
    'Chats',
    'Media',
    'Downloads',
    'Links',
    'Files',
    'Music',
    'Voice',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[800] ?? Colors.blueGrey,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            Navigator.pop(context, HomePage.id);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 22),
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle:
                TextStyle(color: Colors.grey[300] ?? Colors.grey, fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: TitleScrollNavigation(
          barStyle: TitleNavigationBarStyle(
            activeColor: Colors.blue[300] ?? Colors.blue,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            deactiveColor: Colors.grey[300] ?? Colors.grey,
            padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20),
            background: Colors.blueGrey[800] ?? Colors.blueGrey,
            spaceBetween: 40,
          ),
          identiferStyle:
              NavigationIdentiferStyle(color: Colors.blue[300] ?? Colors.blue),
          titles: searchTabs,
          pages: [
            // #Chats page
            Container(
              color: Colors.blueGrey[800],
              child: Column(
                children: [
                  // #recently chats row
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Colors.black))),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        recentlyChatItem(
                            userPic: 'assets/images/im_user1.jpg',
                            username: "Isroiljon"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user7.jpg',
                            username: "Akam"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user8.jpg',
                            username: "Dilshod"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user9.jpg',
                            username: "Abror"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user10.jpg',
                            username: "Ali"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user6.jpg',
                            username: "Isroiljon"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user12.jpg',
                            username: "Isroiljon"),
                        recentlyChatItem(
                            userPic: 'assets/images/im_user1.jpg',
                            username: "Isroiljon"),
                      ],
                    ),
                  ),
                  // #recently and Clear all
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.blueGrey[900],
                    width: double.infinity,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent',
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text(
                          'Clear All',
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // recently chats
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: ListView(
                        children: [
                          recentChat(
                              userPic: 'assets/images/im_user3.jpg',
                              username: 'Sadiya teacher',
                              lastSeen: 'last seen recently'),
                          recentChat(
                              userPic: 'assets/images/im_user4.jpg',
                              username: 'Shaxriyor',
                              lastSeen: 'last seen at 00:18'),
                          recentChat(
                              userPic: 'assets/images/im_user5.jpg',
                              username: 'Sherali Gruppadosh',
                              lastSeen: 'last seen recently'),
                          recentChat(
                              userPic: 'assets/images/im_user6.jpg',
                              username: 'Ibrohimjon',
                              lastSeen: 'last seen at 06:24'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // #Media page
            Container(
              color: Colors.blueGrey[800],
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/im_media.jpg'),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            // #Downloads page
            Container(
              color: Colors.blueGrey[800],
              child: Column(
                children: [
                  // #recently and Clear all
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.blueGrey[900],
                    width: double.infinity,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently downloaded',
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // #downloaded files
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return downloadItem(
                            image: 'assets/images/ic_apk.png',
                            name: 'Best Calculator.apk',
                            size: '12.1 MB',
                            from: 'Akramjon Simpl');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget recentlyChatItem({userPic, username}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(userPic), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            username,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget recentChat({userPic, username, lastSeen}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // #profile image
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(userPic),
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
                Text(
                  username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  lastSeen,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget downloadItem({image, name, size, from}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$size • $from',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
