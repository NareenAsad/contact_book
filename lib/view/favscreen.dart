import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_sharedpreference/controller/provider/providermanager.dart';
import 'package:example_sharedpreference/view/detailscreen.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    final favoriteContacts = contactProvider
        .getContacts()
        .where((contact) => contact.isFavorite)
        .toList();

    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: favoriteContacts.isEmpty
          ? Center(
              child: Text(
                'No favorite contacts yet!',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoriteContacts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Text(favoriteContacts[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ContactDetailScreen(
                            contact: favoriteContacts[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
