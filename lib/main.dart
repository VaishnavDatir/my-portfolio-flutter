import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/app/core/theme/app_theme.dart';
import 'package:my_portfolio_flutter/app/core/viewmodel/app_viewmodel.dart';
import 'package:my_portfolio_flutter/app/screens/home/view/pages/home_page.dart';
import 'package:my_portfolio_flutter/app/screens/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyPortfolioApp(),
    ),
  );
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appVM = Provider.of<AppViewModel>(context);
    return MaterialApp(
      title: 'Vaishnav Datir Portfolio',
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeIn,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appVM.themeMode,
      home: const HomePage(),
    );
  }
}
