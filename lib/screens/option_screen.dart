import 'package:flutter/material.dart';
import '../models/drive.dart';
import '../screens/progress_screen.dart';
import '../constants/colors.dart';

class OptionsScreen extends StatelessWidget {
  final Drive drive;
  const OptionsScreen({super.key, required this.drive});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final wipeOptions = [
      {
        'method': 'Quick Wipe',
        'description': 'Fast deletion for basic security',
        'icon': Icons.flash_on_rounded,
        'color': AppColors.success,
      },
      {
        'method': 'DoD 5220.22-M',
        'description': 'Military-grade 3-pass overwrite',
        'icon': Icons.security_rounded,
        'color': AppColors.warning,
      },
      {
        'method': 'Gutmann Method',
        'description': 'Ultimate security with 35 passes',
        'icon': Icons.shield_rounded,
        'color': AppColors.error,
      },
      {
        'method': 'Factory Reset',
        'description': 'Restore to original state',
        'icon': Icons.refresh_rounded,
        'color': AppColors.secondary,
      },
    ];

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
                screenHeight * 0.03,
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
                          'Wipe Options',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          drive.name,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Options List
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: wipeOptions.length,
                  itemBuilder: (context, index) {
                    final option = wipeOptions[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
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
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, _) =>
                                  ProgressScreen(drive: drive, method: option['method'] as String),
                              transitionsBuilder: (context, animation, _, child) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              transitionDuration: const Duration(milliseconds: 250),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(screenWidth * 0.04),
                        leading: Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: (option['color'] as Color).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          ),
                          child: Icon(
                            option['icon'] as IconData,
                            color: option['color'] as Color,
                            size: screenWidth * 0.06,
                          ),
                        ),
                        title: Text(
                          option['method'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            fontSize: screenWidth * 0.045,
                            letterSpacing: -0.2,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.005),
                          child: Text(
                            option['description'] as String,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textSecondary,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}