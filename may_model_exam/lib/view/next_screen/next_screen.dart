import 'package:flutter/material.dart';
import 'package:may_model_exam/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProv = context.watch<HomeScreenController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeScreenController>().getData();
        },
        child: Icon(Icons.arrow_right_alt),
      ),
      body: Center(
        child: homeScreenProv.resModels == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: homeScreenProv.resModels!.length,
                itemBuilder: (context, index) {
                  final university = homeScreenProv.resModels![index];
                  return ListTile(
                    title: Text(university.name ?? 'No name'),
                    subtitle:
                        Text(university.webPages?.toString() ?? 'No country'),
                    trailing: Text(university.alphaTwoCode ?? 'No code'),
                  );
                },
              ),
      ),
    );
  }
}
