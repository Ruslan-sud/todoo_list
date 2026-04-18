import 'package:flutter/material.dart';
import '../add/add_page.dart';
import '../settings/settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasks = [];

  Future _navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPage()),
    );

    if (result != null && result is String && result.isNotEmpty) {
      setState(() {
        tasks.insert(0, result);
      });
    }
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои задачи", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: _openSettings,
            icon: const Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),

              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: const Color(0xff1976D2),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      tasks[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                  const Text(
                    "14.09.26",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),

        child: SizedBox(
          height: 50,

          child: ElevatedButton.icon(
            onPressed: _navigateToAddPage,

            icon: const Icon(Icons.add, color: Colors.white),

            label: const Text("Добавить задачу"),

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1976D2),
              foregroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
