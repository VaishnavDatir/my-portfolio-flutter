import 'package:flutter/material.dart';

import '../model/portfolio_info.dart';

class HomeViewModel extends ChangeNotifier {
  late PortfolioInfo portfolioInfo;
  ThemeMode themeMode = ThemeMode.system;

  HomeViewModel() {
    // In a real app, fetch from API or local storage
    portfolioInfo = PortfolioInfo(
      name: "Vaishnav Datir",
      designation: "Software Engineer | Full Stack Developer",
      email: "vaishnav@example.com",
      contactNo: "+91 988133901",
      location: "Navi Mumbai, Maharashtra, India",
      about:
          "I’m a passionate software developer with a strong foundation in modern web and mobile technologies. "
          "I love building clean, efficient, and user-friendly applications that solve real-world problems. "
          "Continuously learning and adapting, I strive to deliver high-quality code and innovative solutions. "
          "With experience in Flutter, React, Java, Spring boot, VB.Net, I enjoy working on full-stack projects that challenge me to grow both technically and creatively. "
          "Collaboration and communication are important to me, as I believe great software comes from great teamwork. "
          "When I’m not coding, you’ll find me exploring new tech trends, contributing to open-source projects, or working on personal side projects that push my skills further.",
    );
  }

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
