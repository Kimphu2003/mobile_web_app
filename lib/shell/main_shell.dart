import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../core/router/route_names.dart';
import '../core/widgets/language_dialog.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const LanguageDialog(),
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.keyboard)) return 1;
    if (location.startsWith(Routes.map)) return 2;
    return 0; // default: location-list (and detail)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeRed,
        title: const Text(
          "Page 2",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(Routes.landmarkDetail);
            }
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
        actions: [
          IconButton(
            onPressed: () => _showLanguageDialog(context),
            icon: const Icon(Icons.language_rounded, color: Colors.white, size: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeRed,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex(context),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.locationList);
            case 1:
              context.go(Routes.keyboard);
            case 2:
              context.go(Routes.map);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'รายการ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: 'แป้นพิมพ์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'แผนที่',
          ),
        ],
      ),
    );
  }
}

