import 'package:flutter/material.dart';
import '../models/onboarding_page_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageData;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.pageData,
    required this.currentPage,
    required this.totalPages,
    this.onNext,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Content - Image
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.asset(
                    pageData.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Overlay Card (sadece 3. sayfada)
              if (pageData.overlayText != null)
                Positioned(
                  bottom: 80,
                  left: 50,
                  right: 50,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: const Color(0xFF25D1F4),
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                pageData.overlayText!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (pageData.overlaySubtext != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    pageData.overlaySubtext!,
                                    style: const TextStyle(
                                      color: Color(0xFF25D1F4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),

        // Bottom Card Section
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A).withOpacity(0.8),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                RichText(
                  text: _buildTitleText(),
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  pageData.description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // Pagination and Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Pagination Dots
                    Row(
                      children: List.generate(
                        totalPages,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildDot(index == currentPage),
                        ),
                      ),
                    ),

                    // Next/Get Started Button
                    ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25D1F4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isLastPage ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

// title textini renkli gösterimi methodu titleHighlight kısmını renk verir
  TextSpan _buildTitleText() {
    if (pageData.titleHighlight.isEmpty) {
      return TextSpan(
        text: pageData.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    final parts = pageData.title.split(pageData.titleHighlight);
    final List<TextSpan> spans = [];

    if (parts.isNotEmpty && parts[0].isNotEmpty) {
      spans.add(
        TextSpan(
          text: parts[0],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
// titleHighlight kısmını renk verir
    spans.add(
      TextSpan(
        text: pageData.titleHighlight,
        style: const TextStyle(
          color: Color(0xFF25D1F4),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (parts.length > 1 && parts[1].isNotEmpty) {
      spans.add(
        TextSpan(
          text: parts[1],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return TextSpan(children: spans);
  }

// sayfa sayısının renkli gösterimi methodu noktalara renk verir
  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF25D1F4)
            : Colors.grey[400]!.withOpacity(0.3),
        shape: BoxShape.circle,
        border: isActive
            ? null
            : Border.all(
                color: Colors.grey[400]!,
                width: 1,
              ),
      ),
    );
  }
}
