import 'package:flutter/material.dart';
import '../../widgets/ambient_gradient_background.dart';
import '../../widgets/onboarding_page.dart';
import '../../models/onboarding_page_model.dart';
import '../login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
// Burada onboarding ekranlarının tamamı tek bir data listesi olarak tanımlanıyor.
  final List<OnboardingPageModel> _pages = const [
    OnboardingPageModel(
      imagePath: 'assets/images/login_cube.png',
      title: 'Unlock Your Potential',
      description:
          'Experience the future of productivity with tools designed for speed and clarity.',
    ),
    OnboardingPageModel(
      imagePath: 'assets/images/onboarding_tool2.png',
      title: 'Personalization',
      description:
          'Curate your feed. We learn what you love to show you more of it.',
    ),
    OnboardingPageModel(
      imagePath: 'assets/images/onboarding_tool3.png',
      title: 'Unlock Your Peak Performance',
      titleHighlight: 'Performance',
      description:
          'Track habits, analyze flow states, and grow 1% better every single day.',
      overlayText: 'Daily Flow Stats',
      overlaySubtext: '+24% Increase',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Son sayfada "Get Started" butonuna basıldığında
      _completeOnboarding();
    }
  }

  void _completeOnboarding() {
    // Onboarding tamamlandı, login sayfasına geç
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextButton(
                    onPressed: _completeOnboarding,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      pageData: _pages[index],
                      currentPage: index,
                      totalPages: _pages.length,
                      onNext: _nextPage,
                      isLastPage: index == _pages.length - 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
