import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/ui/shared/shared.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: context.theme.brightness == Brightness.dark ? 0.5 : 1.0,
          child: SvgPicture.asset(
            Assets.empty,
            height: MediaQuery.of(context).size.width * 0.65,
          ),
        ),
        const SizedBox(height: Spacings.xxs),
        Text(
          'So empty in here...',
          style: TextStyle(
            fontSize: 20,
            color: context.theme.colorScheme.onBackground.darken(20),
          ),
        ),
      ],
    );
  }
}
