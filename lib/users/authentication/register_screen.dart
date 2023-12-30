import 'package:clothes_store/project_settings/project_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20.0), // Ovalleştirme için radius değeri
                  child: Image.asset(
                    "assets/images/register.png",
                    fit: BoxFit
                        .cover, // Resmi container'a sığdırmak için uygun ölçekte ayarlama
                  ),
                ),
                Form(
                    child: Column(
                  children: [
                    SizedBox(height: Get.size.height * 0.03),
                    _registerUserTextField(ProjectText.registerUserNameText),
                    SizedBox(height: Get.size.height * 0.03),
                    _registerMailTextField(ProjectText.registerMailText),
                    SizedBox(height: Get.size.height * 0.03),
                    _registerPasswordTextField(
                        ProjectText.registerPasswordText),
                    SizedBox(height: Get.size.height * 0.03),
                    _buildRegisterButton(),
                  ],
                ))
              ],
            ),
          ),
        ));
  }

  Widget _registerUserTextField(String text) {
    return Material(
      color: Colors.blue[50],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(300),
            topLeft: Radius.circular(300),
            bottomRight: Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: userController,
          validator: (value) =>
              value == '' ? 'Lütfen Kullanıcı Adı Giriniz' : null,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_outline),
            border: InputBorder.none,
            label: Text(text),
          ),
        ),
      ),
    );
  }

  Widget _registerMailTextField(String text) {
    return Material(
      color: Colors.blue[50],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          controller: emailController,
          validator: (value) =>
              value == '' ? 'Lütfen Mail Adresi Giriniz' : null,
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

  Widget _registerPasswordTextField(String text) {
    return Material(
      color: Colors.blue[50],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(300),
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(300)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          controller: passwordController,
          validator: (value) => value == '' ? 'Lütfen Şifre Giriniz' : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key_outlined),
            border: InputBorder.none,
            label: Text(text),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildRegisterButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
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
}
