import 'dart:math';

import 'package:ashinventory/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isLoading = false;

  void _togglePasswordView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login process (You should replace this with your actual login logic)
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to the next screen after successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // sizes of the screen at any point in time:
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            // to center the card on the screen, use padding based on screen size:
            max(16, (screenWidth - 400) / 2), // left padding
            max(16, (screenHeight - 400) / 3), // top padding
            max(16, (screenWidth - 400) / 2), // right padding
            0, // bottom padding (optional)
          ),
          child: Card(
            shape: RoundedRectangleBorder(  
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login to Inventory System',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // TextFormField(
                        //   controller: _usernameController,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Username',
                        //     prefixIcon: Icon(Icons.person),
                        //     border: OutlineInputBorder(),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Please enter your username';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        //const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordHidden,
                          decoration: InputDecoration(
                            labelText: 'Unique Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordView,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your access level password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey[700],
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('Login'),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Forgot password action
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
