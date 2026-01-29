import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_server_picker/core/theme/app_colors.dart';
import 'package:vpn_server_picker/core/theme/app_dimens.dart';
import 'package:vpn_server_picker/features/server_picker/data/mock_servers.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/bloc/server_picker_bloc.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/bloc/server_picker_event.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/bloc/server_picker_state.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/widgets/empty_state.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/widgets/section_title.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/widgets/server_tile.dart';

class ServerPickerPage extends StatelessWidget {
  const ServerPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServerPickerBloc(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TopBar(),
              const SizedBox(height: 10),
              _Tabs(),
              const SizedBox(height: 18),
              _SearchField(),
              const SizedBox(height: 31),
              BlocBuilder<ServerPickerBloc, ServerPickerState>(
                buildWhen: (p, n) => p.tab != n.tab || p.query != n.query,
                builder: (_, state) {
                  if (state.tab != ServerTab.all ||
                      state.query.trim().isNotEmpty) {
                    return const SizedBox.shrink();
                  }
                  return const _MyAccessPointsLabel();
                },
              ),
              const SizedBox(height: 8),
              BlocBuilder<ServerPickerBloc, ServerPickerState>(
                buildWhen: (p, n) => p.query != n.query,
                builder: (_, state) {
                  if (state.query.trim().isNotEmpty) {
                    return const SizedBox.shrink();
                  }
                  return _AddKeyButton();
                },
              ),
              const SizedBox(height: 8),

              Expanded(
                child: BlocBuilder<ServerPickerBloc, ServerPickerState>(
                  buildWhen: (p, n) =>
                      p.tab != n.tab ||
                      p.query != n.query ||
                      p.servers != n.servers ||
                      p.selectedServerId != n.selectedServerId,
                  builder: (context, state) {
                    final items = state.filtered;

                    final pinned =
                        (state.tab == ServerTab.all &&
                            state.query.trim().isEmpty)
                        ? items.where((s) => s.isMine).take(1).toList()
                        : const <ServerItem>[];

                    final rest = pinned.isEmpty
                        ? items
                        : items
                              .where((s) => s.id != pinned.first.id)
                              .toList(growable: false);

                    if (items.isEmpty) {
                      return const EmptyState(
                        centered: false,
                        title: 'Нет результатов',
                        subtitle:
                            'По вашему запросу серверов\nне найдено. Попробуйте изменить\nзапрос или проверьте написание.',
                      );
                    }

                    final order = <String>[];
                    final map = <String, List<ServerItem>>{};
                    for (final s in rest) {
                      map
                          .putIfAbsent(s.country, () {
                            order.add(s.country);
                            return <ServerItem>[];
                          })
                          .add(s);
                    }

                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (pinned.isNotEmpty) ...[
                          ServerTile(
                            item: pinned.first,
                            selected: pinned.first.id == state.selectedServerId,
                            onTap: () => context.read<ServerPickerBloc>().add(
                              ServerSelected(pinned.first.id),
                            ),
                            onFavorite: () => context
                                .read<ServerPickerBloc>()
                                .add(ServerFavoriteToggled(pinned.first.id)),
                            trailingText: null,
                          ),
                          const SizedBox(height: 12),
                        ],
                        if (state.tab == ServerTab.mine)
                          ...items.map(
                            (s) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: ServerTile(
                                item: s,
                                selected: s.id == state.selectedServerId,
                                onTap: () => context
                                    .read<ServerPickerBloc>()
                                    .add(ServerSelected(s.id)),
                                onFavorite: () => context
                                    .read<ServerPickerBloc>()
                                    .add(ServerFavoriteToggled(s.id)),
                                trailingText: s.isMine ? 'Удалить' : null,
                              ),
                            ),
                          )
                        else ...[
                          for (final country in order) ...[
                            SectionTitle(country),
                            ...map[country]!.map(
                              (s) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: ServerTile(
                                  item: s,
                                  selected: s.id == state.selectedServerId,
                                  onTap: () => context
                                      .read<ServerPickerBloc>()
                                      .add(ServerSelected(s.id)),
                                  onFavorite: () => context
                                      .read<ServerPickerBloc>()
                                      .add(ServerFavoriteToggled(s.id)),
                                  trailingText:
                                      (state.tab == ServerTab.mine && s.isMine)
                                      ? 'Удалить'
                                      : null,
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 8),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          ),
        ),
        const SizedBox(height: 8),
        Text('Точки доступа', style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerPickerBloc, ServerPickerState>(
      buildWhen: (p, n) => p.tab != n.tab,
      builder: (context, state) {
        return Container(
          height: 40,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(AppDimens.r20),
          ),
          child: Row(
            children: [
              _TabButton(
                label: 'Все',
                selected: state.tab == ServerTab.all,
                onTap: () => context.read<ServerPickerBloc>().add(
                  const ServerTabChanged(ServerTab.all),
                ),
              ),
              _TabButton(
                label: 'Мои',
                selected: state.tab == ServerTab.mine,
                onTap: () => context.read<ServerPickerBloc>().add(
                  const ServerTabChanged(ServerTab.mine),
                ),
              ),
              _TabButton(
                label: 'Избранные',
                selected: state.tab == ServerTab.favorites,
                onTap: () => context.read<ServerPickerBloc>().add(
                  const ServerTabChanged(ServerTab.favorites),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          duration: const Duration(milliseconds: 180),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimens.r20),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  late final TextEditingController _c;

  @override
  void initState() {
    super.initState();
    _c = TextEditingController();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServerPickerBloc, ServerPickerState>(
      listenWhen: (p, n) => p.query != n.query,
      listener: (_, state) {
        if (state.query.isEmpty && _c.text.isNotEmpty) _c.clear();
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.panel,
          borderRadius: BorderRadius.circular(AppDimens.r16),
          border: Border.all(color: AppColors.stroke.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              size: 22,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _c,
                onChanged: (v) => context.read<ServerPickerBloc>().add(
                  ServerSearchChanged(v),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyAccessPointsLabel extends StatelessWidget {
  const _MyAccessPointsLabel();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Мои точки доступа',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _AddKeyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.r16),
          ),
        ),
        child: const Text(
          'Добавить ключ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
