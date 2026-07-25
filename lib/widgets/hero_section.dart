import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreClick;

  const HeroSection({super.key, required this.onExploreClick});

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
      constraints: const BoxConstraints(minHeight: 650),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Status Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.cyanAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: AppTheme.cyanAccent.withValues(alpha: 0.3), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.emeraldAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Senior Machine Learning & Data Engineer • Toronto, ON',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: AppTheme.cyanAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Title
              ShaderMask(
                shaderCallback: (bounds) =>
                    AppTheme.cyanBlueGradient.createShader(bounds),
                child: Text(
                  PortfolioData.name,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: isMobile ? 38 : 60,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Bridging Distributed AI Research & Production Cloud Data Systems',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),

              // Description Summary
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  PortfolioData.summary,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: isMobile ? 15 : 18,
                      ),
                ),
              ),
              const SizedBox(height: 36),

              // Action Buttons & Links
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_downward, size: 18),
                    label: const Text('Explore Experience'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.cyanAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: onExploreClick,
                  ),
                  OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.graduationCap,
                        size: 16),
                    label: const Text('Google Scholar'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textPrimary,
                      side: const BorderSide(color: AppTheme.cardBorder),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => _launchUrl(PortfolioData.scholar),
                  ),
                  OutlinedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, size: 16),
                    label: const Text('LinkedIn'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textPrimary,
                      side: const BorderSide(color: AppTheme.cardBorder),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => _launchUrl(PortfolioData.linkedin),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Metric Highlights Cards Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = isMobile
                      ? (constraints.maxWidth - 16) / 2
                      : (constraints.maxWidth - 48) / 4;
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _metricCard(
                        width: cardWidth,
                        value: '7+ Years',
                        label: 'ML & Data Engineering',
                        icon: Icons.auto_graph,
                        color: AppTheme.cyanAccent,
                      ),
                      _metricCard(
                        width: cardWidth,
                        value: 'M.Sc. CS',
                        label: 'U of Saskatchewan',
                        icon: Icons.school,
                        color: AppTheme.blueAccent,
                      ),
                      _metricCard(
                        width: cardWidth,
                        value: 'GenAI & RAG',
                        label: 'LangChain & Neo4j',
                        icon: Icons.psychology,
                        color: AppTheme.indigoAccent,
                      ),
                      _metricCard(
                        width: cardWidth,
                        value: 'Petabyte Scale',
                        label: 'Apache Spark & Delta Lake',
                        icon: Icons.storage,
                        color: AppTheme.emeraldAccent,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _metricCard({
    required double width,
    required String value,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
