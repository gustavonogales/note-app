import 'dart:math';
import 'dart:ui';

import '../extensions/color_utils_extension.dart';

enum NoteColor {
  sunset(hexColor: '#FFCC80', name: 'Sunset'),
  melon(hexColor: '#FFAB91', name: 'Melon'),
  mindaro(hexColor: '#E6EE9B', name: 'Mindaro'),
  nonPhotoBlue(hexColor: '#80DEEA', name: 'Non Photo blue'),
  wisteria(hexColor: '#CF93D9', name: 'Wisteria'),
  ticleMePink(hexColor: '#F48FB1', name: 'Tickle me pink'),
  tiffanyBlue(hexColor: '#80CBC4', name: 'Tiffany Blue'),
  lightGreen(hexColor: '#B6FFAD', name: 'Light green'),
  rosyBrown(hexColor: '#CDA2AA', name: 'Rosy brown'),
  powderBlue(hexColor: '#BACADE', name: 'Powder blue');

  const NoteColor({required this.hexColor, required this.name});

  final String hexColor;
  final String name;

  static List<NoteColor> get colors =>
      NoteColor.values.map((value) => value).toList();

  static NoteColor get randomColor => colors[Random().nextInt(colors.length)];

  static NoteColor fromHex(String hexColor) =>
      colors.firstWhere((color) => color.hexColor == hexColor);

  Color get uiColor => ColorUtils.fromHex(hexColor);
}
