class ExperienceItem {
  final String title;
  final String company;
  final String location;
  final String period;
  final List<String> highlights;
  final List<String> techStack;

  const ExperienceItem({
    required this.title,
    required this.company,
    required this.location,
    required this.period,
    required this.highlights,
    required this.techStack,
  });
}

class ResearchItem {
  final String degree;
  final String institution;
  final String period;
  final String topic;
  final String description;
  final List<String> keyTechnologies;

  const ResearchItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.topic,
    required this.description,
    required this.keyTechnologies,
  });
}

class ProjectItem {
  final String title;
  final String category;
  final String description;
  final List<String> highlights;
  final List<String> tags;
  final String? link;

  const ProjectItem({
    required this.title,
    required this.category,
    required this.description,
    required this.highlights,
    required this.tags,
    this.link,
  });
}

class SkillCategory {
  final String categoryName;
  final List<String> skills;

  const SkillCategory({
    required this.categoryName,
    required this.skills,
  });
}

class AwardItem {
  final String title;
  final String issuer;
  final String period;
  final String description;
  final String? link;

  const AwardItem({
    required this.title,
    required this.issuer,
    required this.period,
    required this.description,
    this.link,
  });
}

class PortfolioData {
  static const String name = "Mohammed Rashid Chowdhury";
  static const String title = "Senior Machine Learning & Data Engineer";
  static const String location = "Toronto, ON, Canada";
  static const String email = "mohammed.rashid.chowdhury.shuklo@gmail.com";
  static const String phone = "+1 (306)-717-3271";
  static const String linkedin = "https://www.linkedin.com/in/mohammed-rashid-chowdhury";
  static const String github = "https://github.com/rashid0531";
  static const String scholar = "http://tinyurl.com/googlescholarrashid";

