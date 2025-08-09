import 'dart:ui'; // For ImageFilter

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/app/core/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home_viewmodel.dart';
import '../sections/about/about_section.dart';
import '../sections/education/education_section.dart';
import '../sections/intro/intro_section.dart';
import '../sections/projects/project_section.dart';

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

  bool get _isMenuOpen =>
      _menuController.status == AnimationStatus.completed ||
      _menuController.status == AnimationStatus.forward;

  final double introSectionHeight = 170;
  final double aboutOffset = 200;
  final double projectsOffset = 700;
  final double educationOffset = 1100;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final isScrolledNow = _scrollController.offset > introSectionHeight;
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

  void scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<AppViewModel>(context);
    final vm = Provider.of<HomeViewModel>(context);

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

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
                                scrollToSection(0);
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
                          if (!isMobile) ...[
                            TextButton(
                              onPressed: () => scrollToSection(aboutOffset),
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
                              onPressed: () => scrollToSection(projectsOffset),
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
                              onPressed: () => scrollToSection(educationOffset),
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
              children: const [
                SizedBox(height: 32),
                IntroSection(),
                AboutSection(),
                ProjectSection(),
                EducationSection(),
              ],
            ),
          ),

          // Dropdown menu sliding down/up with animation
          if (isMobile)
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
                                  onTap: () => scrollToSection(aboutOffset),
                                ),
                                ListTile(
                                  title: const Text("Projects"),
                                  onTap: () => scrollToSection(projectsOffset),
                                ),
                                ListTile(
                                  title: const Text("Education"),
                                  onTap: () => scrollToSection(educationOffset),
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

      floatingActionButton: ClipOval(
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
                  color: Colors.black.withOpacity(0.1),
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
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeFloatingActionButton extends StatelessWidget {
  const ThemeFloatingActionButton({super.key, required this.avm});

  final AppViewModel avm;

  @override
  Widget build(BuildContext context) {
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
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
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
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
