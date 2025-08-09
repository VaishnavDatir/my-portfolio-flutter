import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../viewmodel/home_viewmodel.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = Responsive.isMobile(context);

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: screenWidth * (isMobile ? 0.8 : 0.9),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: isMobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                vm.portfolioInfo.about,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 16),
                              SvgPicture.asset(
                                'assets/images/developer_avatar.svg',
                                width: 150,
                                height: 150,
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text takes flexible space
                              Expanded(
                                child: Text(
                                  vm.portfolioInfo.about,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              SizedBox(width: 24),
                              SvgPicture.asset(
                                'assets/images/developer_avatar.svg',
                                width: 220,
                                height: 220,
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