  static const String summary =
      "Senior Engineer with 7+ years of experience specializing in Machine Learning, GenAI/RAG, and Large-Scale Data Engineering. "
      "Proven track record of architecting enterprise RAG pipelines, optimizing petabyte-scale Spark workloads, and scaling distributed neural network training across GPU clusters. "
      "Expert at bridging cutting-edge AI research with production-grade, cloud-native software architectures.";

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      title: "Senior Machine Learning & Data Engineer",
      company: "CGI Inc.",
      location: "Toronto, ON (Remote)",
      period: "May 2022 – Present",
      highlights: [
        "Advanced AI Product Development: Engineered high-performance RAG (Retrieval-Augmented Generation) pipelines integrating LangChain with Neo4j knowledge graphs and FAISS vector stores, enabling context-aware retrieval and boosting user engagement by 50%.",
        "Intelligent Data Deduplication & Reconciliation: Designed and deployed a BERT-based entity matching solution using TensorFlow to automate deduplication across disparate enterprise datasets.",
        "HCM Migration & Reporting Lead: Architected end-to-end data transformation pipelines according to complex business logic for HCM system migration; currently serving as the project Reporting Lead.",
        "Distributed Data Engineering: Optimized large-scale Apache Spark workloads and Delta Lake tables, reducing query latency and operational overhead by 40%.",
        "AI Reliability & Compliance: Orchestrated data lineage and PII anonymization using Databricks Unity Catalog to ensure regulatory compliance and high-fidelity data governance.",
      ],
      techStack: [
        "LangChain",
        "Neo4j",
        "FAISS",
        "TensorFlow",
        "PySpark",
        "Delta Lake",
        "Databricks",
        "BERT",
        "Python"
      ],
    ),
    ExperienceItem(
      title: "Machine Learning / Data Engineer II (MLOps Team)",
      company: "Bell Canada",
      location: "Toronto, ON",
      period: "July 2021 – May 2022",
      highlights: [
        "Real-Time AI Infrastructure: Engineered event-driven pipelines using Apache Kafka and Spark Structured Streaming to process high-velocity telemetry data with sub-second latency.",
        "Production API Engineering: Deployed ML models as production-ready, high-throughput API endpoints using BentoML and FastAPI for downstream microservices.",
        "Model Observability & Integrity: Developed a statistical drift detection framework (KL-divergence & KS-test) using Prometheus, Grafana, and Python.",
        "Cloud-Native Deployment: Orchestrated Jenkins CI/CD pipelines for containerized workloads on Kubernetes/OpenShift, leveraging multi-stage Docker builds to reduce image footprints by 50%.",
      ],
      techStack: [
        "Apache Kafka",
        "Spark Streaming",
        "BentoML",
        "FastAPI",
        "Kubernetes",
        "Docker",
        "Prometheus",
        "Grafana",
        "Jenkins"
      ],
    ),
    ExperienceItem(
      title: "Software Engineer (Machine Learning Framework)",
      company: "Siemens Digital Industries Software",
      location: "Saskatoon, SK",
      period: "February 2019 – July 2021",
      highlights: [
        "Core Framework Engineering: Created core Python frameworks and internal libraries for ML workflow automation and chip verification tools.",
        "Performance Engineering: Accelerated application start times by 2x using cProfile bottleneck profiling, high-performance Redis caching, and Python generators.",
        "Algorithmic Development: Implemented proprietary ML algorithms for semiconductor chip verification using Python, C++, and Cython to maximize computational efficiency.",
        "Cloud & DevOps Infrastructure: Streamlined CI/CD automation using AWS (ECR, ECS, CodePipeline) and Ansible for scalable tool deployment.",
      ],
      techStack: [
        "Python (Core)",
        "C++",
        "Cython",
        "Redis",
        "AWS (ECS/ECR)",
        "Ansible",
        "cProfile",
        "Docker"
      ],
    ),
    ExperienceItem(
      title: "Graduate Research Assistant (Parallel & Distributed Programming)",
      company: "DISCUS Lab, University of Saskatchewan",
      location: "Saskatoon, SK",
      period: "September 2016 – February 2019",
      highlights: [
        "Distributed Computing: Scaled a CNN-based flower counting application by ~7X on multi-GPU clusters using TensorFlow (Parameter Server), Horovod (Ring Reduce), and OpenMPI.",
        "System Performance: Accelerated image registration tasks by ~3x using CUDA C++ and Cython, implementing custom resource scheduling for efficient GPU utilization.",
        "Big Data Processing: Developed distributed data processing pipelines using Apache Spark, HDFS, and Hive to manage and analyze high-volume image datasets.",
      ],
      techStack: [
        "TensorFlow",
        "Horovod",
        "OpenMPI",
        "CUDA C++",
        "Cython",
        "Apache Spark",
        "HDFS",
        "Hive"
      ],
    ),
  ];

  static const List<ResearchItem> research = [
    ResearchItem(
      degree: "Master of Science (M.Sc.) in Computer Science",
      institution: "University of Saskatchewan, Canada",
      period: "Sep 2016 – Feb 2019",
      topic: "Distributed Neural Network Training in GPU Clusters",
      description:
          "Focused on scaling Deep Convolutional Neural Networks across multi-GPU cluster architectures. Evaluated parameter server architectures vs. decentralised Ring-AllReduce algorithms (Horovod, OpenMPI) to optimize throughput, reduce inter-node communication bottlenecks, and achieve ~7x speedup across distributed GPU nodes.",
      keyTechnologies: [
        "Distributed TensorFlow",
        "Parameter Server",
        "Horovod (Ring Reduce)",
        "OpenMPI",
        "CUDA C++",
        "GPU Cluster Acceleration"
      ],
    ),
    ResearchItem(
      degree: "Bachelor of Science (B.Sc.) in Computer Science & Engineering",
      institution: "North South University, Dhaka, Bangladesh",
      period: "May 2009 – Sep 2015",
      topic: "Virtual Machine Consolidation in Cloud Environments",
      description:
          "Investigated dynamic VM allocation and consolidation algorithms in cloud data centers to minimize power consumption while honoring strict Service Level Agreements (SLAs) and resource utilization thresholds.",
      keyTechnologies: [
        "Cloud Computing",
        "Virtual Machine Consolidation",
        "SLA Optimization",
        "Resource Scheduling",
        "Data Center Energy Efficiency"
      ],
    ),
  ];

  static const List<ProjectItem> featuredProjects = [
    ProjectItem(
      title: "Enterprise GenAI Knowledge Graph & RAG Pipeline",
      category: "GenAI & LLMs",
      description:
          "Context-aware Retrieval-Augmented Generation pipeline connecting unstructured document stores to Neo4j knowledge graphs and FAISS vector indices.",
      highlights: [
        "Integrated LangChain with Neo4j graph schemas & FAISS embeddings.",
        "Improved search accuracy and context retrieval precision by 50%.",
        "Implemented guardrails and Databricks Unity Catalog PII governance."
      ],
      tags: ["LangChain", "Neo4j", "FAISS", "Python", "Databricks", "LLMs"],
    ),
    ProjectItem(
      title: "BERT-Based Enterprise Entity Matching & Deduplication",
      category: "Deep Learning & Data Quality",
      description:
          "Neural entity resolution system using fine-tuned BERT transformer models to reconcile duplicate entity records across disparate databases.",
      highlights: [
        "Trained domain-adapted BERT embeddings with TensorFlow.",
        "Automated cross-system record linking with high F1-score precision.",
        "Integrated directly into high-throughput Apache Spark ETL pipelines."
      ],
      tags: ["TensorFlow", "BERT", "NLP", "PySpark", "Entity Matching"],
    ),
    ProjectItem(
      title: "Real-Time Telemetry & Model Observability Engine",
      category: "MLOps & Data Streaming",
      description:
          "Event-driven streaming platform for high-velocity telemetry data processing with automated statistical drift detection.",
      highlights: [
        "Built Kafka + Spark Structured Streaming ingestion with sub-second latency.",
        "Automated drift detection via KL-divergence and Kolmogorov-Smirnov statistical tests.",
        "Exposed real-time observability dashboards with Prometheus & Grafana."
      ],
      tags: [
        "Apache Kafka",
        "Spark Streaming",
        "BentoML",
        "Prometheus",
        "Grafana",
        "FastAPI"
      ],
    ),
    ProjectItem(
      title: "Multi-GPU Distributed CNN Training Framework",
      category: "Distributed Computing & HPC",
      description:
          "Scalable multi-GPU deep learning framework using Horovod Ring-AllReduce and TensorFlow Parameter Servers.",
      highlights: [
        "Achieved linear scaling (~7X speedup) across multi-GPU cluster nodes.",
        "Optimized GPU memory bandwidth with CUDA C++ and custom kernels.",
        "Minimized inter-node network latency via OpenMPI primitives."
      ],
      tags: ["Distributed TensorFlow", "Horovod", "CUDA C++", "OpenMPI", "GPUs"],
    ),
    ProjectItem(
      title: "Enterprise HCM System Data Migration Pipeline",
      category: "Data Engineering",
      description:
          "Petabyte-scale data transformation and reconciliation engine for migrating complex human capital management systems.",
      highlights: [
        "Engineered business logic transformation rules in Apache Spark.",
        "Optimized Delta Lake ACID transactions and query performance by 40%.",
        "Led reporting architecture and validation quality gates as Reporting Lead."
      ],
      tags: ["Apache Spark", "Delta Lake", "ETL/ELT", "Reporting", "Databricks"],
    ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      categoryName: "AI & GenAI",
      skills: [
        "Large Language Models (LLMs)",
        "RAG Pipelines",
        "LangChain",
        "FAISS Vector Stores",
        "Neo4j Knowledge Graphs",
        "TensorFlow",
        "BERT",
        "PyTorch",
        "AI Agents",
        "Embeddings"
      ],
    ),
    SkillCategory(
      categoryName: "Data Engineering",
      skills: [
        "Apache Spark (PySpark)",
        "Delta Lake",
        "Apache Kafka",
        "Spark Structured Streaming",
        "Apache Airflow",
        "Hadoop & Hive",
        "Databricks Unity Catalog",
        "ETL / ELT Pipelines",
        "Data Warehousing"
      ],
    ),
    SkillCategory(
      categoryName: "Cloud & MLOps",
      skills: [
        "GCP (Vertex AI, GCS)",
        "Microsoft Azure",
        "AWS (ECS, ECR)",
        "Docker",
        "Kubernetes / OpenShift",
        "BentoML & FastAPI",
        "CI/CD (Jenkins, Azure DevOps)",
        "Terraform",
        "Prometheus & Grafana"
      ],
    ),
    SkillCategory(
      categoryName: "Languages & Tools",
      skills: [
        "Python (Expert)",
        "SQL",
        "Dart & Flutter",
        "C++",
        "Cython",
        "CUDA",
        "Bash",
        "Git",
        "MLflow"
      ],
    ),
  ];

  static const List<AwardItem> awards = [
    AwardItem(
      title: "Certified Azure Data Engineer Associate",
      issuer: "Microsoft",
      period: "2024 – 2025",
      description:
          "Demonstrated expertise in designing, implementing, and optimizing data engineering solutions on Azure using Databricks, Data Factory, and Synapse.",
    ),
    AwardItem(
      title: "CGI Impact Award (NCR F23 Q2)",
      issuer: "CGI Inc.",
      period: "2023",
      description:
          "Awarded for exceeding expectations and making significant contributions that directly benefit CGI Stakeholders (GC - NextGen).",
    ),
    AwardItem(
      title: "Winner of Emerging Agriculture Hackathon",
      issuer: "Emerging Agriculture",
      period: "2017",
      description:
          "First Place Award for building an AI-powered image processing application to identify crop pest infestations and plant nutrient deficiencies.",
      link: "http://bit.ly/agricultural-hackathon-2017",
    ),
    AwardItem(
      title: "Graduate Faculty Scholarship Award",
      issuer: "University of Saskatchewan",
      period: "2016 – 2019",
      description:
          "Merit-based academic scholarship covering full tuition for Master of Science program in Computer Science.",
    ),
  ];
}
