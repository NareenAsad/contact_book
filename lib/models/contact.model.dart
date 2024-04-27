class Contact {
  final String name;
  final String number;
  final String? organization;
  bool isFavorite;

  Contact({
    required this.name,
    required this.number,
    this.organization,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'organization': organization,
      'isFavorite': isFavorite,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'] ?? '',
      number: json['number'] ?? '',
      organization: json['organization'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
