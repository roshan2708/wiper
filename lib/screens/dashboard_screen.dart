import 'package:flutter/material.dart';
import '../models/drive.dart';
import '../widgets/drive_card.dart';
import '../constants/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockDrives = [
      Drive(name: 'Samsung SSD 1TB', type: 'SSD', size: '1 TB'),
      Drive(name: 'Seagate HDD 500GB', type: 'HDD', size: '500 GB'),
      Drive(name: 'My Phone', type: 'Android', size: '128 GB'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Wipe Dashboard'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        itemCount: mockDrives.length,
        itemBuilder: (context, index) => DriveCard(drive: mockDrives[index]),
      ),
    );
  }
}