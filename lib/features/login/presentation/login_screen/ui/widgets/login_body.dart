import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/core/app_themes/colors/app_colors.dart';
import 'package:eltakamel/core/utils/app_enums.dart';
import 'package:eltakamel/core/widgets/toast.dart';
import 'package:eltakamel/features/login/presentation/login_screen/logic/login_cubit.dart';
import 'package:eltakamel/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocConsumer, BlocProvider;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helpers/validations/app_form_validations.dart'
    show AppFormValidations;
import '../../../../../../core/utils/service_locator.dart' show sl;

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      padding: REdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.photos.background.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Assets.images.photos.logo.image(width: 0.7.sw, fit: BoxFit.cover),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;
        final cubit = LoginCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Container(
            padding: REdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  'Login',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Sign In to your account',
                  textAlign: TextAlign.start,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                CustomInput(
                  title: 'username or mobile number',
                  icon: Icons.person,
                  type: TextInputType.text,

                  validator: (txt) {
                    if (txt!.isNotEmpty &&
                        AppFormValidations.phoneRegex.hasMatch(txt)) {
                      return AppFormValidations.phoneNumberValidator(txt);
                    } else {
                      return AppFormValidations.userNameValidator(txt);
                    }
                  },
                  onChanged: (String text) {
                    cubit.setUserName(text);
                  },
                  isEnabled: !isLoading,
                ),
                CustomInput(
                  title: 'your password',
                  icon: Icons.lock,
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                  validator:
                      (txt) => AppFormValidations.passwordValidation(txt),
                  onChanged: (String text) {
                    cubit.setPassword(text);
                  },
                  isEnabled: !isLoading,
                ),
                CustomOneChoice(
                  title: 'Language',
                  // controller: TextEditingController(),
                  onChange: (String? text) {
                    cubit.setLanguage(text);
                  },
                  icon: Icons.translate,
                  isEnabled: !isLoading,
                ),
                Divider(color: Colors.grey[300]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        // if(!isLoading)
                        await cubit.login();
                      },
                      child: Container(
                        width: 0.3.sw,
                        height: 40.h,
                        alignment: Alignment.center,
                        color:
                            isLoading
                                ? AppColors.primary.withValues(alpha: 0.3 * 255)
                                : AppColors.primary,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return _ForgetDialog();
                                  },
                                );
                              },
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccessState) {
          context.replace(Routes.homeScreen);
        } else if (state is LoginErrorState) {
          toast(state.message, Status.error);
        }
      },
    );
  }
}

class _ForgetDialog extends StatelessWidget {
  const _ForgetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
    return BlocProvider(
      create: (context) => sl.call<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ForgetSuccessState) {
            toast(
              'Your password is get delivered to your email shortly',
              Status.success,
            );
            context.pop();
          } else if (state is ForgetErrorState) {
            toast('You need to write a valid registered email', Status.error);
          }
        },
        builder: (BuildContext context, LoginState state) {
          final cubit = LoginCubit.get(context);

          return Dialog(
            child: Container(
              padding: REdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 8.h,
                children: [
                  Text('Password Recovery', style: textTheme.displaySmall),
                  Text(
                    'Enter your email address to restore your password',
                    textAlign: TextAlign.start,
                    style: textTheme.bodySmall!.copyWith(color: Colors.grey),
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    onChanged: (text) {
                      cubit.changeRecoveryEmail(text);
                    },
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: textTheme.labelLarge!.copyWith(
                        color: Colors.grey,
                      ),

                      prefixIcon: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Icon(Icons.lock),
                      ),
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder,
                      focusedErrorBorder: inputBorder,
                      errorBorder: inputBorder,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await cubit.forgetPassword();
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        ContinuousRectangleBorder(),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.lightBlue.shade400,
                      ),
                    ),

                    child: Text(
                      'Restore',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.title,
    required this.icon,
    required this.type,
    required this.validator,
    required this.onChanged,
    this.isPassword = false,
    required this.isEnabled,
  });

  final String title;
  final IconData icon;
  final TextInputType type;
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  final bool isPassword;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    );
    final inputHeight = 32.0;
    return SizedBox(
      // height: inputHeight,
      width: 0.95.sw,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: inputHeight,
            height: inputHeight,
            color: Colors.grey[200],
            child: Icon(icon, size: 20.dm),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: type,
              onChanged: onChanged,
              validator: validator,
              obscureText: isPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: isEnabled,
              decoration: InputDecoration(
                hintText: title,
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                // contentPadding: EdgeInsets.zero,
                isDense: true,

                prefixIconConstraints: BoxConstraints(
                  minHeight: inputHeight,
                  maxHeight: inputHeight,
                ),
                suffixIconConstraints: BoxConstraints(
                  minHeight: inputHeight,
                  maxHeight: inputHeight,
                ),
                // contentPadding: const EdgeInsets.symmetric(horizontal: 8.0,),
                constraints: BoxConstraints(
                  minHeight: inputHeight,
                  // maxHeight: inputHeight,
                ),

                border: border,
                focusedBorder: border,
                enabledBorder: border,
                disabledBorder: border,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOneChoice extends StatelessWidget {
  const CustomOneChoice({
    super.key,
    required this.title,
    required this.icon,
    required this.isEnabled,
    this.onChange,
  });

  final String title;

  // final TextEditingController controller;
  final IconData icon;
  final bool isEnabled;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    );
    final inputHeight = 32.0;
    return SizedBox(
      height: inputHeight,
      width: 0.95.sw,
      child: Row(
        children: [
          Container(
            width: inputHeight,
            height: inputHeight,
            color: Colors.grey[200],
            child: Icon(icon, size: 20.dm),
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabled: isEnabled,
                hintText: 'Option 1',
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                disabledBorder: border,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
              value: 'Arabic',
              items:
                  ['Arabic', 'English']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: isEnabled ? onChange : null,
            ),
          ),
        ],
      ),
    );
  }
}
