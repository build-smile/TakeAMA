import 'package:flutter/material.dart';

import '../utils/validatefield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  var _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            width: 150,
            height: 150,
            child: Image.asset("assets/images/disabled.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _keyForm,
            child: Column(
              children: [
                ListTile(
                  title: TextFormField(
                    validator: ValidateField.validateString,
                    onSaved: (String? value) {
                      username = value!;
                    },
                    decoration: InputDecoration(
                        labelText: 'Username', hintText: 'Username'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    obscureText: true,
                    validator: ValidateField.validateString,
                    onSaved: (String? value) {
                      password = value!;
                    },
                    decoration: InputDecoration(
                        labelText: 'Password', hintText: 'Password'),
                  ),
                ),
                ListTile(
                  title: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();
                        submit(username, password);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/register'),
            child: Text('Need an Account'),
          )
        ],
      )),
    );
  }

  void submit(username, password) {}
}
