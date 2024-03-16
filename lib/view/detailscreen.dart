import 'package:example_sharedpreference/controller/provider/providermanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        centerTitle: true,
        title: Text('Contact Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.pink,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                ' ${contact.name}',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Mobile: ${contact.number}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Organization: ${contact.organization ?? ''}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.phone, color: Colors.white),
                Icon(Icons.messenger, color: Colors.white),
                Icon(Icons.camera_outdoor_rounded, color: Colors.white),
              ],
            ),
            SizedBox(height: 80),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final isFavorite = !contact.isFavorite;
                  Provider.of<ContactProvider>(context, listen: false)
                      .toggleFavorite(contact, isFavorite);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                child: Text(
                    contact.isFavorite
                        ? 'Remove from Favorites'
                        : 'Add to Favorites',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
