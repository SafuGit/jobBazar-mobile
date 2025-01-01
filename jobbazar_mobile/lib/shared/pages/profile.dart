import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Colors.blue[300], // Background color
      body: Center(
        child: Container(
          width: 350, // Card width
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
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150', // Replace with the actual image URL
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Safwan Sadid',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Phone
              const Row(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Phone - 5425475544778',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Email
              const Row(
                children: [
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Email - safu@yahoo.com',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16),
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
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.photo),
                    label: const Text('Change Picture'),
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