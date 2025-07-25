// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   int _currentPage = 0;

//   final List<Map<String, String>> _pages = [
//     {
//       "title": "We serve\nincomparable delicacies",
//       "desc": "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
//       "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
//     },
//     {
//       "title": "Fast Delivery\nTo Your Door",
//       "desc": "Get your favorite meals delivered quickly and hot, right to your doorstep.",
//       "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
//     },
//     {
//       "title": "Easy Payment\n& Tracking",
//       "desc": "Pay easily and track your order in real time until it arrives.",
//       "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
//     },
//   ];

//   void _nextPage() {
//     if (_currentPage < _pages.length - 1) {
//       _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
//     } else {
//       Navigator.pushReplacementNamed(context, '/login');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // خلفية الصورة
//           Image.asset(
//             _pages[_currentPage]['img']!,
//             fit: BoxFit.cover,
//           ),
//           Container(color: Colors.black.withOpacity(0.2)),
//           // المربع البرتقالي والمحتوى
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 60, left: 24, right: 24),
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 220,
//                       child: PageView.builder(
//                         controller: _controller,
//                         itemCount: _pages.length,
//                         onPageChanged: (i) => setState(() => _currentPage = i),
//                         itemBuilder: (context, i) => Column(
//                           children: [
//                             Text(
//                               _pages[i]['title']!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 height: 1.2,
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               _pages[i]['desc']!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(color: Colors.white70, fontSize: 15),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     // مؤشرات الصفحات (dots)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         _pages.length,
//                         (i) => AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           margin: const EdgeInsets.symmetric(horizontal: 4),
//                           width: _currentPage == i ? 18 : 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             color: _currentPage == i ? Colors.white : Colors.white54,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // أزرار Skip و Next/Start
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushReplacementNamed(context, '/login');
//                           },
//                           child: const Text(
//                             'Skip',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                         _currentPage == _pages.length - 1
//                             ? ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   shape: const CircleBorder(),
//                                   padding: const EdgeInsets.all(12),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.pushReplacementNamed(context, '/login');
//                                 },
//                                 child: const Icon(Icons.check, color: Colors.orange),
//                               )
//                             : ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   shape: const CircleBorder(),
//                                   padding: const EdgeInsets.all(12),
//                                 ),
//                                 onPressed: _nextPage,
//                                 child: const Icon(Icons.arrow_forward, color: Colors.orange),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "We serve\nincomparable delicacies",
      "desc":
          "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
      "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
    },
    {
      "title": "Fast Delivery\nTo Your Door",
      "desc":
          "Get your favorite meals delivered quickly and hot, right to your doorstep.",
      "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
    },
    {
      "title": "Easy Payment\n& Tracking",
      "desc": "Pay easily and track your order in real time until it arrives.",
      "img": "assets/16f78c8c196239da21bcfcc1265f6ec5.jpg",
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية الصورة
          Image.asset(_pages[_currentPage]['img']!, fit: BoxFit.cover),
          // ✅  ***  الإصلاح هنا  ***
          Container(color: const Color.fromRGBO(0, 0, 0, 0.2)),
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
                    SizedBox(
                      height: 220,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageChanged: (i) => setState(() => _currentPage = i),
                        itemBuilder: (context, i) => Column(
                          children: [
                            Text(
                              _pages[i]['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _pages[i]['desc']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // مؤشرات الصفحات (dots)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == i ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == i
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // أزرار Skip و Next/Start
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
                        _currentPage == _pages.length - 1
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(12),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.orange,
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(12),
                                ),
                                onPressed: _nextPage,
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
}
