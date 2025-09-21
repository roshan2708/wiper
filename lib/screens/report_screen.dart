import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Mock data for reports
    final wipeHistory = [
      {
        'drive': 'Samsung SSD 1TB',
        'method': 'DoD 5220.22-M',
        'date': '2024-09-16',
        'time': '14:32',
        'status': 'Success',
        'duration': '24m 15s',
        'size': '1 TB',
      },
      {
        'drive': 'iPhone Storage',
        'method': 'Quick Wipe',
        'date': '2024-09-15',
        'time': '09:45',
        'status': 'Success',
        'duration': '3m 42s',
        'size': '256 GB',
      },
      {
        'drive': 'USB Drive',
        'method': 'Gutmann Method',
        'date': '2024-09-14',
        'time': '16:20',
        'status': 'Success',
        'duration': '1h 35m',
        'size': '64 GB',
      },
      {
        'drive': 'Seagate HDD',
        'method': 'Factory Reset',
        'date': '2024-09-13',
        'time': '11:18',
        'status': 'Success',
        'duration': '18m 03s',
        'size': '500 GB',
      },
    ];

    final stats = {
      'totalWipes': 47,
      'dataWiped': '12.4 TB',
      'avgTime': '22m',
      'successRate': '98.7%',
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06,
                screenHeight * 0.02,
                screenWidth * 0.06,
                screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: screenWidth * 0.05,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wipe Reports',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'History and statistics',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Export functionality
                    },
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      ),
                      child: Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                        size: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Statistics Cards
                      _buildStatsSection(context, stats, screenWidth, screenHeight),
                      
                      SizedBox(height: screenHeight * 0.03),
                      
                      // Recent Activity Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Activity',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                              letterSpacing: -0.3,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // View all functionality
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: screenHeight * 0.02),
                      
                      // History List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: wipeHistory.length,
                        itemBuilder: (context, index) {
                          final item = wipeHistory[index];
                          return _buildHistoryItem(context, item, screenWidth, screenHeight);
                        },
                      ),
                      
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, Map<String, dynamic> stats, double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics Overview',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total Wipes',
                '${stats['totalWipes']}',
                Icons.analytics_rounded,
                AppColors.secondary,
                screenWidth,
                screenHeight,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: _buildStatCard(
                'Data Wiped',
                stats['dataWiped'],
                Icons.storage_rounded,
                AppColors.accent,
                screenWidth,
                screenHeight,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Avg Duration',
                stats['avgTime'],
                Icons.timer_rounded,
                AppColors.warning,
                screenWidth,
                screenHeight,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: _buildStatCard(
                'Success Rate',
                stats['successRate'],
                Icons.check_circle_rounded,
                AppColors.success,
                screenWidth,
                screenHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: screenWidth * 0.05,
                ),
              ),
              Icon(
                Icons.trending_up_rounded,
                color: AppColors.success,
                size: screenWidth * 0.04,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, Map<String, dynamic> item, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(
          color: AppColors.success.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Status Indicator
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.15),
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: AppColors.success,
              size: screenWidth * 0.06,
            ),
          ),
          
          SizedBox(width: screenWidth * 0.04),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['drive']!,
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.002,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(screenWidth * 0.015),
                      ),
                      child: Text(
                        item['method']!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      '${item['size']} • ${item['duration']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Date and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item['date']!,
                style: TextStyle(
                  fontSize: screenWidth * 0.032,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                item['time']!,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: AppColors.textSecondary.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}