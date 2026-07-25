import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: AppTheme.surface.withValues(alpha: 0.4),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppTheme.cyanAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'FEATURED ARCHITECTURE & PROJECTS',
                    style: TextStyle(
                      fontFamily: 'FiraCode',
                      color: AppTheme.cyanAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'High-Impact AI & Big Data Solutions',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: isMobile ? 26 : 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 40),

              // Projects Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 24) / 2;
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: PortfolioData.featuredProjects.map((project) {
                      return _projectCard(context, project, cardWidth, isMobile);
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectCard(BuildContext context, ProjectItem project,
      double width, bool isMobile) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.cyanAccent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              project.category,
              style: const TextStyle(
                fontFamily: 'FiraCode',
                fontSize: 12,
                color: AppTheme.cyanAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),

          // Bullet Highlights
          Column(
            children: project.highlights.map((h) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.arrow_right,
                        size: 18,
                        color: AppTheme.cyanAccent,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        h,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Tag list
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceLight,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.cardBorder),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontFamily: 'FiraCode',
                    fontSize: 11,
                    color: AppTheme.textMuted,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
