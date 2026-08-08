import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? hoverBorderColor;
  final Color? backgroundColor;

  const HoverCard({
    super.key,
    required this.child,
    this.borderRadius,
    this.hoverBorderColor,
    this.backgroundColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(16);
    final activeColor = widget.hoverBorderColor ?? AppTheme.blueAccent;
    final bgColor = widget.backgroundColor ?? AppTheme.surface;

    return MouseRegion(
      hitTestBehavior: HitTestBehavior.opaque,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.025 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.surfaceLight : bgColor,
            borderRadius: borderRadius,
            border: Border.all(
              color: _isHovered ? activeColor : AppTheme.cardBorder,
              width: _isHovered ? 2.0 : 1.0,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.35),
                      blurRadius: 24,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
