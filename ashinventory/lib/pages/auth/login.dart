import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Using theme's scaffoldBackgroundColor
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        body: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400
        ),
        child: Card(
          // Using theme's cardTheme for shape and elevation
          shape: Theme.of(context).cardTheme.shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back!!!',
                  // Using theme's textTheme for headlineSmall and applying a color
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          // Using theme's inputDecorationTheme for border, labelStyle, and prefixIconColor
                          border: Theme.of(context).inputDecorationTheme.border ??
                              const OutlineInputBorder(),
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      FormTextField(
                        controller: _passwordController,
                        obscureText: true,
                        hassuffixIcon: true,
                        labelText: 'Unique Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your access level password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Using theme's colorScheme for primary color
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
