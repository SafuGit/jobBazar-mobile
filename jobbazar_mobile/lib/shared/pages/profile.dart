import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/auth_provider.dart';
import 'package:jobbazar_mobile/shared/appbar.dart';
import 'package:jobbazar_mobile/shared/bottom_nav.dart';
import 'package:jobbazar_mobile/shared/pages/args/profile_args.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileArgs args = (ModalRoute.of(context)?.settings.arguments as ProfileArgs?) ?? ProfileArgs(theme: Theme.of(context));

    debugPrint("${args.theme?.primaryColor}");
    final authProvider = Provider.of<AuthProvider>(context);
    return Theme(
      data: args.theme ?? Theme.of(context),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: SharedAppBar(title: "Profile", color: Theme.of(context).colorScheme.primary),
            backgroundColor: args.theme?.colorScheme.secondary ?? Theme.of(context).colorScheme.secondary, // Background color
            bottomNavigationBar: const BottomNav(),
            body: Center(
              child: Container(
                width: 350, // Card width
                height: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture and Name
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'http://10.0.2.2:8080/api/uploads/pfp/${authProvider.currentUser?.id}', // Replace with the actual image URL
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${authProvider.currentUser?.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
          
                    // Phone
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          'Phone - ${authProvider.currentUser?.phone}',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
          
                    // Email
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          'Email - ${authProvider.currentUser?.email}',
                          style: const TextStyle(color: Colors.lightBlue, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
          
                    // Password
                    const Row(
                      children: [
                        Icon(Icons.lock, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Password - #\$%!\$',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
          
                    // Buttons
                    // TODO - Implement the buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          icon: const Icon(Icons.edit, color: Colors.white,),
                          label: const Text('Edit Profile', style: TextStyle(color: Colors.white),),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          icon: const Icon(Icons.photo, color: Colors.white,),
                          label: const Text('Change Picture', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}