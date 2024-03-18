import 'package:example_sharedpreference/view/contactlist_view.dart';
import 'package:example_sharedpreference/view/contactscreen.dart';
import 'package:example_sharedpreference/view/favscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ContactList(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        centerTitle: true,
        title: Text('Contact Book',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddContactScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: Colors.pink),
            label: 'Numbers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.pink),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
