import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/utils/functions/custom_show_toast.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

import '../../../../../constants.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);

    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) async {
        if (state is PickedImageSuccess) {
          await cubit.uploadImageToSupabase(imageFile: cubit.selectedImage!);
        }
        if (state is UpdateImageSuccess) {
          customShowToast('Image Uploaded Successfully');
        } else if (state is UpdateImageFailure) {
          customShowToast(state.errMessage);
        } else if (state is UploadImageToSupabaseFailure) {
          customShowToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        cubit.userImage != null && cubit.userImage!.isNotEmpty
                            ? CachedNetworkImageProvider(
                                cubit.userImage!,
                                errorListener: (e) {
                                  const Icon(Icons.error);
                                },
                              )
                            : const AssetImage('assets/images/no_image.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: MediaQuery.of(context).size.width * .34,
                  child: CircleAvatar(
                    backgroundColor: kprimaryColor,
                    radius: 15,
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () async {
                          await cubit.pickImage();
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (state is UploadImageToSupabaseLoading ||
                state is UpdateImageLoading)
              const LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: kprimaryColor,
              ),
          ],
        );
      },
    );
  }
}
