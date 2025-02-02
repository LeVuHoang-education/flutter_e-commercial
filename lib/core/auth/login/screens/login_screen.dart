import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loginForm(),
      ),
    );
  }

    Widget _loginForm() {
      return Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ),
      );
    }

    Widget _emailField() {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          iconColor: Colors.teal,
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) => null,
      );
    }

    Widget _passwordField() {
      return TextFormField(
        obscuringCharacter: '*',
        decoration: const InputDecoration(
          icon: Icon(Icons.lock),
          iconColor: Colors.teal,
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
        obscureText: true,
        validator: (value) => null,
      );
    }

    Widget _loginButton() {
      return ElevatedButton(
        onPressed: () {},
        child: const Text('Login'),
      );
    }
}