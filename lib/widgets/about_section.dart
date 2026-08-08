import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'hover_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                  const Text(
                    'ABOUT ME',
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
                'Engineering Production AI & Petabyte Data Architectures',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: isMobile ? 26 : 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 24),

              // Description Text
              Text(
                'I am a Senior Machine Learning and Data Engineer based in Toronto, ON, with over 7 years of combined experience spanning cutting-edge distributed AI research and mission-critical enterprise systems. My career began with a strong foundation in Computer Science from North South University (B.Sc.), followed by a Master of Science (M.Sc.) at the University of Saskatchewan, where my thesis focused on scaling deep convolutional neural networks across multi-GPU clusters using parameter server and Ring-AllReduce architectures.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'In the industry, I have developed core Python frameworks at Siemens Digital Industries Software, architected real-time MLOps and event-driven API endpoints at Bell Canada, and currently lead large-scale data engineering, RAG pipelines, and HCM reporting initiatives at CGI Canada. I specialize in turning complex AI models into scalable, compliant, and cost-efficient cloud products.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),

              // Core Expertise Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final gridWidth = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 24) / 2;
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      _pillarCard(
                        width: gridWidth,
                        title: 'GenAI & RAG Systems',
                        description:
                            'Engineering retrieval-augmented generation pipelines integrating LangChain, Neo4j knowledge graphs, and FAISS vector stores for enterprise context retrieval.',
                        icon: Icons.psychology_outlined,
                        accentColor: AppTheme.cyanAccent,
                      ),
                      _pillarCard(
                        width: gridWidth,
                        title: 'Distributed GPU & ML Training',
                        description:
                            'Scaling deep learning models across multi-GPU clusters using TensorFlow Parameter Server, Horovod (Ring Reduce), and CUDA C++ acceleration.',
                        icon: Icons.memory_outlined,
                        accentColor: AppTheme.blueAccent,
                      ),
                      _pillarCard(
                        width: gridWidth,
                        title: 'Large-Scale Data Engineering',
                        description:
                            'Architecting high-performance Apache Spark, Delta Lake, and Kafka streaming pipelines for petabyte-scale transformations and HCM migrations.',
                        icon: Icons.account_tree_outlined,
                        accentColor: AppTheme.indigoAccent,
                      ),
                      _pillarCard(
                        width: gridWidth,
                        title: 'Production MLOps & Governance',
                        description:
                            'Deploying real-time model APIs (BentoML, FastAPI), model drift detection (KL-divergence), and Databricks Unity Catalog PII anonymization.',
                        icon: Icons.speed_outlined,
                        accentColor: AppTheme.emeraldAccent,
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

  Widget _pillarCard({
    required double width,
    required String title,
    required String description,
    required IconData icon,
    required Color accentColor,
  }) {
    return SizedBox(
      width: width,
      child: HoverCard(
        hoverBorderColor: accentColor,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accentColor, size: 28),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
