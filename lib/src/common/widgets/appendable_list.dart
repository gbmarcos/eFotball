import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// A custom scroll view which can have items added before[prepend] and after[append] it.
class AppendableList extends StatelessWidget {
  final Widget? append;
  final Widget? prepend;
  final IndexedWidgetBuilder itemBuilder;

  final double? itemExtent;
  final int itemCount;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool animated;
  final Axis scrollDirection;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;

  const AppendableList({
    Key? key,
    this.prepend,
    this.append,
    this.itemExtent,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    required this.itemCount,
    this.animated = false,
    this.shrinkWrap = false,
    this.physics,
    this.scrollController,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final NullableIndexedWidgetBuilder _itemBuilder;
    late final isAnimated = animated && !MediaQuery.of(context).disableAnimations;
    if (!isAnimated) {
      _itemBuilder = itemBuilder;
    } else {
      _itemBuilder = (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 325),
            delay: const Duration(milliseconds: 25),
            child: FadeInAnimation(
              child: itemBuilder(context, index),
            ),
          );
    }

    final _slivers = <Widget>[
      if (prepend != null) SliverToBoxAdapter(child: prepend),
      if (itemExtent != null)
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(_itemBuilder, childCount: itemCount),
          itemExtent: itemExtent!,
        ),
      if (itemExtent == null) SliverList(delegate: SliverChildBuilderDelegate(_itemBuilder, childCount: itemCount)),
      if (append != null) SliverToBoxAdapter(child: append),
    ];

    return AnimationLimiter(
      child: CustomScrollView(
        controller: scrollController,
        scrollDirection: scrollDirection,
        shrinkWrap: shrinkWrap,
        physics: physics,
        slivers: [
          if(padding!=null) SliverPadding(padding: padding!,sliver: MultiSliver(children: _slivers)),
          if(padding==null) ... _slivers,
        ],
      ),
    );
  }
}
