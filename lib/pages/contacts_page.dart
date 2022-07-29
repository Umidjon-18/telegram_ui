import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/chat_model.dart';
import '../model/contact_model.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);
  static const id = 'contacts_page';

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late ScrollController scrollController;
  bool isVisible = true;
  List<ContactModel> allContacts = [
    ContactModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user2.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user3.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user4.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user5.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user5.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user6.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user7.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user8.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user9.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user10.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user11.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user12.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'at 18:52'),
    ContactModel("Akramjon Simpl", 'assets/images/im_user1.jpg', 'at 18:52'),
  ];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800] ?? Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey[900] ?? Colors.blueGrey,
          elevation: 0,
          leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          centerTitle: false,
          title: const Text(
            'New message',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          actions: [
            IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              height: 5,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: double.infinity,
                height: size.height * 0.2,
                child: Column(
                  children: [
                    newItems(Icons.people_outline, 'New Group'),
                    newItems(Icons.lock_outline, 'New Secret Chat'),
                    newItems(Icons.volume_down_rounded, 'New Channel'),
                  ],
                ),
              ),
              // #sorted by text
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.blueGrey[900],
                width: double.infinity,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sorted by last seen time',
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.6,
                child: NotificationListener<UserScrollNotification>(
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
                      itemCount: allContacts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          contactItem(allContacts[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 250),
        offset: isVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: isVisible ? 1 : 0,
          child: FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () {},
            child: const Icon(
              Icons.person_add_alt_rounded,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget newItems(IconData iconData, String name) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget contactItem(ContactModel contact) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.085,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // #profile image
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(contact.userPic),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // #username and last chat
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                contact.username,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                'last seen ${contact.lastSeenTime}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
