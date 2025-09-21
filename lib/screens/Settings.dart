// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../constants/colors.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   late bool _isDark;

//   @override
//   void initState() {
//     super.initState();
//     _loadTheme();
//   }

//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _isDark = prefs.getBool('isDark') ?? false;
//     });
//   }

//   Future<void> _toggleTheme(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDark', value);
//     // To apply theme change, restart app or use a provider. For simplicity, instruct user to restart.
//     setState(() {
//       _isDark = value;
//     });
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please restart the app to apply theme changes.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
//         child: Column(
//           children: [
//             SwitchListTile(
//               title: Text(
//                 'Dark Mode',
//                 style: TextStyle(color: AppColors.textPrimary(isDark)),
//               ),
//               value: _isDark,
//               onChanged: _toggleTheme,
//             ),
//             // Add more settings here if needed
//           ],
//         ),
//       ),
//     );
//   }
// }