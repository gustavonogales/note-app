import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:note_app/primary/ui/note/widgets/color_picker.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import '../controllers/note_controller.dart';

class NoteScreen extends StatefulWidget {
  static const route = '/note';
  final ViewNote? note;

  const NoteScreen({this.note, super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late final NoteController controller;

  String get formattedDate {
    initializeDateFormatting();
    var format = DateFormat('MMM dd, yyyy');
    return format.format(DateTime.parse(controller.note.updatedAt));
  }

  TextStyle? get titleTheme => context.theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get bodyTheme => Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(fontSize: 16, height: 1.7);

  @override
  void initState() {
    controller = NoteController(widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      return Observer(builder: (context) {
        return Hero(
          tag: controller.note.id,
          child: Scaffold(
            backgroundColor: controller.note.color.uiColor,
            appBar: TopBar(
              backgroundColor: controller.note.color.uiColor,
              actions: [
                ActionButton(
                  iconData: FeatherIcons.penTool,
                  onPressed: () => controller
                      .setColorPickerVisible(!controller.colorPickerVisible),
                  color: controller.note.color.uiColor,
                ),
                if (!controller.editMode)
                  ActionButton(
                    iconData: FeatherIcons.edit,
                    onPressed: () =>
                        controller.setEditMode(!controller.editMode),
                    color: controller.note.color.uiColor,
                  ),
                if (controller.editMode)
                  ActionButton(
                    iconData: FeatherIcons.save,
                    onPressed: () {},
                    color: controller.note.color.uiColor,
                  ),
              ],
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(Spacings.xxxs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            enabled: controller.editMode,
                            maxLines: null,
                            initialValue: controller.note.title,
                            onChanged: controller.note.setTitle,
                            style: titleTheme,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Title',
                              hintStyle: titleTheme?.copyWith(
                                color: titleTheme?.color?.lighten(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: Spacings.xxxs),
                          Opacity(opacity: 0.5, child: Text(formattedDate)),
                          const SizedBox(height: Spacings.xxs),
                          TextFormField(
                            enabled: controller.editMode,
                            initialValue: controller.note.text,
                            onChanged: controller.text.setValue,
                            maxLines: null,
                            style: bodyTheme,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type something...',
                              hintStyle: bodyTheme?.copyWith(
                                color: bodyTheme?.color?.lighten(30),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Spacings.xxxs),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 200),
                      firstChild: const SizedBox(
                        width: double.infinity,
                        height: 0,
                      ),
                      secondChild: ColorPicker(
                        color: controller.note.color,
                        onChange: controller.note.setColor,
                      ),
                      crossFadeState: controller.colorPickerVisible
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
