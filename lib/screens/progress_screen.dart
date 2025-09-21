import 'package:flutter/material.dart';
import 'package:the_wipher/screens/CertificateScreen.dart';
import '../models/drive.dart';
import '../constants/colors.dart';

class ProgressScreen extends StatefulWidget {
  final Drive drive;
  final String method;
  const ProgressScreen({super.key, required this.drive, required this.method});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen>
    with TickerProviderStateMixin {
  double progress = 0;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    _pulseController.repeat(reverse: true);
    _simulateProgress();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _simulateProgress() async {
  for (int i = 0; i <= 100; i += 2) {
    await Future.delayed(const Duration(milliseconds: 150));
    if (mounted) {
      setState(() => progress = i / 100);
    }
  }
  if (mounted) {
    _pulseController.stop();
    // Navigate to CertificateScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CertificateScreen(
          drive: widget.drive,
          method: widget.method,
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isComplete = progress >= 1.0;
    child: Text(
  isComplete ? 'Show Certificate' : 'Processing...',
  style: TextStyle(
    color: Colors.white,
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  ),
);

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
                0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: isComplete ? () => Navigator.pop(context) : null,
                    child: Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        color: isComplete ? AppColors.surface : AppColors.disabled.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: screenWidth * 0.05,
                        color: isComplete ? AppColors.textPrimary : AppColors.disabled,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isComplete ? 'Wiping Complete' : 'Wiping in Progress',
                          style: TextStyle(
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          widget.drive.name,
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
            
            // Progress Section
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Progress Circle
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: isComplete ? 1.0 : _pulseAnimation.value,
                          child: Container(
                            width: screenWidth * 0.5,
                            height: screenWidth * 0.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isComplete 
                                  ? RadialGradient(
                                      colors: [
                                        AppColors.success.withOpacity(0.2),
                                        AppColors.success.withOpacity(0.05),
                                      ],
                                    )
                                  : RadialGradient(
                                      colors: [
                                        AppColors.secondary.withOpacity(0.2),
                                        AppColors.secondary.withOpacity(0.05),
                                      ],
                                    ),
                              boxShadow: [
                                BoxShadow(
                                  color: (isComplete ? AppColors.success : AppColors.secondary)
                                      .withOpacity(0.3),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.4,
                                  height: screenWidth * 0.4,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 8,
                                    backgroundColor: AppColors.disabled.withOpacity(0.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      isComplete ? AppColors.success : AppColors.secondary,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isComplete) ...[
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: AppColors.success,
                                        size: screenWidth * 0.12,
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                    ],
                                    Text(
                                      isComplete ? 'Done!' : '${(progress * 100).toInt()}%',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.08,
                                        fontWeight: FontWeight.w900,
                                        color: isComplete ? AppColors.success : AppColors.textPrimary,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                    SizedBox(height: screenHeight * 0.04),
                    
                    // Method Info
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      ),
                      child: Text(
                        widget.method,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: screenHeight * 0.06),
                    
                    // Action Button
                    Container(
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        gradient: isComplete 
                            ? LinearGradient(
                                colors: [AppColors.success, AppColors.success.withOpacity(0.8)],
                              )
                            : LinearGradient(
                                colors: [AppColors.disabled, AppColors.disabled.withOpacity(0.8)],
                              ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        boxShadow: isComplete ? [
                          BoxShadow(
                            color: AppColors.success.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ] : [],
                      ),
                      child: ElevatedButton(
                        onPressed: isComplete ? () => Navigator.pop(context) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          ),
                        ),
                        child: Text(
                          isComplete ? 'Complete' : 'Processing...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}