
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Foto profil dengan efek AvatarGlow
            AvatarGlow(
              glowColor: const Color(0xFF8FAF9D),
              glowCount: 2,
              duration: const Duration(seconds: 2),
              repeat: true,
              child: Material(
                elevation: 8,
                shape: const CircleBorder(),
                color: Colors.white,
                child: ClipOval(
                  child: Image.network(
                    'https://i.pravatar.cc/300',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: const Color(0xFFE8E3F3),
                        child: const Icon(
                          Icons.person,
                          size: 65,
                          color: Color(0xFF405B4D),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Nama dan status
            const Text(
              'Nukhi Alvin Rahmahdani',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF405B4D),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Mahasiswa Sistem Informasi',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0EA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '● Aktif',
                style: TextStyle(
                  color: Color(0xFF405B4D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // Informasi profil
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Profil',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF405B4D),
                ),
              ),
            ),

            const SizedBox(height: 15),

            _profileItem(
              Icons.person_outline,
              'Nama Lengkap',
              'Nukhi Alvin Rahmahdani',
            ),

            _profileItem(
              Icons.school_outlined,
              'Program Studi',
              'Sistem Informasi',
            ),

            _profileItem(
              Icons.email_outlined,
              'Email',
              'nukhialvinrahmahdani@saintek.unipdu.ac.id',
            ),

            _profileItem(
              Icons.phone_outlined,
              'Telepon',
              '085732473215',
            ),

            const SizedBox(height: 25),

            // Kartu aplikasi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0EA),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.contacts_rounded,
                    size: 35,
                    color: Color(0xFF405B4D),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aplikasi Daftar Kontak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF405B4D),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kelola dan cari kontak dengan mudah.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk informasi profil
  static Widget _profileItem(
      IconData icon,
      String title,
      String value,
      ) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF8FAF9D),
          size: 27,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF405B4D),
          ),
        ),
      ),
    );
  }
}
