import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_flutter/app/core/utils/responsive.dart';
import 'package:my_portfolio_flutter/app/core/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../viewmodel/home_viewmodel.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    return Center(
      child: Container(
        width: screenWidth * (isMobile ? 0.9 : 0.7),
        margin: EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4), // glow color
              spreadRadius: 4, // how much it expands
              blurRadius: 20, // softness
              offset: const Offset(0, 0), // even glow all around
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name & Socials
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.portfolioInfo.name,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vm.portfolioInfo.designation,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.color?.withOpacity(0.8),
                            ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    _socialButton(
                      FontAwesomeIcons.github,
                      "https://github.com/VaishnavDatir",
                    ),
                    _socialButton(
                      FontAwesomeIcons.linkedinIn,
                      "https://www.linkedin.com/in/vaishnavdatir/",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Contact Info
            Column(children: _buildContactCards(context, vm)),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }

  List<Widget> _buildContactCards(BuildContext context, HomeViewModel vm) {
    return [
      ContactCard(
        title: "Email",
        value: vm.portfolioInfo.email,
        icon: Icons.email_outlined,
      ),
      const SizedBox(width: 12, height: 12),
      ContactCard(
        title: "Phone",
        value: vm.portfolioInfo.contactNo,
        icon: Icons.phone_outlined,
      ),
      const SizedBox(width: 12, height: 12),
      ContactCard(
        title: "Location",
        value: vm.portfolioInfo.location,
        icon: Icons.location_on_outlined,
      ),
    ];
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<AppViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: avm.isDarkTheme()
            ? Colors.white.withOpacity(0.05)
            : Colors.black.withOpacity(0.03),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade600, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
