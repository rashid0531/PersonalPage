import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'resume_request_modal.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemSelected;
  final int activeIndex;

  const Navbar({
    super.key,
    required this.onNavItemSelected,
    required this.activeIndex,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.95),
        border: const Border(
          bottom: BorderSide(color: AppTheme.cardBorder),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => onNavItemSelected(0),
                  child: Row(
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
                        'Rashid Chowdhury',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Navigation Items
              if (!isMobile)
                Row(
                  children: [
                    _navButton('About', 1),
                    _navButton('Experience', 2),
                    _navButton('Research', 3),
                    _navButton('Skills', 4),
                    _navButton('Projects', 5),
                    _navButton('Awards', 6),
                    const SizedBox(width: 16),
                    _socialIconButton(
                      icon: FontAwesomeIcons.linkedin,
                      tooltip: 'LinkedIn',
                      onPressed: () => _launchUrl(PortfolioData.linkedin),
                    ),
                    _socialIconButton(
                      icon: FontAwesomeIcons.github,
                      tooltip: 'GitHub',
                      onPressed: () => _launchUrl(PortfolioData.github),
                    ),
                    _socialIconButton(
                      icon: FontAwesomeIcons.graduationCap,
                      tooltip: 'Google Scholar',
                      onPressed: () => _launchUrl(PortfolioData.scholar),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => ResumeRequestModal.show(context),
                      child: const Text(
                        'Request Resume',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String label, int index) {
    final isSelected = activeIndex == index;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavItemSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? AppTheme.blueAccent : AppTheme.textSecondary,
            ),
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
    return IconButton(
      icon: FaIcon(icon, size: 18, color: AppTheme.textSecondary),
      tooltip: tooltip,
      onPressed: onPressed,
      hoverColor: AppTheme.blueAccent.withValues(alpha: 0.1),
    );
  }
}
