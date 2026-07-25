import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'widgets/about_section.dart';
import 'widgets/awards_education_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/footer.dart';
import 'widgets/hero_section.dart';
import 'widgets/navbar.dart';
import 'widgets/projects_section.dart';
import 'widgets/research_section.dart';
import 'widgets/skills_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} | Senior Machine Learning & Data Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  int _activeSectionIndex = 0;

  final List<GlobalKey> _sectionKeys = List.generate(7, (_) => GlobalKey());

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final keyContext = _sectionKeys[index].currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
        setState(() {
          _activeSectionIndex = index;
        });
      }
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        onNavItemSelected: _scrollToSection,
        activeIndex: _activeSectionIndex,
      ),
      endDrawer: Drawer(
        backgroundColor: AppTheme.surface,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          children: [
            const Text(
              'Navigation',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            _drawerTile('Home', 0),
            _drawerTile('About', 1),
            _drawerTile('Experience', 2),
            _drawerTile('Research', 3),
            _drawerTile('Skills', 4),
            _drawerTile('Projects', 5),
            _drawerTile('Awards', 6),
            const Divider(color: AppTheme.cardBorder, height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.cyanAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                Navigator.pop(context);
                _launchUrl('mailto:${PortfolioData.email}');
              },
              child: const Text('Contact Me'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            KeyedSubtree(
              key: _sectionKeys[0],
              child: HeroSection(onExploreClick: () => _scrollToSection(2)),
            ),
            KeyedSubtree(
              key: _sectionKeys[1],
              child: const AboutSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[2],
              child: const ExperienceSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[3],
              child: const ResearchSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[4],
              child: const SkillsSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[5],
              child: const ProjectsSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[6],
              child: const AwardsEducationSection(),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile(String label, int index) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 16,
          color: AppTheme.textPrimary,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(index);
      },
    );
  }
}
