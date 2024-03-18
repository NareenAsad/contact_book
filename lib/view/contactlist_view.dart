import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_sharedpreference/controller/provider/providermanager.dart';
import 'package:example_sharedpreference/view/detailscreen.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    final contacts = contactProvider.getContacts();

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                title: Text(contacts[index].name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<ContactProvider>(context, listen: false)
                        .removeContact(contacts[index]);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ContactDetailScreen(contact: contacts[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
