import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية الصورة
          Image.asset(
            'assets/16f78c8c196239da21bcfcc1265f6ec5.jpg',
            fit: BoxFit.cover,
          ),
          // طبقة شفافة خفيفة (اختياري)
          Container(color: Colors.black.withOpacity(0.2)),
          // المربع البرتقالي والمحتوى
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24, right: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'We serve\nincomparable delicacies',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    // مؤشرات الصفحات (dots)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true),
                        const SizedBox(width: 8),
                        _buildDot(false),
                        const SizedBox(width: 8),
                        _buildDot(false),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // أزرار Skip و Next
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dot Widget
  static Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
