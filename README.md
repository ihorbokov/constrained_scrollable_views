# Constrained Scrollable Views

<p>
<a href="https://pub.dev/packages/constrained_scrollable_views"><img src="https://img.shields.io/pub/v/constrained_scrollable_views.svg" alt="Pub"></a>
<a href="https://pub.dev/packages/very_good_analysis"><img src="https://img.shields.io/badge/style-very_good_analysis-B22C89.svg" alt="style: very good analysis"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

Set of useful scrollable views that includes `ConstrainedScrollView`, `ScrollableColumn`, and `ScrollableRow`.
* `ConstrainedScrollView` is a combination of `LayoutBuilder` and `SingleChildScrollView`.
* `ScrollableColumn` is `Column` wrapped by `ConstrainedScrollView`.
* `ScrollableRow` is `Row` wrapped by `ConstrainedScrollView`.

## Usage
Example of using `ConstrainedScrollView`:
```dart
ConstrainedScrollView(
  padding: const EdgeInsets.all(8),
  physics: const BouncingScrollPhysics(),
  constraintsBuilder: (constraints) => BoxConstraints(
    minWidth: constraints.maxWidth,
    minHeight: constraints.maxHeight,
  ),
  child: const Center(
    child: Text('ScrollView value'),
  ),
)
```

Example of using `ScrollableColumn`:
```dart
ScrollableColumn(
  padding: const EdgeInsets.all(8),
  physics: const BouncingScrollPhysics(),
  constraintsBuilder: (constraints) => BoxConstraints(
    minHeight: constraints.maxHeight,
  ),
  children: [
    for (var i = 0; i <= 100; i++)
      Padding(
        padding: const EdgeInsets.all(4),
        child: Text('Column value: $i'),
      ),
  ],
)
```

Example of using `ScrollableRow`:
```dart
ScrollableRow(
  padding: const EdgeInsets.all(8),
  physics: const BouncingScrollPhysics(),
  constraintsBuilder: (constraints) => BoxConstraints(
    minWidth: constraints.maxWidth,
  ),
  children: [
    for (var i = 0; i <= 100; i++)
      Padding(
        padding: const EdgeInsets.all(4),
        child: Text('Row value: $i'),
      ),
  ],
)
```
