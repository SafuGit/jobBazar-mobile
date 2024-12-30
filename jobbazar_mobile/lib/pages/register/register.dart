import 'package:flutter/material.dart';

// TODO: NEED TO WORK ON THE REGISTER PAGE

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Name here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Phone Number here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Type your Email here"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password", style: TextStyle(fontSize: 20),),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextField(
                            decoration: InputDecoration(
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
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Processing Content"))
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.lightBlueAccent)
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}