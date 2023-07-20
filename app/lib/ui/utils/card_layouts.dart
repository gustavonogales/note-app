final class Layout {
  final int crossAxisCellCount;
  final int mainAxisCellCount;

  const Layout(this.crossAxisCellCount, this.mainAxisCellCount);
}

const List<List<Layout>> cardLayouts = [
  [
    Layout(2, 2),
    Layout(2, 2),
    Layout(4, 2),
    Layout(2, 4),
    Layout(2, 2),
    Layout(2, 2),
  ],
  [
    Layout(2, 4),
    Layout(2, 2),
    Layout(2, 2),
    Layout(4, 2),
    Layout(2, 2),
    Layout(2, 2),
    Layout(2, 4),
  ],
  [
    Layout(4, 2),
    Layout(2, 4),
    Layout(2, 2),
    Layout(2, 2),
    Layout(2, 2),
    Layout(2, 2),
  ],
];
