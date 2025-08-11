import 'dart:ui'; // For ImageFilter

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/app/core/utils/responsive.dart';
import 'package:my_portfolio_flutter/app/core/viewmodel/app_viewmodel.dart';
import 'package:my_portfolio_flutter/app/screens/home/view/sections/services/services_section.dart';
import 'package:provider/provider.dart';

import '../../footer/portfolio_footer.dart';
import '../../viewmodel/home_viewmodel.dart';
import '../sections/about/about_section.dart';
import '../sections/education/education_section.dart';
import '../sections/experience/experience_section.dart';
import '../sections/intro/intro_section.dart';
import '../sections/projects/project_section.dart';
import '../sections/skills/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _scrolled = false;

  late AnimationController _menuController;
  late Animation<double> _menuAnimation;

// Keys for each section
  final GlobalKey introKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final isScrolledNow = _scrollController.offset > 170;
      if (isScrolledNow != _scrolled) {
        setState(() {
          _scrolled = isScrolledNow;
        });
      }
    });

    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _menuAnimation = CurvedAnimation(
      parent: _menuController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _menuController.dispose();
    super.dispose();
  }

  void toggleMenu() {
    if (_menuController.isCompleted) {
      _menuController.reverse();
    } else {
      _menuController.forward();
    }
  }

  void closeMenu() {
    if (_menuController.isCompleted) {
      _menuController.reverse();
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.07
      );
    }
    closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    final width = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AnimatedOpacity(
          opacity: _scrolled ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.bounceIn,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: !_scrolled
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          AnimatedAlign(
                            alignment: _scrolled
                                ? Alignment.centerLeft
                                : Alignment.center,
                            duration: const Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: () {
                                scrollToSection(introKey);
                                closeMenu();
                              },
                              child: Text(
                                vm.portfolioInfo.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontSize: isMobile ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (!isMobile && !isTablet) ...[
                            TextButton(
                              onPressed: () => scrollToSection(aboutKey),
                              child: Text(
                                "About",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => scrollToSection(servicesKey),
                              child: Text(
                                "What I Build",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => scrollToSection(skillsKey),
                              child: Text(
                                "Skills",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => scrollToSection(projectsKey),
                              child: Text(
                                "Projects",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => scrollToSection(experienceKey),
                              child: Text(
                                "Experience",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => scrollToSection(educationKey),
                              child: Text(
                                "Education",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ] else ...[
                            IconButton(
                              icon: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                progress: _menuAnimation,
                                color: Colors.blue.shade600,
                              ),
                              onPressed: toggleMenu,
                            ),
                          ],
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                SizedBox(height: 32),
                IntroSection(key: introKey),
                AboutSection(key: aboutKey),
                ServicesSection(key: servicesKey),
                SkillsSection(key: skillsKey),
                ProjectsSection(key: projectsKey),
                ExperienceSection(key: experienceKey),
                EducationSection(key: educationKey),
                PortfolioFooter()
              ],
            ),
          ),

          // Dropdown menu sliding down/up with animation
          if (isMobile || isTablet)
            !_scrolled
                ? Container()
                : Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: SizeTransition(
                      sizeFactor: _menuAnimation,
                      axisAlignment: -1, // slides down from top
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("About"),
                                  onTap: () => scrollToSection(aboutKey),
                                ),
                                ListTile(
                                  title: const Text("What I Build"),
                                  onTap: () => scrollToSection(servicesKey),
                                ),
                                ListTile(
                                  title: const Text("Skills"),
                                  onTap: () => scrollToSection(skillsKey),
                                ),
                                ListTile(
                                  title: const Text("Projects"),
                                  onTap: () => scrollToSection(projectsKey),
                                ),
                                ListTile(
                                  title: const Text("Experience"),
                                  onTap: () => scrollToSection(experienceKey),
                                ),
                                ListTile(
                                  title: const Text("Education"),
                                  onTap: () => scrollToSection(educationKey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
        ],
      ),

      floatingActionButton: ThemeFloatingActionButton()
    );
  }
}

class ThemeFloatingActionButton extends StatelessWidget {
  const ThemeFloatingActionButton({super.key});


  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<AppViewModel>(context);

    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.white.withOpacity(0.25),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton.small(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: avm.toggleTheme,
            child: Icon(
              avm.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: avm.themeMode == ThemeMode.dark
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
