import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/social_link.dart';
import 'package:mylingz_app/pages/biolink/social_icons/social_icons_viewmodel.dart';
import 'package:mylingz_app/utils/utils.dart';

import '../../../widgets/styled_button.dart';
import '../bloc/bio_link_bloc.dart';

class SocialIconsView extends StatefulWidget {
  const SocialIconsView({super.key});

  @override
  State<SocialIconsView> createState() => _SocialIconsViewState();
}

class _SocialIconsViewState extends State<SocialIconsView> {
  late SocialIconsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SocialIconsViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioLinkBloc, BioLinkState>(
      listener: (context, state) {
        if(state is Success){
          context.back();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Social Links"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: _viewModel.icons,
                          builder: (_, val, __) {
                            return ReorderableListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              itemCount: val.length,
                              itemBuilder: (_, idx) {
                                final item = val[idx];
                                return _buildItem(item, idx);
                              },
                              onReorder: (oldIndex, newIndex) {
                                if (newIndex > oldIndex) {
                                  newIndex -= 1;
                                }
                                _viewModel.reOrderList(oldIndex, newIndex);
                              },
                            );
                          }),
                      GestureDetector(
                        onTap: () => _viewModel.addSocialLink(context),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.background,
                              border:
                                  Border.all(color: const Color(0xFFd6d6d7))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add, size: 20),
                              8.w(),
                              "Add Social Icon".ts(context)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    child: StyledButton(
                        onClick: () => context.read<BioLinkBloc>().add(
                            SaveSocialLinksEvent(
                                links: _viewModel.icons.value)),
                        text: "SAVE"))
              ],
            ),
          )),
    );
  }

  Widget _buildItem(SocialLink button, int index) {
    return Container(
      key: Key('$index'),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFd6d6d7))),
      child: ListTile(
        onTap: () => {},
        contentPadding: const EdgeInsets.only(left: 16, right: 12),
        leading: const Icon(Icons.drag_indicator_rounded, color: Colors.grey),
        title: Row(
          children: [
            Image.network(
              getIconUrl("colored", button.name.toLowerCase()),
              width: 50,
            ),
            12.w(),
            Expanded(child: Text(button.name)),
          ],
        ),
        trailing:
            const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey),
      ),
    );
  }
}
