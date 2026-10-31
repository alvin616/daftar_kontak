
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../data/contact_data.dart';
import '../models/contact_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedCategory;
  late List<Contact> contacts;

  @override
  void initState() {
    super.initState();
    contacts = generateContacts();
  }

  @override
  Widget build(BuildContext context) {
    final filteredContacts = selectedCategory == null
        ? <Contact>[]
        : contacts
        .where((contact) =>
    contact.category == selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Kontak',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Kategori Kontak',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF405B4D),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Cari kontak berdasarkan kategori.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Dropdown kategori
            DropdownSearch<String>(
              items: (filter, loadProps) {
                return categories
                    .where((item) => item
                    .toLowerCase()
                    .contains(filter.toLowerCase()))
                    .toList();
              },

              selectedItem: selectedCategory,

              popupProps: PopupProps.menu(
                showSearchBox: true,
                fit: FlexFit.loose,
                constraints: const BoxConstraints(
                  maxHeight: 250,
                ),
              ),

              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  hintText: 'Pilih kategori kontak',
                  prefixIcon: const Icon(
                    Icons.category_rounded,
                    color: Color(0xFF8FAF9D),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFF8FAF9D),
                    ),
                  ),
                ),
              ),

              onSelected: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 25),

            // Hasil pencarian
            if (selectedCategory != null) ...[
              Text(
                'Hasil: $selectedCategory',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF405B4D),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '${filteredContacts.length} kontak ditemukan',
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = filteredContacts[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFE8E3F3),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF405B4D),
                          ),
                        ),
                        title: Text(
                          contact.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(contact.phone),
                      ),
                    );
                  },
                ),
              ),
            ] else
              const Expanded(
                child: Center(
                  child: Text(
                    'Silakan pilih kategori kontak.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

