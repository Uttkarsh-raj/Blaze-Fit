import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../api/user/user.dart';
import '../../utils/utils.dart';
import '../AuthPage/main_auth.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool sugar = false;
  bool smoking = false;
  bool drinking = false;
  List<String> cases = [];
  List<String> courts = [];
  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    nameController = TextEditingController(text: user?.displayName ?? "");
    emailController = TextEditingController(text: user?.email ?? "");
    contactController = TextEditingController(text: user?.phoneNumber ?? "");
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    emailController.dispose();
    ageController.dispose();
    contactController.dispose();
    heightController.dispose();
    weightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Form',
          style: TextStyle(
            // color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  heightController.text.isNotEmpty &&
                  weightController.text.isNotEmpty &&
                  ageController.text.isNotEmpty &&
                  heightController.text.isNotEmpty &&
                  weightController.text.isNotEmpty &&
                  ageController.text.isNotEmpty &&
                  genderController.text.isNotEmpty) {
                print('register');
                UserApiHandler.registerUser(
                  nameController.text.toString().trim(),
                  emailController.text.toString().trim(),
                  contactController.text.toString().trim(),
                  user!.photoURL.toString().trim(),
                  heightController.text.toString().trim(),
                  weightController.text.toString().trim(),
                  genderController.text.toString().trim(),
                  ageController.text.toString().trim(),
                  sugar,
                  smoking,
                  drinking,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MainAuthPage(),
                  ),
                );
              } else {
                showSnackBar(context, 'Please fill all the details !!');
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    // color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormFields(
                controller: nameController,
                title: 'Name',
                hint: (nameController.text.isEmpty) ? 'Name' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: emailController,
                title: 'Email',
                hint: (emailController.text.isEmpty) ? 'Email' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: contactController,
                title: 'Contact',
                hint: (contactController.text.isEmpty) ? 'Contact' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: heightController,
                title: 'Height',
                hint: (heightController.text.isEmpty) ? 'Height' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: weightController,
                title: 'Weight',
                hint: (weightController.text.isEmpty) ? 'Weight' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: ageController,
                title: 'Age',
                hint: (ageController.text.isEmpty) ? 'Age' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: genderController,
                title: 'Gender',
                hint: (genderController.text.isEmpty) ? 'Gender' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: sugar,
                    onChanged: (value) {
                      setState(() {
                        sugar = !sugar;
                      });
                    },
                  ),
                  const Text(
                    'Diabetic',
                    style: TextStyle(
                      // color: AppColorsConstants.tertiaryBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: smoking,
                    onChanged: (value) {
                      setState(() {
                        smoking = !smoking;
                      });
                    },
                  ),
                  const Text(
                    'Smoking',
                    style: TextStyle(
                      // color: AppColorsConstants.tertiaryBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: drinking,
                    onChanged: (value) {
                      setState(() {
                        drinking = !drinking;
                      });
                    },
                  ),
                  const Text(
                    'Drinking',
                    style: TextStyle(
                      // color: AppColorsConstants.tertiaryBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddElementDialog extends StatefulWidget {
  final Function(String) onAdd;

  const AddElementDialog({super.key, required this.onAdd});

  @override
  _AddElementDialogState createState() => _AddElementDialogState();
}

class _AddElementDialogState extends State<AddElementDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Element'),
      content: TextFormField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          labelText: 'Element',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String element = _textEditingController.text.trim();
            if (element.isNotEmpty) {
              widget.onAdd(element);
            }
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
