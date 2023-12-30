import 'package:clothes_store/project_settings/project_color.dart';
import 'package:clothes_store/project_settings/project_text.dart';
import 'package:clothes_store/users/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectText.loginAppbarText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              _loginUserTextField(ProjectText.loginUserName),
              SizedBox(height: Get.size.height * 0.03),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      _loginPasswordTextField(ProjectText.loginPassword),
                      SizedBox(height: Get.size.height * 0.03),
                      _buildLoginButton(),
                      SizedBox(height: Get.size.height * 0.03),
                    ],
                  )),
              GestureDetector(
                child: _registerText(),
                onTap: () {
                  Get.to(const RegisterScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      ProjectText.registerText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ProjectColors.registerTextColor,
        decoration: TextDecoration.underline,
      ),
    );
  }

  ElevatedButton _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.loginButtonColor,
      ),
      onPressed: () {
        // Add login button pressed logic here
      },
      child: Text(
        ProjectText.loginButtonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _loginPasswordTextField(String text) {
    return Material(
      color: Colors.blue[50],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(300),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(300)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          controller: passwordController,
          validator: (value) => value == '' ? 'Lütfen Şifre Giriniz' : null,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password_outlined),
            border: InputBorder.none,
            label: Text(text),
          ),
        ),
      ),
    );
  }

  Widget _loginUserTextField(String text) {
    return Material(
      color: Colors.blue[50],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(300),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(300)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          controller: usernameController,
          validator: (value) =>
              value == '' ? 'Lütfen Kullanıcı Adını Giriniz' : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email_outlined),
            border: InputBorder.none,
            label: Text(text),
          ),
        ),
      ),
    );
  }
}
