import 'package:flutter/material.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class ScreenTemplate extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const ScreenTemplate({
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: body != null
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Spacings.xxxs),
                child: body,
              ),
            )
          : null,
    );
  }
}
