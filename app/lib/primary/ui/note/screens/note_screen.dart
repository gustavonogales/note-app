import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class NoteScreen extends StatelessWidget {
  static const route = '/note';
  final String id;
  final Note note;

  const NoteScreen(this.id, this.note, {super.key});

  Color get color => ColorUtils.fromHex(note.color);

  String get formattedDate {
    initializeDateFormatting();
    var format = DateFormat('MMM dd, yyyy');
    return format.format(DateTime.parse(note.updatedAt));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      return Hero(
        tag: id,
        child: Scaffold(
          backgroundColor: color,
          appBar: TopBar(
            backgroundColor: color,
            actions: [
              ActionButton(
                iconData: FeatherIcons.penTool,
                onPressed: () {},
                color: color,
              ),
              ActionButton(
                iconData: FeatherIcons.edit,
                onPressed: () {},
                color: color,
              )
            ],
          ),
          body: Container(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Spacings.xxxs),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: Spacings.xxxs),
                      Opacity(opacity: 0.5, child: Text(formattedDate)),
                      const SizedBox(height: Spacings.xxs),
                      Text(
                        note.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16, height: 1.7),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
