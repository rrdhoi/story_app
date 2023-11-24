import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/routers/named_routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Halaman yang ada cari tidak ditemukan",
              style: context.textTheme.bodyLarge,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(NamedRoutes.home.name);
              },
              child: Text(
                "Home",
                style: context.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
