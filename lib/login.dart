import 'package:flutter/material.dart';
import 'package:tubes_lomboknation/register.dart';

import 'auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                authServices.signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text, context);
              },
            ),
            RaisedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registerPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
