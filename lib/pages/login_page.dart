import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _buttonScale;
  bool isLoading = false; // Loading state variable

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.9,
      upperBound: 1.0,
    );
    _buttonScale = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Start loading
      setState(() {
        isLoading = true;
      });

      // Simulate a delay (e.g., for network request)
      Future.delayed(const Duration(seconds: 2), () {
        // Stop loading and navigate to main screen
        setState(() {
          isLoading = false; // Stop loading
        });
        Navigator.pushReplacementNamed(context, '/main');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun.')),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black45,
      ),
      body: isLoading
          ? _buildLoadingScreen()
          : _buildLoginForm(),
    );
  }

  Widget _buildLoadingScreen() => const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(
            'Farkına varmaya hazır mısın! \nLütfen bekleyin...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

  Widget _buildLoginForm() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dijital farkındalık görseli
            Container(
              height: 180,
              width: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('pages/img.png'), // Ensure this asset is included in your pubspec.yaml
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.only(bottom: 40), // Space below the image
            ),

            // E-posta alanı
            _buildTextField(
              controller: emailController,
              label: 'E-posta',
              icon: Icons.email,
              obscureText: false,
            ),
            const SizedBox(height: 20),

            // Şifre alanı
            _buildTextField(
              controller: passwordController,
              label: 'Şifre',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 30),

            // Giriş butonu
            ScaleTransition(
              scale: _buttonScale,
              child: ElevatedButton(
                onPressed: () {
                  _animationController.forward().then((_) {
                    _animationController.reverse();
                    login();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                'Hesabınız yok mu? Kayıt olun.',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obscureText,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
        obscureText: obscureText,
      ),
    );
  }
}
