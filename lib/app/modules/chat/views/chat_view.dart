import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _chatviewState();
}

class _chatviewState extends State<ChatView> {
  UniqueKey _key = UniqueKey();
  String _selectedTab = 'All';
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'Satheesh',
      'message': 'hellow What about u',
      'time': '5:59 PM',
      'avatar': 's',
      'color': Colors.green,
      'category': '1-1',
    },
    {
      'name': 'meera',
      'message': 'Have u comple ur Homework',
      'time': '5:43 PM',
      'avatar': 'M',
      'color': Colors.red,
      'category': '1-1',
    },
    {
      'name': 'Avc Collage of autonomous',
      'message': 'Meeting at 3 PM',
      'time': '4:30 PM',
      'avatar': 'M',
      'color': Colors.blue,
      'category': 'Group',
    },
    {
      'name': 'Flutter Butties',
      'message': 'New update available',
      'time': '2:15 PM',
      'avatar': 'P',
      'color': Colors.orange,
      'category': 'Group',
    },
  ];

  Widget _buildHeader(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
           Text(
            'Chats',
            style: GoogleFonts.acme(color: Colors.black,fontSize: 24),
            
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: Colors.black,
          ),
           CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: ClipOval(
                    child: Image.asset(
                      'asset/images/profile.jpg',
                      fit: BoxFit
                          .cover, // Ensures the image is scaled and cropped appropriately
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: ['All', '1-1', 'Group']
            .map((tab) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = tab;
                        _key = UniqueKey();
                      });
                      HapticFeedback.selectionClick();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedTab == tab
                              ? Colors.deepOrange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            tab,
                            style: TextStyle(
                              color: _selectedTab == tab
                                  ? Colors.white
                                  : Colors.grey[400],
                              fontWeight: _selectedTab == tab
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    final filteredChats = _selectedTab == 'All'
        ? _chats
        : _chats.where((chat) => chat['category'] == _selectedTab).toList();

    return ListView.builder(
      itemCount: filteredChats.length,
      itemBuilder: (context, index) {
        final chat = filteredChats[index];
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: chat['color'],
              child: Text(chat['avatar']),
            ),
            title: Text(
              chat['name'],
              style: GoogleFonts.acme(color: Colors.black,fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${chat['message']} (${chat['category']})',
              style: GoogleFonts.acme(color: Colors.grey[800]),
            ),
            trailing: Text(
              chat['time'],
              style: GoogleFonts.acme(color: Colors.grey[800]),
            ),
            onTap: () => Navigator.pushNamed(context, '/chat-detail'),
          ),
        );
      },
    );
  }

  // Widget _buildBottomNav(BuildContext context) {
  //   return Theme(
  //     data: ThemeData(
  //       splashColor: Colors.transparent,
  //       highlightColor: Colors.transparent,
  //     ),
  //     child: BottomNavigationBar(
  //       backgroundColor: Colors.black,
  //       unselectedItemColor: Colors.grey,
  //       selectedItemColor: Colors.white,
  //       type: BottomNavigationBarType.fixed,
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.edit),
  //           label: 'New',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.chat_bubble),
  //           label: 'Chat',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.notifications),
  //           label: 'Notifications',
  //         ),
  //       ],
  //       onTap: (index) {
  //         HapticFeedback.lightImpact();
  //       },
  //     ),
  //   );
  // }

  Future<void> _refreshChats() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      final newChat = {
        'name': 'New User',
        'message': 'Hello! I\'m new here.',
        'time': '${DateTime.now().hour}:${DateTime.now().minute}',
        'avatar': 'N',
        'color': Colors.deepOrange,
        'category': '1-1',
      };
      _chats.insert(0, newChat);
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildSegmentedControl(context),
              const SizedBox(height: 16),
              Expanded(
                child: RefreshIndicator(
                  key: _key,
                  color: Colors.deepOrange,
                  backgroundColor: Colors.grey[800],
                  onRefresh: _refreshChats,
                  child: _buildChatList(context),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomNav(context),
      ),
    );
  }
}
