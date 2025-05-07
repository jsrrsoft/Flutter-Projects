import 'package:flutter/material.dart';
import 'create_event_screen.dart';
import 'qr_code_screen.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Create Event'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateEventScreen()),
              ),
            ),
            ElevatedButton(
              child: const Text('My QR Code'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QRCodeScreen()),
              ),
            ),
            ElevatedButton(
              child: const Text('Scan QR (Check-In)'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ScannerScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
