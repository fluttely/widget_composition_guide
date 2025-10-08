import 'package:flutter/material.dart';
import 'package:widget_composition_guide/auth/login/login_page.dart';
import 'package:widget_composition_guide/auth/signup/signup_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _page = 'login';

  void _incrementCounter() {
    setState(() {
      _page = _page == 'login' ? 'signup' : 'login';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('App Name 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Image here'),
            _page == 'login' ? const LoginPage() : const SignUpPage(),
            _page == 'login'
                ? const Text('Login Page 7')
                : const Text('Sign Up Page'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'signup',
        child: const Icon(Icons.add),
      ),
    );
  }
}
