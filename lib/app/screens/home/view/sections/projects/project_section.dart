import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<_ProjectItem> projects = const [
    _ProjectItem(
      title: "Plugin: Sql_Conn",
      description:
          "A versatile Flutter plugin for seamless SQL database connections and queries, supporting multiple database engines. Widely used and highly rated on pub.dev.",
      githubUrl: "https://github.com/VaishnavDatir/sql_conn",
    ),
    _ProjectItem(
      title: "Student Vaccination Portal",
      description:
          "A full-stack web application to manage and track student vaccination records, ensuring timely immunizations and reporting.",
      githubUrl: "https://github.com/VaishnavDatir/vaccination-portal",
    ),
    _ProjectItem(
      title: "Live Bus Tracking Application",
      description:
          "Real-time bus tracking app that displays live locations, routes, and estimated arrival times to improve commuter experience.",
      githubUrl: "https://github.com/VaishnavDatir/busTracking_app",
    ),
    _ProjectItem(
      title: "Brand Management System",
      description:
          "A comprehensive system for managing brand assets, marketing campaigns, and client interactions with an analytics dashboard. This was a private project developed for an organization.",
      githubUrl: null,
    ),
    _ProjectItem(
      title: "Community Management Application",
      description:
          "An app designed to help community admins manage member registrations, announcements, event scheduling, and feedback. This was a private project developed for an organization.",
      githubUrl: null,
    ),
    _ProjectItem(
      title: "Interview Management System",
      description:
          "Tool to streamline interview scheduling, candidate tracking, and feedback collection for recruitment teams.",
      githubUrl: "https://github.com/VaishnavDatir/Interview-Management-System",
    ),
    _ProjectItem(
      title: "News App",
      description:
          "An innovative news app delivering the latest updates with a clean interface and personalized content to keep users informed and productive.",
      githubUrl: "https://github.com/VaishnavDatir/Flutter-NewsBucket",
    ),
    _ProjectItem(
      title: "Movie App",
      description:
          "A Flutter app to browse, search, and favorite movies, fetching data from popular movie databases with user ratings.",
      githubUrl: "https://github.com/VaishnavDatir/Flutter-Movie-App",
    ),
    _ProjectItem(
      title: "Weather App",
      description:
          "A sleek weather application providing current conditions, forecasts, and severe weather alerts using APIs.",
      githubUrl: "https://github.com/VaishnavDatir/weatherapp",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Some of the projects I’ve worked on with links to their GitHub repos.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return SizedBox(
                width: isMobile ? double.infinity : 350,
                child: _ProjectCard(project: project, isDark: isDark),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectItem {
  final String title;
  final String description;
  final String? githubUrl;

  const _ProjectItem({
    required this.title,
    required this.description,
    required this.githubUrl,
  });
}

class _ProjectCard extends StatelessWidget {
  final _ProjectItem project;
  final bool isDark;

  const _ProjectCard({required this.project, required this.isDark});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(project.githubUrl!);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 250,
      child: Card(
        color: isDark ? Colors.grey[850] : Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _launchUrl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    project.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (project.githubUrl != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: isDark ? Colors.blue[300] : Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "View on GitHub",
                        style: GoogleFonts.poppins(
                          color: isDark ? Colors.blue[300] : Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
