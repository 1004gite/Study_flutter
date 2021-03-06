import 'package:flutter/material.dart';
import 'package:flutter_base/instagram_clone/tab_pages/account_page.dart';
import 'package:flutter_base/instagram_clone/tab_pages/home_page.dart';
import 'package:flutter_base/instagram_clone/tab_pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {
  // const TabPage({Key? key}) : super(key: key);
  final FirebaseUser user;
  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List _pages = [];

  @override
  void initState() {
    // widget.은 initState혹은 build에서만 접근 가능
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTabed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('account')),
        ],
      ),
    );
  }

  void _onItemTabed(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}

