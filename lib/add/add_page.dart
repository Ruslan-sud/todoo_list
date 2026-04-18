import 'package:flutter/material.dart';
import 'add_view_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController controller = TextEditingController();
  final AddViewModel viewModel = AddViewModel();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Добавить задачу")),

      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          final state = viewModel.state;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Введите задачу",
                  ),
                ),

                const SizedBox(height: 20),

                if (!state.isInitial && !state.isSucceed)
                  const Text(
                    "Введите название",
                    style: TextStyle(color: Colors.red),
                  ),

                if (!state.isInitial && state.isSucceed)
                  const Text(
                    "Сохранено!",
                    style: TextStyle(color: Colors.green),
                  ),

                const Spacer(),

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      viewModel.submit(controller.text);

                      if (controller.text.isNotEmpty) {
                        await Future.delayed(const Duration(seconds: 1));

                        Navigator.pop(context, controller.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1976D2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Сохранить"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
