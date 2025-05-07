import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final locationController = TextEditingController();

    void createEvent() async {
      await FirebaseFirestore.instance.collection('events').add({
        'name': nameController.text.trim(),
        'location': locationController.text.trim(),
        'createdBy': FirebaseAuth.instance.currentUser!.uid,
        'attendees': [],
        'checkedIn': [],
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Event Name')),
            TextField(controller: locationController, decoration: const InputDecoration(labelText: 'Location')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: createEvent, child: const Text('Create')),
          ],
        ),
      ),
    );
  }
}
