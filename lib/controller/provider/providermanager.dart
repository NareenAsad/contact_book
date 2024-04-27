import 'dart:convert';

import 'package:example_sharedpreference/models/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contacts = [];
  final String _prefsKey = 'contacts';

  ContactProvider() {
    _loadContacts();
  }

  List<Contact> getContacts() {
    return _contacts;
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    _saveContacts();
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    _saveContacts();
    notifyListeners();
  }

  void toggleFavorite(Contact contact, bool isFavorite) {
    final index = _contacts.indexOf(contact);
    _contacts[index].isFavorite = isFavorite;
    _saveContacts();
    notifyListeners();
  }

  void _loadContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? contactsJson = prefs.getStringList(_prefsKey);

    if (contactsJson != null) {
      _contacts = contactsJson
          .map((json) =>
              Contact.fromJson(Map<String, dynamic>.from(jsonDecode(json))))
          .toList();
      notifyListeners();
    }
  }

  void _saveContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> contactsJson =
        _contacts.map((contact) => jsonEncode(contact.toJson())).toList();
    prefs.setStringList(_prefsKey, contactsJson);
  }
}
