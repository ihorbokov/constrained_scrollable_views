import 'package:constrained_scrollable_views/src/constrained_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// {@template scrollable_column}
/// A scrollable vertical array of children.
///
/// It's combination of [Column] and [ConstrainedScrollView].
/// [ScrollableColumn] includes all configuration of those widgets.
/// {@endtemplate}
class ScrollableColumn extends StatelessWidget {
  /// {@macro scrollable_column}
  const ScrollableColumn({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.flexible = true,
    this.constraintsBuilder,
    Key? key,
  }) : super(key: key);

  /// {@macro flutter.widgets.column.children}
  final List<Widget> children;

  /// {@macro flutter.widgets.column.mainAxisAlignment}
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// {@macro flutter.widgets.column.mainAxisSize}
  ///
  /// Defaults to [MainAxisSize.max].
  final MainAxisSize mainAxisSize;

  /// {@macro flutter.widgets.column.crossAxisAlignment}
  ///
  /// Defaults to [CrossAxisAlignment.center].
  final CrossAxisAlignment crossAxisAlignment;

  /// {@macro flutter.widgets.column.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.column.verticalDirection}
  ///
  /// Defaults to [VerticalDirection.down].
  final VerticalDirection verticalDirection;

  /// {@macro flutter.widgets.column.textBaseline}
  final TextBaseline? textBaseline;

  /// {@macro flutter.widgets.singleChildScrollView.reverse}
  ///
  /// Defaults to false.
  final bool reverse;

  /// {@macro flutter.widgets.singleChildScrollView.padding}
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry padding;

  /// {@macro flutter.widgets.singleChildScrollView.primary}
  final bool? primary;

  /// {@macro flutter.widgets.singleChildScrollView.physics}
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.singleChildScrollView.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.singleChildScrollView.dragStartBehavior}
  ///
  /// Defaults to [DragStartBehavior.start].
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.singleChildScrollView.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// {@macro flutter.widgets.singleChildScrollView.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.singleChildScrollView.keyboardDismissBehavior}
  ///
  /// Defaults to [ScrollViewKeyboardDismissBehavior.manual].
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// Sizes the [ScrollableColumn] to the [Column]'s intrinsic height in case
  /// if [flexible] is false.
  ///
  /// Defaults to true.
  final bool flexible;

  /// Builder for the constraints to impose on the [ScrollableColumn]'s
  /// child.
  ///
  /// Default constraints in case [constraintsBuilder] isn't defined:
  /// ```dart
  /// BoxConstraints(
  ///   minHeight: constraints.maxHeight,
  /// );
  /// ```
  final BoxConstraintsBuilder? constraintsBuilder;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );
    return ConstrainedScrollView(
      reverse: reverse,
      primary: primary,
      padding: padding,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      constraintsBuilder: (constraints) =>
          constraintsBuilder?.call(constraints) ??
          BoxConstraints(minHeight: constraints.maxHeight),
      child: flexible ? child : IntrinsicHeight(child: child),
    );
  }
}
