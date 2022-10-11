import 'package:flutter/material.dart';
import 'package:senacor_devcon_mysafe/safe/safe.dart';
import 'package:senacor_devcon_mysafe/settings/settings.dart';

import 'log/log_book.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        _title(_selectedIndex),
      ),
    );
  }

  String _title(int index) {
    switch (index) {
      case 0:
        return 'Log';
      case 2:
        return 'Settings';
      default:
        return 'My Safe';
    }
  }

  Center _body() => Center(child: _page(_selectedIndex));

  Widget _page(int index) {
    switch (index) {
      case 0:
        return const LogBook();
      case 2:
        return const Settings();
      default:
        return const Safe();
    }
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Log',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.lock,
          ),
          label: 'Safe',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (newIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      },
    );
  }
}
