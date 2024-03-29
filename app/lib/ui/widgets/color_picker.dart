import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/utils/utils.dart';

class ColorPicker extends StatefulWidget {
  final NoteColor color;
  final Function(NoteColor) onChange;

  const ColorPicker({
    required this.color,
    required this.onChange,
    super.key,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    const containerHeight = 192.0;

    return Container(
      width: double.infinity,
      height: containerHeight,
      padding: const EdgeInsets.all(Spacings.micro),
      decoration: BoxDecoration(
        color: widget.color.uiColor.darken(33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Spacings.xxs,
            child: Text(
              widget.color.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 5,
              crossAxisSpacing: Spacings.nano,
              mainAxisSpacing: Spacings.nano,
              children: [
                ...NoteColor.colors.map(
                  (color) => GestureDetector(
                    onTap: () => widget.onChange(color),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        border: widget.color == color
                            ? Border.all(
                                color: context.theme.colorScheme.primary,
                                width: Spacings.nano,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(6),
                        color: ColorUtils.fromHex(color.hexColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
