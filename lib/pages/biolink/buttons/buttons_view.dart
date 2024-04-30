import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/bio_link_button.dart';
import 'package:mylingz_app/pages/biolink/bloc/bio_link_bloc.dart';
import 'package:mylingz_app/pages/biolink/buttons/buttons_viewmodel.dart';
import 'package:mylingz_app/widgets/styled_button.dart';

class ButtonsView extends StatefulWidget {
  const ButtonsView({super.key});

  @override
  State<ButtonsView> createState() => _ButtonsViewState();
}

class _ButtonsViewState extends State<ButtonsView> {
  late ButtonsViewModel _viewModel;
  int? draggingIndex;
  int? placeholderIndex;

  @override
  void initState() {
    _viewModel = ButtonsViewModel();
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
            title: const Text("Button Links"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: _viewModel.buttons,
                          builder: (_, val, __) {
                            return ReorderableListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              itemCount: val.length,
                              itemBuilder: (_, idx) {
                                final item = val[idx];
                                return _buildItem(item, idx,
                                    (e) => _viewModel.updateSwitch(item.id, e));
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
                        onTap: () => _viewModel.openLinkEditor(context),
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
                              "Add Link".ts(context)
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
                            SaveButtonsEvent(
                                buttons: _viewModel.buttons.value)),
                        text: "SAVE"))
              ],
            ),
          )),
    );
  }

  Widget _buildItem(BioLinkButton button, int index, ValueChanged? onChanged) {
    return Container(
      key: Key('$index'),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFd6d6d7))),
      child: ListTile(
        onTap: () => _viewModel.openLinkEditor(context, btn: button),
        contentPadding: const EdgeInsets.only(left: 16, right: 12),
        leading: const Icon(Icons.drag_indicator_rounded, color: Colors.grey),
        title: Row(
          children: [
            Expanded(child: Text(button.text)),
            SizedBox(
                width: 40,
                height: 26,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                        value: button.enabled,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: onChanged)))
          ],
        ),
        trailing:
            const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey),
      ),
    );
  }
}
