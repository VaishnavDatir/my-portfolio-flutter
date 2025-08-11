import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/responsive.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  final List<_EducationItem> educationList = const [
    _EducationItem(
      institution: "Birla Institute of Technology, Pilani (WILP)",
      degree: "Master Of Technology - MTech, Software Engineering",
      duration: "2018 - Present",
    ),
    _EducationItem(
      institution: "Mumbai University",
      degree: "Bachelor of Engineering - BE, Computer Engineering",
      duration: "2018 - 2022",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool isMobile = Responsive.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Education",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: educationList.map((edu) {
                return _EducationTile(education: edu, isDark: isDark);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationItem {
  final String institution;
  final String degree;
  final String duration;

  const _EducationItem({
    required this.institution,
    required this.degree,
    required this.duration,
  });
}

class _EducationTile extends StatelessWidget {
  final _EducationItem education;
  final bool isDark;

  const _EducationTile({required this.education, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            education.institution,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          Text(
            education.degree,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          Text(
            education.duration,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: isDark ? Colors.white60 : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
