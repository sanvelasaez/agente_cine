import 'package:agente_cine/config/theme/app_colors.dart';
import 'package:agente_cine/config/theme/app_dimensions.dart';
import 'package:agente_cine/core/utils/image_url_builder.dart';
import 'package:agente_cine/domain/entities/cast_member.dart';
import 'package:agente_cine/presentation/shared/extensions/context_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Movie cast section
class MovieCastSection extends StatelessWidget {
  const MovieCastSection({
    required this.cast,
    super.key,
  });

  final List<CastMember>? cast;

  @override
  Widget build(BuildContext context) {
    if (cast == null || cast!.isEmpty) {
      return const SizedBox.shrink();
    }

    final displayCast = cast!.take(10).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cast',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingS),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: displayCast.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppDimensions.spacingM),
            itemBuilder: (context, index) {
              final member = displayCast[index];
              return _CastMemberCard(member: member);
            },
          ),
        ),
      ],
    );
  }
}

class _CastMemberCard extends StatelessWidget {
  const _CastMemberCard({required this.member});

  final CastMember member;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
            child: SizedBox(
              width: 80,
              height: 80,
              child: member.profilePath != null
                  ? CachedNetworkImage(
                      imageUrl: ImageUrlBuilder.profile(member.profilePath),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ColoredBox(
                        color: AppColors.surfaceVariant,
                        child: Icon(Icons.person),
                      ),
                      errorWidget: (context, url, error) => const ColoredBox(
                        color: AppColors.surfaceVariant,
                        child: Icon(Icons.person),
                      ),
                    )
                  : const ColoredBox(
                      color: AppColors.surfaceVariant,
                      child: Icon(Icons.person),
                    ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXs),
          Text(
            member.name,
            style: context.textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
