import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'hover_card.dart';
import 'resume_request_modal.dart';

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
      constraints: const BoxConstraints(minHeight: 700),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main Flex: Left = Text/CTAs, Right = Headshot Avatar
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Block
                  Expanded(
                    flex: isMobile ? 0 : 3,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        // Status Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.blueAccent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppTheme.blueAccent.withValues(alpha: 0.3),
                              width: 1,
                            ),
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
                                  color: AppTheme.blueAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Name Header
                        Text(
                          PortfolioData.name,
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: isMobile ? 38 : 56,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textPrimary,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Bridging Distributed AI Research & Production Cloud Data Systems',
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: isMobile ? 20 : 26,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.blueAccent,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Description Summary
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 750),
                          child: Text(
                            PortfolioData.summary,
                            textAlign: isMobile
                                ? TextAlign.center
                                : TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontSize: isMobile ? 15 : 17,
                                  height: 1.6,
                                ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Action Buttons
                        Wrap(
                          alignment: isMobile
                              ? WrapAlignment.center
                              : WrapAlignment.start,
                          spacing: 14,
                          runSpacing: 14,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.mark_email_read_outlined,
                                  size: 20),
                              label: const Text('Request Official Resume'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.blueAccent,
                                foregroundColor: Colors.white,
                                elevation: 2,
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
                              onPressed: () =>
                                  ResumeRequestModal.show(context),
                            ),
                            OutlinedButton.icon(
                              icon: const FaIcon(FontAwesomeIcons.graduationCap,
                                  size: 16),
                              label: const Text('Google Scholar'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.textPrimary,
                                side:
                                    const BorderSide(color: AppTheme.cardBorder),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: const TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () => _launchUrl(PortfolioData.scholar),
                            ),
                            OutlinedButton.icon(
                              icon: const FaIcon(FontAwesomeIcons.linkedin,
                                  size: 16),
                              label: const Text('LinkedIn'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.textPrimary,
                                side:
                                    const BorderSide(color: AppTheme.cardBorder),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: const TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              onPressed: () => _launchUrl(PortfolioData.linkedin),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (isMobile) const SizedBox(height: 40),

                  // Headshot Photo Avatar
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.cyanBlueGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.blueAccent.withValues(alpha: 0.3),
                              blurRadius: 30,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/headshot.jpg',
                            width: isMobile ? 240 : 290,
                            height: isMobile ? 240 : 290,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, 0.34),
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: isMobile ? 240 : 290,
                                height: isMobile ? 240 : 290,
                                color: AppTheme.surface,
                                child: const Center(
                                  child: Text(
                                    'MRC',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.blueAccent,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Metric Highlights Cards Grid (With Glowing HoverCard)
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
                        color: AppTheme.blueAccent,
                      ),
                      _metricCard(
                        width: cardWidth,
                        value: 'M.Sc. CS',
                        label: 'U of Saskatchewan',
                        icon: Icons.school,
                        color: AppTheme.cyanAccent,
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
    return SizedBox(
      width: width,
      child: HoverCard(
        hoverBorderColor: color,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 26),
              const SizedBox(height: 12),
              Text(
                value,
                style: const TextStyle(
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
        ),
      ),
    );
  }
}
