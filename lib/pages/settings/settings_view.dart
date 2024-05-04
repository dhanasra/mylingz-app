import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/routes/app_routes.dart';

import '../../common/theme/theme_cubit.dart';
import '../../constants/string_const.dart';
import '../../utils/utils.dart';
import 'bloc/account_bloc.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SettingsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SettingsViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if(state is AccountDeleted || state is LoggedOut){
          context.goto(Routes.splash, clear: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConst.settings).tr(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            StringConst.general.ts(context),

            8.h(),

            ListTile(
                onTap: () => _viewModel.openLanguageSheet(context),
                leading: const Icon(Icons.language_outlined, size: 20),
                contentPadding: const EdgeInsets.only(left: 16, right: 16),
                title: const Text(StringConst.languageOpt).tr(),
                trailing:
                    (getLanguage(context.locale.languageCode).toUpperCase())
                        .ts(context, color: Theme.of(context).primaryColor)),
            ListTile(
                onTap: () => _viewModel.openThemeSheet(context),
                leading: const Icon(Icons.color_lens_outlined, size: 20),
                contentPadding: const EdgeInsets.only(left: 16, right: 16),
                title: const Text(StringConst.themeOpt).tr(),
                trailing: (context.read<ThemeCubit>().state.name.toUpperCase())
                    .ts(context, color: Theme.of(context).primaryColor)),
            // ListTile(
            //   leading: const Icon(Icons.history_outlined, size: 20),
            //   title: const Text(StringConst.addToHistoryOpt).tr(),
            //   contentPadding: const EdgeInsets.only(left: 16),
            //   trailing: Checkbox(value: Global.addScanToHistory, onChanged: (v){
            //     _viewModel.updateSettings("addScanToHistory", v);
            //     setState(() {});
            //   }),
            // ),

            16.h(),

            StringConst.feedback.ts(context),

            8.h(),

            ListTile(
              onTap: () => _viewModel.recommendApp(),
              leading: const Icon(Icons.thumb_up_alt_outlined, size: 20),
              title: const Text(StringConst.recommendopt).tr(),
            ),
            ListTile(
              onTap: () => _viewModel.rateApp(context),
              leading: const Icon(Icons.star_border, size: 20),
              title: const Text(StringConst.rateOpt).tr(),
            ),
            ListTile(
              onTap: () => _viewModel.sendReportOrFeedback("Report"),
              leading: const Icon(Icons.flag_outlined, size: 20),
              title: const Text(StringConst.reportOpt).tr(),
            ),
            ListTile(
              onTap: () => _viewModel.sendReportOrFeedback("Feedback"),
              leading: const Icon(Icons.message_outlined, size: 20),
              title: const Text(StringConst.feedbackOpt).tr(),
            ),

            16.h(),

            StringConst.account.ts(context),

            8.h(),
            ListTile(
              onTap: () => _viewModel.openConfirmSheet(context, "signout"),
              leading: const Icon(Icons.logout, size: 20),
              title: const Text(StringConst.signOutOpt).tr(),
            ),
            ListTile(
              textColor: Colors.red,
              iconColor: Colors.red,
              onTap: () => _viewModel.openConfirmSheet(context, "delete"),
              leading: const Icon(Icons.delete_outline, size: 20),
              title: const Text(StringConst.deleteOpt).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
