import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/config/config.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/screens/note/note_screen_controller.dart';
import 'package:note_app/ui/stores/root_store.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  RootStore get store => locator();
  NoteScreenController get controller => store.noteStore.noteController;
  late final String heroTag;

  TextStyle? get titleTheme => context.theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get bodyTheme => Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(fontSize: 16, height: 1.7);

  @override
  void initState() {
    controller.setNote(store.noteStore.selectedNote);
    heroTag = controller.note.id;
    super.initState();
  }

  void _edit() {
    controller.setEditMode(!controller.editMode);
  }

  void _toggleColorPicker() {
    FocusScope.of(context).unfocus();
    controller.setColorPickerVisible(
      !controller.colorPickerVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      return ReactionBuilder(
        builder: (context) =>
            reaction((_) => controller.messageText, (messageText) {
          if (messageText.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              Toast(
                context: context,
                message: messageText,
                type: ToastType.error,
              ),
            );
          }
        }),
        child: Observer(builder: (context) {
          return Hero(
            tag: heroTag,
            child: GestureDetector(
              onTap: () {
                if (controller.colorPickerVisible) {
                  controller.setColorPickerVisible(false);
                }
              },
              child: Scaffold(
                backgroundColor: controller.note.color.uiColor,
                appBar: TopBar(
                  backgroundColor: controller.note.color.uiColor,
                  actions: [
                    ActionButton(
                      tooltip: context.l10n.changeColor,
                      iconData: FeatherIcons.penTool,
                      onPressed: _toggleColorPicker,
                      color: controller.note.color.uiColor,
                    ),
                    if (!controller.editMode)
                      ActionButton(
                        tooltip: context.l10n.switchToEditMode,
                        iconData: FeatherIcons.edit,
                        onPressed: _edit,
                        color: controller.note.color.uiColor,
                      ),
                    if (controller.editMode)
                      ActionButton(
                        tooltip: context.l10n.saveChanges,
                        iconData: FeatherIcons.save,
                        onPressed: controller.save,
                        color: controller.note.color.uiColor,
                      ),
                    if (controller.editMode)
                      ActionButton(
                        tooltip: context.l10n.cancel,
                        iconData: FeatherIcons.x,
                        onPressed: controller.cancel,
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
                          child: Center(
                            child: SizedBox(
                              width: 700,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: controller.titleController,
                                    enabled: controller.editMode,
                                    maxLines: null,
                                    style: titleTheme,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: context.l10n.title,
                                      hintStyle: titleTheme?.copyWith(
                                        color: titleTheme?.color?.lighten(30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: Spacings.xxxs),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      context.l10n.updatedAt(
                                        DateTime.parse(
                                            controller.note.updatedAt),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: Spacings.xxs),
                                  TextFormField(
                                    controller: controller.textController,
                                    enabled: controller.editMode,
                                    maxLines: null,
                                    style: bodyTheme,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: context.l10n.typeSomething,
                                      hintStyle: bodyTheme?.copyWith(
                                        color: bodyTheme?.color?.lighten(30),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Spacings.xxxs),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 200),
                            firstChild: const SizedBox(
                              width: 400,
                              height: 0,
                            ),
                            secondChild: SizedBox(
                              width: 400,
                              child: ColorPicker(
                                color: controller.note.color,
                                onChange: controller.changeColor,
                              ),
                            ),
                            crossFadeState: controller.colorPickerVisible
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
