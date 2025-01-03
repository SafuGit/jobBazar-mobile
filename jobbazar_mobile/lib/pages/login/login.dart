
import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:jobbazar_mobile/shared/util/hyperlink_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/037/814/719/small_2x/ai-generated-autumn-leaves-in-the-forest-nature-background-photo.jpg"),
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
                    const Text("Login", style: TextStyle(fontSize: 50),),
                    Column(
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
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Colors.lightBlueAccent)
                          ),
                          child: const Text("Submit"),
      
                          onPressed: () async {
                            final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
                            String username = usernameController.text.trim(); // Get username from controller
                            String password = passwordController.text.trim(); // Get password from controller
                            try {
                              await authProvider.login(username, password);
                              debugPrint("$authProvider.isAuthenticated");
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login failed: ${e.toString()}')),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    HyperlinkText(
                      text: "Dont have an Account?",
                      onTap: () => {
                        Navigator.pushNamed(context, '/register')
                      },
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}