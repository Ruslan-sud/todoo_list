import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isDark = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      isDark ? const Color(0xff1E1E1E) : const Color(0xffF5F5F5),

      appBar: AppBar(
        title: Text(
          "Настройки",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),

        backgroundColor:
        isDark ? const Color(0xff1E1E1E) : Colors.white,

        centerTitle: true,

        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xff2C2C2C)
                : Colors.white,

            borderRadius: BorderRadius.circular(12),
          ),

          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// ТЕКСТ СЛЕВА
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Тёмная тема",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Использовать тёмное оформление приложения",
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                    ),

                  ],
                ),
              ),

              /// SWITCH СПРАВА
              Switch(
                value: isDark,

                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });
                },
              ),

            ],
          ),
        ),
      ),

    );

  }
}