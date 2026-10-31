
import 'package:faker/faker.dart';
import '../models/contact_model.dart';

final faker = Faker();

final List<String> categories = [
  'Keluarga',
  'Teman',
  'Kerja',
];

List<Contact> generateContacts() {
  return List.generate(20, (index) {
    return Contact(
      name: faker.person.name(),
      phone: faker.phoneNumber.us(),
      email: faker.internet.email(),
      category: categories[index % categories.length],
      addedAt: DateTime.now().subtract(
        Duration(days: index * 3),
      ),
    );
  });
}
