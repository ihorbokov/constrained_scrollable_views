import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Signature for the [BoxConstraints] builder.
typedef BoxConstraintsBuilder = BoxConstraints Function(
  BoxConstraints constraints,
);

/// {@template constrained_scroll_view}
/// A constrained box in which a single widget can be scrolled.
///
/// It's combination of [SingleChildScrollView] and [LayoutBuilder].
/// [ConstrainedScrollView] includes all configuration of those widgets.
/// {@endtemplate}
class ConstrainedScrollView extends StatelessWidget {
  /// {@macro constrained_scroll_view}
  const ConstrainedScrollView({
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.constraintsBuilder,
    this.child,
    Key? key,
  }) : super(key: key);

  /// {@macro flutter.widgets.singleChildScrollView.scrollDirection}
  ///
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

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

  /// Builder for the constraints to impose on the [ConstrainedScrollView]'s
  /// child.
  ///
  /// Default constraints in case [constraintsBuilder] isn't defined:
  /// ```dart
  /// BoxConstraints(
  ///   minWidth: constraints.maxWidth,
  ///   minHeight: constraints.maxHeight,
  /// );
  /// ```
  final BoxConstraintsBuilder? constraintsBuilder;

  /// {@macro flutter.widgets.singleChildScrollView.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final BoxConstraints scrollConstraints;
        if (constraintsBuilder != null) {
          scrollConstraints = constraintsBuilder!(constraints);
        } else {
          scrollConstraints = BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          );
        }
        return SingleChildScrollView(
          scrollDirection: scrollDirection,
          reverse: reverse,
          padding: EdgeInsets.zero,
          primary: primary,
          physics: physics,
          controller: controller,
          dragStartBehavior: dragStartBehavior,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          keyboardDismissBehavior: keyboardDismissBehavior,
          child: ConstrainedBox(
            constraints: scrollConstraints,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
