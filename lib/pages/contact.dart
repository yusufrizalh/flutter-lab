import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlab/pages/components/custom_form_field.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 12)),
            const Text(
              "Enter Your Identity",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            CustomFormField(
              hintText: "Enter your fullname",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
              ],
              validator: (val) {
                if (!val!.isValidName) return "Enter valid name!";
              },
            ),
            CustomFormField(
              hintText: "Enter your email address",
              validator: (val) {
                if (!val!.isValidEmail) return "Enter valid email address!";
              },
            ),
            CustomFormField(
              hintText: "Enter your phone number",
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[0-9]"),
                )
              ],
              validator: (val) {
                if (!val!.isValidPhone) {
                  return 'Minimal 10 & Maximal 12 Digits!';
                }
              },
            ),
            CustomFormField(
                hintText: "Enter your password",
                validator: (val) {
                  if (!val!.isValidPassword) {
                    return "Minimal 8 & Maximal 16 Characters!";
                  }
                }),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  debugPrint("Success!");
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
