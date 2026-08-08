import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(
          top: BorderSide(color: AppTheme.cardBorder),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              gradient: AppTheme.cyanBlueGradient,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'MRC',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            PortfolioData.name,
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        PortfolioData.title,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '📍 ${PortfolioData.location}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                  if (isMobile) const SizedBox(height: 24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _footerSocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        tooltip: 'LinkedIn',
                        onPressed: () => _launchUrl(PortfolioData.linkedin),
                      ),
                      const SizedBox(width: 12),
                      _footerSocialButton(
                        icon: FontAwesomeIcons.github,
                        tooltip: 'GitHub',
                        onPressed: () => _launchUrl(PortfolioData.github),
                      ),
                      const SizedBox(width: 12),
                      _footerSocialButton(
                        icon: FontAwesomeIcons.graduationCap,
                        tooltip: 'Google Scholar',
                        onPressed: () => _launchUrl(PortfolioData.scholar),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(color: AppTheme.cardBorder),
              const SizedBox(height: 24),
              Text(
                '© 2026 Mohammed Rashid Chowdhury. Built with Flutter Web & Dart.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerSocialButton({
    required dynamic icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: IconButton(
        icon: FaIcon(icon, size: 18, color: AppTheme.textSecondary),
        tooltip: tooltip,
        onPressed: onPressed,
        hoverColor: AppTheme.blueAccent.withValues(alpha: 0.1),
      ),
    );
  }
}
