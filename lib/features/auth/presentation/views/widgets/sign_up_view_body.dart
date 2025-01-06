import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/Navigator_to_auth.dart';
import 'package:recpie_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:recpie_app/features/auth/presentation/views/widgets/text_button_sign_in.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/header_desc_text.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../preferences_view.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          navigatorPushAndRemove(context, const SignUpPreferencesView());
        }
        if (state is AuthRegisterFailure) {
          customShowToast(state.errMess);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(
                    child: HeaderDescText(
                  title: 'Sign Up',
                  subTitle: 'Please sign up to get started',
                )),
                const SizedBox(
                  height: 40,
                ),
                Text('Name', style: AppFonts.bodyText18),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                  keyboardText: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Email', style: AppFonts.bodyText18),
                CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    keyboardText: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email is required';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text('Phone Number', style: AppFonts.bodyText18),
                CustomTextFormField(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  prefixIcon: Icons.phone,
                  keyboardText: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is required';
                    }
                    if (value.length < 11) {
                      return 'Phone Number is invalid';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Password', style: AppFonts.bodyText18),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: cubit.suffixIcon,
                  suffixOnPressed: () {
                    cubit.togglePasswordVisibility();
                  },
                  obscureText: cubit.isHidden,
                  keyboardText: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be greater than six characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ConditionalBuilder(
                  condition: state is! AuthRegisterLoading,
                  builder: (context) => CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.register(
                            password: passwordController.text,
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text);
                      }
                    },
                  ),
                  fallback: (context) => customLoadingIndicator(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextButtonSIgnIn(),
              ],
            ),
          ),
        );
      },
    );
  }
}
