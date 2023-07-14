import 'package:app_system/pages/auth/auth_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Get.offAll(const AuthPage());
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome home'),
            TextButton(
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
                if (kDebugMode) {
                  print(prefs.getString('token'));
                }
              },
              child: const Text('Print token'),
            ),
          ],
        ),
      ),
    );
  }
}
