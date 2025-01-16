import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/provider/cv_provider.dart';
import 'package:jobbazar_mobile/deprecated/appbar.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/drawer.dart';
import 'package:jobbazar_mobile/shared/page_appbar.dart';
import 'package:jobbazar_mobile/shared/theme/employee/employee_gradient.dart';
import 'package:jobbazar_mobile/shared/util/heading/heading_text.dart';
import 'package:provider/provider.dart';

class CvPage extends StatefulWidget {
  @override
  _CvPageState createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  String name = "";
  String email = "";
  String phone = "";
  String location = "";
  String skills = "";
  String experience = "";
  String degree = "";
  String institute = "";
  String passingYear = "";
  String cgpa = "";

  final _formKey = GlobalKey<FormState>();

  void _updateCv() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CV updated successfully')),
      );
    }
  }

  void _deleteCv() {
    setState(() {
      name = "";
      email = "";
      phone = "";
      location = "";
      skills = "";
      experience = "";
      degree = "";
      institute = "";
      passingYear = "";
      cgpa = "";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('CV deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cvProvider = Provider.of<CvProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    cvProvider.fetchCv(authProvider.currentUser!.id).whenComplete(() {
      name = cvProvider.currentUserCv?.name ?? "";
      email = cvProvider.currentUserCv?.email ?? "";
      phone = cvProvider.currentUserCv?.phone.toString() ?? "";
      location = cvProvider.currentUserCv?.location ?? "";
      skills = cvProvider.currentUserCv?.skills ?? "";
      experience = cvProvider.currentUserCv?.experience.toString() ?? "";
      degree = cvProvider.currentUserCv?.degree ?? "";
      institute = cvProvider.currentUserCv?.institute ?? "";
      passingYear = cvProvider.currentUserCv?.passingYear.toString() ?? "";
      cgpa = cvProvider.currentUserCv?.cgpa.toString() ?? "";
    });
    return Scaffold(
      appBar: const PageAppbar(title: "Your CV"),
      bottomNavigationBar: const BottomNav(),
      drawer: const AppDrawer(),
      body: name.isEmpty
          ? const Center(
              child: Text(
                'No CV available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Container(
            decoration: employeeDecoration,
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      // floatingLabelAlignment: FloatingLabelAlignment.center,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                    onSaved: (value) => name = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                    onSaved: (value) => email = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your phone number'
                        : null,
                    onSaved: (value) => phone = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: location,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your location'
                        : null,
                    onSaved: (value) => location = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: skills,
                    decoration: InputDecoration(
                      labelText: 'Skills',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your skills' : null,
                    onSaved: (value) => skills = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: experience,
                    decoration: InputDecoration(
                      labelText: 'Years Of Experience',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your experience' : null,
                    onSaved: (value) => experience = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: degree,
                    decoration: InputDecoration(
                      labelText: 'Degree',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your degree' : null,
                    onSaved: (value) => degree = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: institute,
                    decoration: InputDecoration(
                      labelText: 'Institute',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your institute' : null,
                    onSaved: (value) => institute = value!,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: passingYear,
                    decoration: InputDecoration(
                      labelText: 'Passing Year',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your passing year'
                        : null,
                    onSaved: (value) => passingYear = value!,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: cgpa,
                    decoration: InputDecoration(
                      labelText: 'CGPA',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      isDense: true
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your CGPA' : null,
                    onSaved: (value) => cgpa = value!,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _updateCv,
                          style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          backgroundColor: const Color.fromARGB(223, 233, 164, 60),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Update CV', style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      ElevatedButton(
                        onPressed: () {}, 
                        child: const Text("Upload CV File")
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.withOpacity(0.4),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete, size: 40, color: Colors.red),
                          splashRadius: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }
}
