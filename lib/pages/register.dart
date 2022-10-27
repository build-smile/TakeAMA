import 'package:flutter/material.dart';
import 'package:take_ama/models/User.dart';

import '../utils/validatefield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  User user = User();
  String labelFirstName = "First name";
  String labelLastName = "Last name";
  String labelUserName = "User Name";
  String labelPassword = "Password";
  String labelConfirmPassword = "Confirm password";
  String labelEmail = "Email";
  String labelDetail = "Detail";
  String labelBirthday = "Birthday";

  var _keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _keyform,
          child: ListView(
            children: [
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.firstName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelFirstName,
                  hintText: labelFirstName,
                ),
              ),
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.lastName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelLastName,
                  hintText: labelLastName,
                ),
              ),
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.username = value!;
                },
                decoration: InputDecoration(
                  labelText: labelUserName,
                  hintText: labelUserName,
                ),
              ),
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.firstName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelPassword,
                  hintText: labelPassword,
                ),
              ),
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.firstName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelConfirmPassword,
                  hintText: labelConfirmPassword,
                ),
              ),
              TextFormField(
                validator: ValidateField.validateString,
                onSaved: (String? value) {
                  user.firstName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelEmail,
                  hintText: labelEmail,
                ),
              ),
              Memo(labelDetail: labelDetail, user: user),
              TextFormField(
                validator: ValidateField.validateYear,
                onSaved: (String? value) {
                  user.firstName = value!;
                },
                decoration: InputDecoration(
                  labelText: labelBirthday,
                  hintText: labelBirthday,
                ),
              ),
              ListTile(
                title: ElevatedButton(
                  onPressed: _register,
                  child: Text('submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _register() {
    if (_keyform.currentState!.validate()) {}
  }
}

class Memo extends StatelessWidget {
  const Memo({
    Key? key,
    required this.labelDetail,
    required this.user,
  }) : super(key: key);

  final String labelDetail;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Text(labelDetail),
        ),
        TextFormField(
          maxLines: 5,
          validator: ValidateField.validateString,
          onSaved: (String? value) {
            user.firstName = value!;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          ),
        ),
      ],
    );
  }
}
