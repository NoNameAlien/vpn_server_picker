import 'package:flutter/material.dart';
import 'package:vpn_server_picker/core/theme/app_colors.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centered;

  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: centered
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    if (centered) return Center(child: content);
    return Align(alignment: Alignment.topCenter, child: content);
  }
}
