import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});
  final List<_ExperienceItem> experiences = const [
    _ExperienceItem(
      role: "Senior Software Developer",
      company: "Birlasoft",
      duration: "Jul 2021 - Present · 3 yrs 3 mos",
      description:
          "Working in a hybrid environment at Navi Mumbai, contributing to full-stack development projects. Responsible for designing, developing, and deploying scalable software solutions. Leading feature implementation, code reviews, and mentoring junior developers. Collaborating with cross-functional teams to ensure high-quality deliverables and meet project timelines.",
    ),
    _ExperienceItem(
      role: "Flutter Developer (Internship)",
      company: "VPS Techub",
      duration: "Jun 2021 - Nov 2021 · 6 mos",
      description:
          "Integrated Agora SDK, Razorpay, and deep linking functionality. Implemented Google and Facebook authentication. Developed and tested mobile applications with a custom backend system to meet user requirements and fix defects.",
    ),
    _ExperienceItem(
      role: "Junior Application Developer (Internship)",
      company: "Monk Entertainment",
      duration: "Apr 2021 - May 2021 · 2 mos",
      description:
          "Implemented new features and maintained existing applications for iOS and Android. Worked on Firebase real-time storage and notifications. Collaborated with UI designers to implement responsive UI designs. Deployed updates on Play Store and App Store.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: isDark ? Colors.grey[900] : Colors.grey[200], // subtle bg color
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Experience",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: experiences.map((exp) {
                final index = experiences.indexOf(exp);
                final isLast = index == experiences.length - 1;
                return _ExperienceTile(
                  experience: exp,
                  isDark: isDark,
                  isLast: isLast,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceItem {
  final String role;
  final String company;
  final String duration;
  final String description;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class _ExperienceTile extends StatelessWidget {
  final _ExperienceItem experience;
  final bool isDark;
  final bool isLast;

  const _ExperienceTile({
    required this.experience,
    required this.isDark,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Container(
          width: 40,
          child: Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isDark ? Colors.blue[300] : Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Experience details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience.role,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              Text(
                "${experience.company} • ${experience.duration}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                experience.description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
