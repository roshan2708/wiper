// import 'package:flutter/material.dart';
// import 'package:the_wipher/models/WipeHistory.dart';
// import 'package:the_wipher/services/HistoryService.dart';
// import '../constants/colors.dart';

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});

//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   late Future<List<WipeHistory>> _historyFuture;

//   @override
//   void initState() {
//     super.initState();
//     _historyFuture = HistoryService.getHistory();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wipe History'),
//       ),
//       body: FutureBuilder<List<WipeHistory>>(
//         future: _historyFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No history available'));
//           } else {
//             final historyList = snapshot.data!;
//             return ListView.builder(
//               padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
//               itemCount: historyList.length,
//               itemBuilder: (context, index) {
//                 final history = historyList[index];
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
//                   decoration: BoxDecoration(
//                     color: AppColors.cardBackground(isDark),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: AppColors.accent(isDark).withOpacity(0.2)),
//                   ),
//                   child: ListTile(
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: MediaQuery.of(context).size.width * 0.04,
//                       vertical: MediaQuery.of(context).size.height * 0.01,
//                     ),
//                     title: Text(
//                       history.driveName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.textPrimary(isDark),
//                       ),
//                     ),
//                     subtitle: Text(
//                       '${history.method} - ${history.date.toLocal()}',
//                       style: TextStyle(color: AppColors.textSecondary(isDark)),
//                     ),
//                     trailing: Text(
//                       history.status,
//                       style: TextStyle(color: AppColors.success(isDark)),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }