import 'package:first_flutter_project/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'shopping_page.dart';

class SignupPage extends StatefulWidget {
  // make changelang future function to handel التغير المفاجئ في اللغه
  final Future<void> Function() changeLang;
  const SignupPage({super.key, required this.changeLang});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hiddenPass = true;
  bool hiddenConfirmPass = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void togglePassword() {
    setState(() {
      hiddenPass = !hiddenPass;
    });
  }

  void toggleConfirmPassword() {
    setState(() {
      hiddenConfirmPass = !hiddenConfirmPass;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(tr('success')),
          content: Text(tr('accountCreatedSuccessfully')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return ShoppingPage(changeLang: widget.changeLang);
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            ),
                            child: child,
                          );
                        },
                  ),
                );
              },
              child: Text(
                tr('ok'),
                style: TextStyle(
                  color: accentPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  InputDecoration formStyle = InputDecoration(
    labelStyle: TextStyle(fontSize: 14),
    floatingLabelStyle: TextStyle(
      color: accentPink,
      fontWeight: FontWeight.w500,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: accentPink, width: 2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextButton.icon(
                onPressed: () async {
                  await widget.changeLang();
                  // after this start validator again
                  _formKey.currentState?.validate();
                },
                icon: Icon(Icons.language, size: 23, color: accentPink),
                label: Text(
                  tr('changeLang'),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),

            // Logo Image
            Image.asset(
              'assets/images/logo.png',
              width: screenWidth * 0.7,
              height: screenWidth * 0.4,
            ),

            // Form Fields & Sign Up Button
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    tr('createNewAccount'),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 25),

                  TextFormField(
                    cursorColor: Colors.black54,
                    controller: fullNameController,
                    decoration: formStyle.copyWith(
                      label: Text(tr('fullName')),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return tr('fullNameRequired');
                      }

                      if (value[0] != value[0].toUpperCase()) {
                        return tr('firstLetterCapital');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.emailAddress,
                    decoration: formStyle.copyWith(
                      label: Text(tr('email')),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return tr('emailRequired');
                      }

                      if (!value.contains('@')) {
                        return tr('emailMustContainAt');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    cursorColor: Colors.black54,
                    controller: _passwordController,
                    obscureText: hiddenPass,
                    decoration: formStyle.copyWith(
                      label: Text(tr('pass')),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hiddenPass ? Icons.visibility : Icons.visibility_off,
                          color: accentPink,
                        ),
                        onPressed: togglePassword,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return tr('passwordRequired');
                      }
                      if (value.length < 6) {
                        return tr('passwordMinLength');
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    cursorColor: Colors.black54,
                    controller: _confirmPasswordController,
                    obscureText: hiddenConfirmPass,
                    decoration: formStyle.copyWith(
                      label: Text(tr('confirmPass')),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hiddenConfirmPass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: accentPink,
                        ),
                        onPressed: toggleConfirmPassword,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return tr('confirmPasswordRequired');
                      }

                      if (value != _passwordController.text) {
                        return tr('passwordsDoNotMatch');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _createAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        tr('signUp'),
                        textAlign: .center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
