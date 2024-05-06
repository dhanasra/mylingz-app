import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';
import 'package:mylingz_app/pages/auth/signup/signup_viewmodel.dart';
import 'package:mylingz_app/routes/app_routes.dart';
import 'package:mylingz_app/utils/validator.dart';

import '../../../utils/toast.dart';
import '../../../widgets/styled_button.dart';
import '../bloc/auth_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late SignupViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SignupViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Success) {
          context.goto(Routes.home, clear: true);
        } else if (state is Error && state.msg != null) {
          Toast.show(context, message: state.msg!, type: "error");
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
                    "SIGNUP".hl(context),
                    24.h(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "First Name".ts(context),
                              8.h(),
                              TextFormField(
                                controller: _viewModel.fnameController,
                                validator: (v) =>
                                    Validator.validateNonNullOrEmpty(
                                        v, "First Name"),
                                decoration: InputDecoration(
                                    hintText: "Enter first name".tr()),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        12.w(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Last Name".ts(context),
                              8.h(),
                              TextFormField(
                                controller: _viewModel.lnameController,
                                validator: (v) =>
                                    Validator.validateNonNullOrEmpty(
                                        v, "Last Name"),
                                decoration: InputDecoration(
                                    hintText: "Enter last name".tr()),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    12.h(),
                    "Email Address".ts(context),
                    8.h(),
                    TextFormField(
                      controller: _viewModel.emailController,
                      validator: (v) => Validator.validateEmail(v),
                      decoration: InputDecoration(
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
                            validator: (v) => Validator.isValidPassword(v),
                            obscureText: !value,
                            decoration: InputDecoration(
                                errorMaxLines: 2,
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return StyledButton(
                          loading: state is Loading,
                          onClick: () => _viewModel.createAccount(context),
                          text: "SIGNUP".toUpperCase());
                      },
                    ),
                    32.h(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Already have an account?".ts(context),
                        8.w(),
                        InkWell(
                          onTap: () => context.back(),
                          child: "Login".ts(context),
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
