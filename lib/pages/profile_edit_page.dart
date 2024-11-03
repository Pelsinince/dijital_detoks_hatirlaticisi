import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String location;

  ProfileEditPage({required this.name, required this.email, required this.phone, required this.location});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    locationController = TextEditingController(text: widget.location);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void saveProfile() {
    Navigator.pop(context, {
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'location': locationController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profili Düzenle'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Telefon'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Lokasyon'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: saveProfile,
              child: const Text('Kaydet'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),

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
