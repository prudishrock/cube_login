class OnboardingPageModel {
  final String imagePath;
  final String title;
  final String titleHighlight; // Vurgulanacak kelime (cyan renk için)
  final String description;
  final String? overlayText; // İkinci sayfadaki "Daily Flow Stats" gibi
  final String? overlaySubtext; // "+24% Increase" gibi

  const OnboardingPageModel({
    required this.imagePath,
    required this.title,
    this.titleHighlight = '',
    required this.description,
    this.overlayText,
    this.overlaySubtext,
  });
}
