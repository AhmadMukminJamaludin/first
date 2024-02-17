import 'package:dio/dio.dart';
import 'package:first/homepage.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Formulir extends StatefulWidget {
  const Formulir({super.key});

  @override
  State<Formulir> createState() => _FormulirState();
}

class _FormulirState extends State<Formulir> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await dio.post('https://sispadu-plesungan.my.id/api/login', data: {
        'email': _emailController.text,
        'password': _passwordController.text,
      });
      setState(() {
        _isLoading = true;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homePage()));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Ganti dengan path ke gambar Anda
                  width: 150, // Atur lebar gambar sesuai kebutuhan
                  height: 150, // Atur tinggi gambar sesuai kebutuhan
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (!_isLoading) login();
                    }
                  },
                  child: _isLoading
                      ? CircularProgressIndicator() // Menampilkan CircularProgressIndicator saat isLoading true
                      : Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,
                        50), // Lebar button diatur ke ukuran maksimum layar
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
