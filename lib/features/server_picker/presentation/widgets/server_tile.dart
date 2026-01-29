import 'package:flutter/material.dart';
import 'package:vpn_server_picker/core/theme/app_colors.dart';
import 'package:vpn_server_picker/core/theme/app_dimens.dart';
import 'package:vpn_server_picker/features/server_picker/data/mock_servers.dart';
import 'package:country_flags/country_flags.dart';

class ServerTile extends StatelessWidget {
  final ServerItem item;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onFavorite;
  final String? trailingText;

  const ServerTile({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
    required this.onFavorite,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimens.r16),
          border: Border.all(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.9)
                : AppColors.stroke.withValues(alpha: 0.35),
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.0),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : const [],
        ),
        child: Row(
          children: [
            _FlagCircle(code: item.countryCode),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${item.latencyMs} мс',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFFD4D4D),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
            ],
            GestureDetector(
              onTap: onFavorite,
              behavior: HitTestBehavior.opaque,
              child: Icon(
                item.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 20,
                color: item.isFavorite
                    ? AppColors.heartActive
                    : AppColors.heartInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FlagCircle extends StatelessWidget {
  final String code;
  const _FlagCircle({required this.code});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 36,
        height: 36,
        child: CountryFlag.fromCountryCode(code),
      ),
    );
  }
}
