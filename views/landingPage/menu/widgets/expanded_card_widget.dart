import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/base/constants.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/local_storage.dart';

import '../controllers/menu_controaller.dart';

class ExpandedCardWidget extends StatefulWidget {
  final double borderRadius;
  final IconData? leading;
  final String title;
  final ValueChanged<bool>? onExpansionChanged;
  final Widget bodyWidget;

  const ExpandedCardWidget({
    Key? key,
    this.leading,
    required this.title,
    this.borderRadius = 12.0,
    this.onExpansionChanged,
    required this.bodyWidget,
  }) : super(key: key);

  @override
  State<ExpandedCardWidget> createState() => _ExpandedCardWidgetState();
}

class _ExpandedCardWidgetState extends State<ExpandedCardWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: kDuration200, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = false;
    //PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Color expandColor = AppColors.defaultMainMenuItemTextColor;
  double amount = 0.1;
  FontWeight expandFont = FontWeight.normal;

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
        //  expandColor = AppColors.whiteColor;
        expandFont = FontWeight.bold;
      } else {
        // _controller.reverse();
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
        //expandColor = AppColors.defaultMainMenuItemTextColor;
        expandFont = FontWeight.normal;
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return GetBuilder<MenuController>(
      builder: (controller) {
        return AnimatedBuilder(
          animation: _controller.view,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                color: _isExpanded
                    ? AppColors.expandedMainMenuBackGroundColor
                    : Colors.transparent,
                borderRadius: kRadiusAll20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTileTheme.merge(
                      iconColor: _iconColor.value,
                      textColor: _headerColor.value,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              !_isExpanded
                                  ? AppColors.defaultMainMenuItemColor
                                  : isRTL
                                      ? AppColors.primaryColor
                                      : AppColors.lighten(
                                          AppColors.primaryColor, amount),
                              !_isExpanded
                                  ? AppColors.defaultMainMenuItemColor
                                  : isRTL
                                      ? AppColors.lighten(
                                          AppColors.primaryColor, amount)
                                      : AppColors.primaryColor,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius)),
                        ),
                        child: ListTile(
                          onTap: _handleTap,
                          leading: Icon(widget.leading,
                              color: !_isExpanded
                                  ? AppColors.mainIconColor
                                  : AppColors.whiteColor),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.title,
                                style: GoogleFonts.cairo(
                                    color: _isExpanded
                                        ? AppColors.whiteColor
                                        : AppColors
                                            .defaultMainMenuItemTextColor,
                                    fontWeight: expandFont),
                              ),
                            ],
                          ),
                          trailing: RotationTransition(
                            turns: _iconTurns,
                            child: Icon(Icons.keyboard_arrow_down,
                                color: !_isExpanded
                                    ? AppColors.mainIconColor
                                    : AppColors.whiteColor),
                          ),
                        ),
                      )),
                  ClipRect(
                    child: Align(
                      heightFactor: _heightFactor.value,
                      child: child,
                    ),
                  ),
                ],
              ),
            );
          },
          child: closed ? null : widget.bodyWidget,
        );
      },
    );
  }
}
