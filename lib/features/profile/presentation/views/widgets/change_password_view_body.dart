import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';
import 'package:recpie_app/features/profile/presentation/manager/Change_password_cubit/change_password_cubit.dart';
import 'package:recpie_app/features/profile/presentation/manager/Change_password_cubit/change_password_state.dart';

import '../../../../../core/Views/widgets/custom_back_button.dart';
import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/header_desc_text.dart';
import '../../../../../core/styles/fonts.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController oldPassController = TextEditingController();

  final TextEditingController newPassController = TextEditingController();

  final TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          customShowToast('Password Changed Successfully');
          newPassController.clear();
          confirmPassController.clear();
          oldPassController.clear();
          Navigator.pop(context);
        }
        if (state is ChangePasswordFailure) {
          customShowToast(state.error);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<ChangePasswordCubit>(context);

        return Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomBackButton()),
              ),
              const Center(
                child: HeaderDescText(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    title: 'New Password',
                    subTitle:
                        'your new password must be different from previously used passwords'),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
                child: Text('Current Password', style: AppFonts.bodyText16),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: CustomTextFormField(
                  controller: oldPassController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: cubit.suffixIcon1,
                  obscureText: cubit.isHidden1,
                  keyboardText: TextInputType.visiblePassword,
                  suffixOnPressed: () {
                    cubit.togglePasswordVisibility(1);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your password must not be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (newValue) {
                    oldPassController.text = newValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
                child: Text('New Password', style: AppFonts.bodyText16),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: CustomTextFormField(
                  controller: newPassController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: cubit.suffixIcon2,
                  obscureText: cubit.isHidden2,
                  keyboardText: TextInputType.visiblePassword,
                  suffixOnPressed: () {
                    cubit.togglePasswordVisibility(2);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your password must not be empty';
                    }
                    if (value.length < 6) {
                      return 'Password must be greater than six characters';
                    }
                    if (value != confirmPassController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onFieldSubmitted: (newValue) {
                    newPassController.text = newValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
                child: Text('Confirm Password', style: AppFonts.bodyText16),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: CustomTextFormField(
                  controller: confirmPassController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: cubit.suffixIcon3,
                  obscureText: cubit.isHidden3,
                  keyboardText: TextInputType.visiblePassword,
                  suffixOnPressed: () {
                    cubit.togglePasswordVisibility(3);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your password must not be empty';
                    }
                    if (value != newPassController.text) {
                      return 'Passwords do not match';
                    }
                    if (value.length < 6) {
                      return 'Password must be greater than six characters';
                    }
                    return null;
                  },
                  onFieldSubmitted: (newValue) {
                    confirmPassController.text = newValue!;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30.0),
                child: (state is! ChangePasswordLoading)
                    ? CustomButton(
                        height: 50,
                        text: 'Create New Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (newPassController.text ==
                                confirmPassController.text) {
                              cubit.changePasswordFromProfile(
                                currentPassword: oldPassController.text,
                                newPassword: newPassController.text,
                              );
                            }
                          }
                        },
                      )
                    : customLoadingIndicator(),
              )
            ],
          ),
        );
      },
    );
  }
}
