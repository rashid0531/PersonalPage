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
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: AppTheme.cyanBlueGradient,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'MRC',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
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
                      _socialIconButton(
                        icon: FontAwesomeIcons.linkedin,
                        tooltip: 'LinkedIn',
                        onPressed: () => _launchUrl(PortfolioData.linkedin),
                      ),
                      const SizedBox(width: 12),
                      _socialIconButton(
                        icon: FontAwesomeIcons.github,
                        tooltip: 'GitHub',
                        onPressed: () => _launchUrl(PortfolioData.github),
                      ),
                      const SizedBox(width: 12),
                      _socialIconButton(
                        icon: FontAwesomeIcons.graduationCap,
                        tooltip: 'Google Scholar',
                        onPressed: () => _launchUrl(PortfolioData.scholar),
                      ),
                      const SizedBox(width: 12),
                      _socialIconButton(
                        icon: FontAwesomeIcons.envelope,
                        tooltip: 'Email Me',
                        onPressed: () =>
                            _launchUrl('mailto:${PortfolioData.email}'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(color: AppTheme.cardBorder, height: 1),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© ${DateTime.now().year} Mohammed Rashid Chowdhury. All rights reserved.',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Built with ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      FlutterLogo(size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Flutter Web & Dart',
                        style: TextStyle(
                          fontFamily: 'FiraCode',
                          fontSize: 12,
                          color: AppTheme.cyanAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialIconButton({
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
        icon: FaIcon(icon, size: 18, color: AppTheme.cyanAccent),
        tooltip: tooltip,
        onPressed: onPressed,
      ),
    );
  }
}
