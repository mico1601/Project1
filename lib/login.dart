import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _emailEmpty = false;
  bool _passwordEmpty = false;

  void _login() {
    // TODO: Implement login logic here.
    // TODO: Implement login logic here.
    // Check the rules here.
    // If the rules are met, login the user.
    // Otherwise, show an error message.
    setState(() {
      _emailEmpty = _emailController.text.isEmpty;
      _passwordEmpty = _passwordController.text.isEmpty;
    });
    if (_emailEmpty || _passwordEmpty) {
      // Show an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your email and password.'),
        ),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN SIAKAD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', alignment: Alignment.center),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  errorText: _emailEmpty ? 'Please enter your email.' : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                 errorText: _passwordEmpty ? 'Please enter your password.' : null,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
