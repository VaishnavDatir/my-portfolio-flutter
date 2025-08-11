import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  final String githubUrl = "https://github.com/VaishnavDatir";
  final String linkedinUrl = "https://www.linkedin.com/in/vaishnavdatir/";
  final String email = "mailto:vaishnav.datir@gmail.com";

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final iconColor = isDark ? Colors.white70 : Colors.black87;

    return Container(
      width: double.infinity,
      color: isDark ? Colors.grey[900] : Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vaishnav Datir",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 30,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                color: iconColor,
                iconSize: 28,
                onPressed: () => _launchUrl(githubUrl),
                tooltip: "GitHub",
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                color: iconColor,
                iconSize: 28,
                onPressed: () => _launchUrl(linkedinUrl),
                tooltip: "LinkedIn",
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
                color: iconColor,
                iconSize: 28,
                onPressed: () => _launchUrl(email),
                tooltip: "Email",
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Made with Flutter 💙",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "© ${DateTime.now().year} Vaishnav Datir. All rights reserved.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark ? Colors.white54 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
