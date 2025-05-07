import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  void checkInUser(String eventId, String userId) async {
    final eventRef = FirebaseFirestore.instance.collection('events').doc(eventId);
    await eventRef.update({
      'checkedIn': FieldValue.arrayUnion([userId]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR')),
      body: MobileScanner(
        onDetect: (capture) {
          final code = capture.barcodes.first.rawValue ?? '';
          final parts = code.split('_');
          if (parts.length == 2) {
            checkInUser(parts[0], parts[1]);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Check-in successful!')),
            );
          }
        },
      ),
    );
  }
}
