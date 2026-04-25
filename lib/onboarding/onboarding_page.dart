import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage == 2) {
      _finishOnboarding();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: (_currentPage > 0)
                  ? TextButton(
                      onPressed: _finishOnboarding,
                      child: const Text(
                        "Пропустить",
                        style: TextStyle(color: Color(0xFF9E9EAE), fontSize: 18),
                      ),
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  _buildScreen1(),
                  _buildScreen2(),
                  _buildScreen3(),
                ],
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen1() {
    return Center(
      child: Image.asset('assets/images/logo.png', width: 120),
    );
  }

  Widget _buildScreen2() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset('assets/images/logo.png', width: 80),
        const SizedBox(height: 10),
        const Text("Todolist", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text("Добро пожаловать!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Организуйте свою жизнь\nс Todoist - приложение для\nуправления задачами",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF757575), height: 1.3),
          ),
        ),
        const Spacer(),
        Image.asset('assets/images/onboarding1.png', width: double.infinity, fit: BoxFit.contain),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildScreen3() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset('assets/images/onboarding2.png', width: double.infinity, height: 300, fit: BoxFit.contain),
        const Spacer(),
        const Text("Все задачи\nв одном месте", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.1)),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Добавляйте упорядочивайте\nи управляйте задачами на день,\nнеделю и месяц",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF757575), height: 1.3),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: _currentPage == 2
                ? TextButton.icon(
                    onPressed: () => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease),
                    icon: const Icon(Icons.arrow_back_ios, size: 16, color: Color(0xFF9E9EAE)),
                    label: const Text("Назад", style: TextStyle(color: Color(0xFF9E9EAE), fontSize: 18)),
                  )
                : const SizedBox(),
          ),
          Row(
            children: List.generate(2, (index) {
              bool isActive = (_currentPage == 1 && index == 0) || (_currentPage == 2 && index == 1);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF007AFF) : const Color(0xFFC7C7CC),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          SizedBox(
            width: 110,
            height: 50,
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007AFF),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Далее", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}