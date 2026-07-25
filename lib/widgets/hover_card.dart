import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? hoverBorderColor;

  const HoverCard({
    super.key,
    required this.child,
    this.borderRadius,
    this.hoverBorderColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(16);
    final borderColor = _isHovered
        ? (widget.hoverBorderColor ?? AppTheme.cyanAccent)
        : AppTheme.cardBorder;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.diagonal3Values(1.015, 1.015, 1.0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: effectiveBorderRadius,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: (widget.hoverBorderColor ?? AppTheme.cyanAccent)
                        .withValues(alpha: 0.15),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
          border: Border.all(
            color: borderColor,
            width: _isHovered ? 1.5 : 1.0,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
