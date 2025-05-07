import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final qrData = "event123_${user.uid}"; // Example format

    return Scaffold(
      appBar: AppBar(title: const Text('Your QR Code')),
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 250,
        ),
      ),
    );
  }
}
