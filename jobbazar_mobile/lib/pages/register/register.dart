import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/shared/util/hyperlink_text.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController roleController = TextEditingController();

    return Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage("https://img.freepik.com/premium-photo/yellow-blue-abstract-creative-background-blue-abstract-background-geometric-background_481527-27945.jpg"),
            fit: BoxFit.cover 
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        width: double.infinity,
        child: Center(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Register", style: TextStyle(fontSize: 50),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "I am looking for:",
                          style: TextStyle(fontSize: 20, color: Colors.teal),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: DropdownButtonFormField<String>(
                            value: roleController.text.isEmpty ? null : roleController.text,
                            items: const [
                              DropdownMenuItem(
                                value: "USER",
                                child: Text("A Job"),
                              ),
                              DropdownMenuItem(
                                value: "EMPLOYER",
                                child: Text("Employees/Staff"),
                              ),
                            ],
                            onChanged: (value) {
                              roleController.text = value ?? "";
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Select Role",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Name here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Phone Number", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Phone Number here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Email here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Password here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () async {
                            final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
                            String username = usernameController.text.trim(); // Get username from controller
                            String password = passwordController.text.trim(); // Get password from controller
                            String phone = phoneController.text.trim(); // Get password from controller
                            String name = nameController.text.trim(); // Get password from controller
                            String role = roleController.text.trim(); 

                            Map<String, dynamic> data = {
                              "name": name,
                              "username": username,
                              "password": password,
                              "phone_number": phone,
                              "role": role
                            };
                            try {
                              await authProvider.register(data);
                              debugPrint("$authProvider.isAuthenticated");
                              Navigator.pushReplacementNamed(context, '/login');
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registration failed: ${e.toString()}')),
                              );
                            }
                          },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.lightBlueAccent)
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                  ),

                HyperlinkText(
                  text: "Already Registered?",
                  onTap: () => {
                    Navigator.pushNamed(context, '/login')
                  },
                )
                ],
              ),
            ),
          ),
        )
    );
  }
}