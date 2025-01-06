import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

import '../../../../../core/Views/widgets/custom_back_button.dart';
import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/header_desc_text.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthResetPasswordSuccess) {
          customShowToast('Email sent successfully,please check your mail');
          Navigator.pop(context);
        }
        if (state is AuthResetPasswordFailure) {
          customShowToast(state.errMess);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  children: [
                    const Center(
                      child: HeaderDescText(
                        title: 'Forgot Password',
                        subTitle:
                            'Enter your email address associated with your account and we will send you instructions to reset your password',
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text('Email address', style: AppFonts.bodyText18),
                    CustomTextFormField(
                      controller: emailController,
                      keyboardText: TextInputType.emailAddress,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ConditionalBuilder(
                      condition: state is! AuthResetPasswordLoading,
                      builder: (context) => CustomButton(
                        height: 50,
                        text: 'Reset Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .forgotPassword(email: emailController.text);
                          }
                        },
                      ),
                      fallback: (context) => customLoadingIndicator(),
                    ),
                  ],
                ),
              ),
            ),
            // Custom Back Button at the top
            const Positioned(
              top: 30, // Adjust to match your layout
              left: 12, // Align it properly
              child: CustomBackButton(),
            ),
          ],
        );
      },
    );
  }
}
