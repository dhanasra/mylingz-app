import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/constants/assets_const.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/auth/login/login_viewmodel.dart';
import 'package:mylingz_app/routes/app_routes.dart';

import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';
import '../bloc/auth_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel _viewModel;

  @override
  void initState() {
    _viewModel = LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is Success){
          context.goto(Routes.home, clear: true);
        }
      },
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: _viewModel.mode,
            builder: (_, val, __) {
              return Form(
                key: _viewModel.formkey,
                autovalidateMode: val,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  children: [
                    "LOGIN".hl(context),
                    24.h(),
                    "Email Address".ts(context),
                    8.h(),
                    TextFormField(
                      controller: _viewModel.emailController,
                      validator: (v) =>
                          Validator.validateNonNullOrEmpty(v, "Email address"),
                      decoration:
                          InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: "Enter email address".tr()),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    12.h(),
                    "Password".ts(context),
                    8.h(),
                    ValueListenableBuilder(
                        valueListenable: _viewModel.passwordVisible,
                        builder: (_, value, __) {
                          return TextFormField(
                            controller: _viewModel.pwController,
                            validator: (v) =>
                                Validator.validateNonNullOrEmpty(v, "Password"),
                            obscureText: !value,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outlined),
                                hintText: "Enter password",
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        _viewModel.passwordVisible.value =
                                            !_viewModel.passwordVisible.value,
                                    icon: Icon(_viewModel.passwordVisible.value
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined))),
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        }),
                    64.h(),
                    StyledButton(
                        onClick: ()=>_viewModel.loginAccount(context),
                        text: "LOGIN".toUpperCase()),
                    32.h(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Divider()),
                        8.w(),
                        "OR".tl(context),
                        8.w(),
                        const SizedBox(
                          width: 80,
                          child: Divider())
                      ],
                    ),
                    32.h(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: ()=>context.read<AuthBloc>().add(GoogleLoginEvent()),
                          child: Image.asset(AssetsConst.google, width: 54)),
                        24.w(),
                        InkWell(
                          onTap: ()=>context.read<AuthBloc>().add(GithubLoginEvent()),
                          child: Image.asset(AssetsConst.github, width: 54))
                      ],
                    ),
                    64.h(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Don't have an account?".ts(context),
                        8.w(),
                        InkWell(
                          onTap: () => context.goto(Routes.signup),
                          child: "Signup".ts(context),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
