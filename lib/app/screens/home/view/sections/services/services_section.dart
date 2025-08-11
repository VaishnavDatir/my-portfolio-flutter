import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<_BuildItem> items = [
      _BuildItem(
        icon: FontAwesomeIcons.mobileScreen,
        title: "Mobile Applications",
        description:
            "Seamless, high-performance apps for Android & iOS with user-friendly design and smooth animations.",
      ),
      _BuildItem(
        icon: FontAwesomeIcons.globe,
        title: "Web Applications",
        description:
            "Modern, responsive, and fast web apps built with cutting-edge technologies for all screen sizes.",
      ),
      _BuildItem(
        icon: FontAwesomeIcons.desktop,
        title: "Desktop Applications",
        description:
            "Powerful, intuitive software for Windows designed for productivity and performance.",
      ),
      _BuildItem(
        icon: FontAwesomeIcons.server,
        title: "Backend Systems",
        description:
            "Secure, scalable APIs and services to power your applications, ensuring reliability and performance.",
      ),
      _BuildItem(
        icon: FontAwesomeIcons.database,
        title: "Database Solutions",
        description:
            "Efficient, reliable, and optimized database design, migration, and maintenance.",
      ),
      _BuildItem(
        icon: FontAwesomeIcons.cloud,
        title: "Cloud & DevOps Solutions",
        description:
            "Scalable deployments, CI/CD pipelines, and cloud infrastructure management for modern apps.",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What I Build",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "A showcase of my expertise across different platforms and technologies.",
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
            children: items.map((item) {
              return SizedBox(
                width: isMobile ? double.infinity : 300,
                height: 240, // ✅ fixed uniform height
                child: _buildCard(context, item, isMobile, isDark),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    _BuildItem item,
    bool isMobile,
    bool isDark,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 15),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildItem {
  final IconData icon;
  final String title;
  final String description;

  _BuildItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}
