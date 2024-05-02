// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/network/models/contact_fields.dart';
import 'package:mylingz_app/pages/biolink/contact_fields/contact_fields_viewmodel.dart';

import '../../../widgets/styled_button.dart';
import '../bloc/bio_link_bloc.dart';

class ContactFieldsView extends StatefulWidget {
  const ContactFieldsView({super.key});

  @override
  State<ContactFieldsView> createState() => _ContactFieldsViewState();
}

class _ContactFieldsViewState extends State<ContactFieldsView> {
  late ContactFieldsViewModel _viewModel;
  int? draggingIndex;
  int? placeholderIndex;

  @override
  void initState() {
    _viewModel = ContactFieldsViewModel();
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
            title: const Text("Contact Form"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: _viewModel.fields,
                          builder: (_, val, __) {
                            return ReorderableListView.builder(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              itemCount: val.length,
                              itemBuilder: (_, idx) {
                                final item = val[idx];
                                return _buildItem(item, idx, (){
                                  _viewModel.fields.value = _viewModel.fields.value.where((e)=>e.id!=item.id).toList();
                                  _viewModel.fields.notifyListeners();
                                });
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
                              "Add Field".ts(context)
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
                            SaveContactFieldsEvent(
                                fields: _viewModel.fields.value)),
                        text: "SAVE"))
              ],
            ),
          )),
    );
  }


  Widget _buildItem(ContactFields fields, int index, VoidCallback onDelete) {
    return Container(
      key: Key('$index'),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFd6d6d7))),
      child: ListTile(
        onTap: () => _viewModel.openLinkEditor(context, field: fields),
        contentPadding: const EdgeInsets.only(left: 16, right: 12),
        leading: const Icon(Icons.drag_indicator_rounded, color: Colors.grey),
        title: Row(
          children: [
            Expanded(child: Text(fields.label)),
            IconButton(
              onPressed: ()=>onDelete(),
              icon: const Icon(Icons.delete_outline_rounded, size: 22,),    
            )
          ],
        ),
        trailing:
            const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey),
      ),
    );
  }
}