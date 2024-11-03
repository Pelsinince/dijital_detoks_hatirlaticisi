import 'package:flutter/material.dart';
import 'profile_edit_page.dart'; // Düzenleme sayfası

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Pelsin iNCE';
  String email = 'pelsin@example.com';
  String phone = '+90 555 555 5555';
  String location = 'İstanbul, Türkiye';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Ayarlara gitme işlemi
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.example.com/path-to-your-profile-image.jpg'), // Profil fotoğrafı URL'si
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Project Manager | Software Engineer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blueGrey),
                title: Text(email),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueGrey),
                title: Text(phone),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blueGrey),
                title: Text(location),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Profil düzenleme sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEditPage(
                      name: name,
                      email: email,
                      phone: phone,
                      location: location,
                    ),

                  ),
                ).then((updatedProfile) {
                  if (updatedProfile != null) {
                    setState(() {
                      name = updatedProfile['name'];
                      email = updatedProfile['email'];
                      phone = updatedProfile['phone'];
                      location = updatedProfile['location'];
                    });
                  }
                });
              },
              icon: const Icon(Icons.edit),
              label: const Text('Profili Düzenle'),

              style: ElevatedButton.styleFrom(

                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                backgroundColor: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
