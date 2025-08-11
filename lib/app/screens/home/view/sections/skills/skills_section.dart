import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<_SkillItem> skills = [
      _SkillItem(
        "Flutter",
        "https://upload.wikimedia.org/wikipedia/commons/7/79/Flutter_logo.svg",
      ),
      _SkillItem(
        "Firebase",
        "https://upload.wikimedia.org/wikipedia/commons/0/0b/New_Firebase_logo.svg",
      ),
      _SkillItem(
        "Spring Boot",
        "https://upload.wikimedia.org/wikipedia/commons/4/44/Spring_Framework_Logo_2018.svg",
      ),
      _SkillItem(
        "Java",
        "https://upload.wikimedia.org/wikipedia/en/3/30/Java_programming_language_logo.svg",
      ),
      _SkillItem(
        "SQL",
        "https://upload.wikimedia.org/wikipedia/commons/8/87/Sql_data_base_with_logo.png",
        iconImg: FontAwesomeIcons.database,
      ),
      _SkillItem(
        "Kubernetes",
        "https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg",
      ),
      _SkillItem(
        "Postman",
        "https://voyager.postman.com/logo/postman-logo-icon-orange.svg",
      ),
      _SkillItem(
        "Microsoft Azure",
        "https://upload.wikimedia.org/wikipedia/commons/f/fa/Microsoft_Azure.svg",
      ),
      _SkillItem(
        "PuTTY",
        "https://upload.wikimedia.org/wikipedia/commons/2/26/PuTTY_icon_128px.png",
        iconImg: FontAwesomeIcons.terminal,
      ),
      _SkillItem(
        "WinSCP",
        "https://upload.wikimedia.org/wikipedia/commons/d/d1/WinSCP_Logo.png",
        iconImg: FontAwesomeIcons.server,
      ),
      _SkillItem(
        "Linux",
        "https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg",
      ),
      _SkillItem(
        "Git",
        "https://upload.wikimedia.org/wikipedia/commons/e/e0/Git-logo.svg",
      ),
      _SkillItem(
        "React",
        "https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg",
      ),
      _SkillItem(
        "HTML5",
        "https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg",
      ),
      _SkillItem(
        "CSS3",
        "https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg",
      ),
      _SkillItem(
        "JavaScript",
        "https://www.javascripttutorial.net/wp-content/uploads/2021/04/JavaScript-Tutorial.svg",
      ),
      _SkillItem(
        "Node.js",
        "https://upload.wikimedia.org/wikipedia/commons/d/d9/Node.js_logo.svg",
      ),
      _SkillItem(
        "VB.Net",
        "https://upload.wikimedia.org/wikipedia/commons/7/7d/Microsoft_.NET_logo.svg",
      ),
    ];

    return Container(
      color: isDark ? Colors.grey[900] : Colors.grey[200], // subtle bg color
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Skills & Tools",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Technologies and tools I work with to create scalable, modern, and high-quality solutions.",
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
              children: skills.map((skill) {
                return SizedBox(
                  width: isMobile ? double.infinity : 200,
                  height: 160,
                  child: _SkillCard(skill: skill, isDark: isDark),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final _SkillItem skill;
  final bool isDark;
  const _SkillCard({required this.skill, required this.isDark});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: widget.isDark
                ? const LinearGradient(
                    colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : const LinearGradient(
                    colors: [Colors.white, Color(0xFFF9F9F9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (_hovering)
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
            ],
            border: Border.all(
              color: widget.isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.black.withOpacity(0.05),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                // child: Image.network(widget.skill.iconUrl, fit: BoxFit.contain),
                child: widget.skill.iconImg != null
                    ? Icon(widget.skill.iconImg, size: 36)
                    : SvgPicture.network(
                        widget.skill.iconUrl,
                        fit: BoxFit.contain,
                      ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.skill.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: widget.isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillItem {
  final String name;
  final String iconUrl;
  IconData? iconImg;
  _SkillItem(this.name, this.iconUrl, {this.iconImg});
}
