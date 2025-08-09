import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/app/core/utils/responsive.dart';
import 'package:my_portfolio_flutter/app/core/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/home_viewmodel.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = Responsive.isMobile(context);

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(100, 181, 246, 0.6),
                spreadRadius: 1,
                blurRadius: 12,
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.blue.shade600, width: 1),
            ),
            child: Container(
              width: screenWidth * (isMobile ? 0.8 : 0.7),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name + Social Icons
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 8,
                      children: [
                        Text(
                          vm.portfolioInfo.name,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontSize: isMobile ? 22 : 28,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Wrap(
                          spacing: 4,
                          children: [
                            IconButton(onPressed: null, icon: Icon(Icons.abc)),
                            IconButton(onPressed: null, icon: Icon(Icons.abc)),
                            IconButton(onPressed: null, icon: Icon(Icons.abc)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    vm.portfolioInfo.designation,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),

                  /// Contact Info - row on desktop, column on mobile
                  isMobile
                      ? Column(
                          children: [
                            ContactCard(
                              title: "Email",
                              value: vm.portfolioInfo.email,
                            ),
                            const SizedBox(height: 8),
                            ContactCard(
                              title: "Phone",
                              value: vm.portfolioInfo.contactNo,
                            ),
                            const SizedBox(height: 8),
                            ContactCard(
                              title: "Location",
                              value: vm.portfolioInfo.location,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: ContactCard(
                                title: "Email",
                                value: vm.portfolioInfo.email,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ContactCard(
                                title: "Phone",
                                value: vm.portfolioInfo.contactNo,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ContactCard(
                                title: "Location",
                                value: vm.portfolioInfo.location,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<AppViewModel>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: avm.isDarkTheme()
            ? Colors.white.withOpacity(0.07)
            : Colors.black.withOpacity(0.04),
      ),
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
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
