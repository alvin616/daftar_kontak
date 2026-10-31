
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/contact_data.dart';
import '../models/contact_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late List<Contact> contacts;

  @override
  void initState() {
    super.initState();
    contacts = generateContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Kontak',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: Text(
              'Semua Kontak',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF405B4D),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${contacts.length} kontak tersimpan',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];

                return Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xFFE8E3F3),
                          child: Text(
                            contact.name.isNotEmpty
                                ? contact.name[0].toUpperCase()
                                : '?',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF405B4D),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF405B4D),
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                contact.phone,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),

                              const SizedBox(height: 3),

                              Text(
                                contact.email,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 7),

                              Text(
                                'Ditambahkan pada: ${DateFormat('dd MMMM yyyy', 'id_ID').format(contact.addedAt)}',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF8FAF9D),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F0EA),
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                                child: Text(
                                  contact.category,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF405B4D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
