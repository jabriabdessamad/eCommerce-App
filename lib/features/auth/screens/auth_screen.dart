import 'package:e_commerce_app/common/widgets/customTextField.dart';
import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/authScreen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            ListTile(
              title: const Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: Colors.black,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) => setState(() {
                  _auth = val!;
                }),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signInFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: _emailController, hintText: "Email"),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Password",
                    )
                  ]),
                ),
              ),
            ListTile(
              title: const Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: Colors.black,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) => setState(() {
                  _auth = val!;
                }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
