import 'package:dart_movies/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AppMain()));
}

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}
