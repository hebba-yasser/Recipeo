import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/Views/widgets/custom_text_form_field.dart';
import 'package:recpie_app/core/styles/fonts.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';

import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../manager/update_profile_cubit/update_profile_state.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: AppFonts.bodyText16,
            ),
            CustomTextFormField(
              minWidthPrefixIcon: 0,
              controller: cubit.nameController,
              keyboardText: TextInputType.name,
              onFieldSubmitted: (newValue) {},
              onSaved: (newValue) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Your name must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: AppFonts.bodyText16,
            ),
            BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateEmailSuccess) {
                  customShowToast('Email updated successfully');

                  return Navigator.pop(context);
                } else if (state is UpdateEmailFailure) {
                  customShowToast(
                      'There was an error while updating your email,please try again');
                }
              },
              builder: (context, state) {
                return CustomTextFormField(
                  minWidthPrefixIcon: 0,
                  controller: cubit.emailController,
                  keyboardText: TextInputType.emailAddress,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your email must not be empty';
                    }
                    return null;
                  },
                  onTap: () {
                    // customShowDialog(
                    //   context: context,
                    //   title: 'Update Your Email',
                    //   widgetContent: Form(
                    //     key: cubit.formKey2,
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Password',
                    //           style: AppFonts.bodyText16,
                    //         ),
                    //         CustomTextFormField(
                    //           minWidthPrefixIcon: 0,
                    //           controller: cubit.passwordController,
                    //           keyboardText: TextInputType.visiblePassword,
                    //           obscureText: false,
                    //           onFieldSubmitted: (newValue) {},
                    //           onSaved: (newValue) {},
                    //           validator: (value) {
                    //             if (value == null || value.isEmpty) {
                    //               return 'Your password must not be empty';
                    //             }
                    //             return null;
                    //           },
                    //         ),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //         Text(
                    //           'Email',
                    //           style: AppFonts.bodyText16,
                    //         ),
                    //         CustomTextFormField(
                    //           minWidthPrefixIcon: 0,
                    //           controller: cubit.emailController,
                    //           keyboardText: TextInputType.emailAddress,
                    //           onFieldSubmitted: (newValue) {},
                    //           onSaved: (newValue) {},
                    //           validator: (value) {
                    //             if (value == null || value.isEmpty) {
                    //               return 'Your Email must not be empty';
                    //             }
                    //             return null;
                    //           },
                    //         ),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //         if (state is UpdateEmailLoading)
                    //           Text(
                    //             'We \'ve sent you an email with a verification link. Please click the link to complete your email update.',
                    //             style: AppFonts.bodyText16,
                    //           ),
                    //       ],
                    //     ),
                    //   ),
                    //   titleButton1: 'cancel',
                    //   titleButton2: 'Update',
                    //   onPressed1: () {
                    //     Navigator.pop(context);
                    //   },
                    //   onPressed2: () {
                    //     if (cubit.formKey2.currentState!.validate()) {
                    //       cubit.updateEmail();
                    //     }
                    //   },
                    // );
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Phone Number',
              style: AppFonts.bodyText16,
            ),
            CustomTextFormField(
              minWidthPrefixIcon: 0,
              controller: cubit.phoneController,
              keyboardText: TextInputType.number,
              onFieldSubmitted: (newValue) {},
              onSaved: (newValue) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Your Phone Number  must not be empty';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

// Future<dynamic> UpdateEmail(BuildContext context, UpdateProfileCubit cubit) {
//   return customShowDialog(
//     context: context,
//     title: 'Update Your Email',
//     widgetContent: Form(
//       key: cubit.formKey2,
//       child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
//         listener: (context, state) {
//           if (state is UpdateEmailSuccess) {
//             customShowToast('Email updated successfully');
//
//             return Navigator.pop(context);
//           } else if (state is UpdateEmailFailure) {
//             customShowToast(
//                 'There was an error while updating your email,please try again');
//           }
//         },
//         builder: (context, state) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Password',
//                 style: AppFonts.bodyText16,
//               ),
//               CustomTextFormField(
//                 minWidthPrefixIcon: 0,
//                 controller: cubit.passwordController,
//                 keyboardText: TextInputType.visiblePassword,
//                 obscureText: false,
//                 onFieldSubmitted: (newValue) {},
//                 onSaved: (newValue) {},
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Your password must not be empty';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'Email',
//                 style: AppFonts.bodyText16,
//               ),
//               CustomTextFormField(
//                 minWidthPrefixIcon: 0,
//                 controller: cubit.emailController,
//                 keyboardText: TextInputType.emailAddress,
//                 onFieldSubmitted: (newValue) {},
//                 onSaved: (newValue) {},
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Your Email must not be empty';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               if (state is UpdateEmailLoading)
//                 Text(
//                   'We \'ve sent you an email with a verification link. Please click the link to complete your email update.',
//                   style: AppFonts.bodyText16,
//                 ),
//             ],
//           );
//         },
//       ),
//     ),
//     titleButton1: 'cancel',
//     titleButton2: 'Update',
//     onPressed1: () {
//       Navigator.pop(context);
//     },
//     onPressed2: () {
//       if (cubit.formKey2.currentState!.validate()) {
//         Navigator.pop(context);
//       }
//     },
//   );
// }
}
