import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recpie_app/constants.dart';
import 'package:recpie_app/features/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../data/repos/profile_repos.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepos profileRepos;

  UpdateProfileCubit(this.profileRepos, this.initialUser)
      : super(UpdateProfileInitial()) {
    nameController.text = initialUser.name ?? '';
    emailController.text = initialUser.email ?? '';
    phoneController.text = initialUser.phone ?? '';
    userImage = initialUser.imgUrl ?? '';
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();

  final UserModel initialUser;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? userImage;
  File? selectedImage;
  Future<void> updateProfileData() async {
    emit(UpdateProfileLoading());
    final updatedUser = UserModel(
      uId: uId,
      // Keep the same user ID
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      preferences: initialUser.preferences,
      recentSearch: initialUser.recentSearch,
      imgUrl: userImage,
      likedRecipes: initialUser.likedRecipes,
    );
    var result = await profileRepos.updateUserData(user: updatedUser);
    result.fold((failure) {
      emit(UpdateProfileFailure(failure.errMessage));
    }, (newUser) async {
      emit(UpdateProfileSuccess());
    });
  }

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();

    try {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedImage = File(image.path);
        emit(PickedImageSuccess());
      } else {
        emit(PickedImageFailure("No image selected"));
      }
    } catch (e) {
      emit(PickedImageFailure("Error picking image: $e"));
    }
  }

  Future<void> uploadImageToSupabase({required File imageFile}) async {
    emit(UploadImageToSupabaseLoading());
    var result = await profileRepos.uploadImageToSupabase(imageFile: imageFile);
    result.fold((failure) {
      emit(UploadImageToSupabaseFailure(failure.errMessage));
    }, (imageUrl) async {
      emit(UploadImageToSupabaseSuccess());
      await updateUserImage(imageUrl: imageUrl);
    });
  }

  Future<void> updateUserImage({required String imageUrl}) async {
    emit(UpdateImageLoading());
    var result = await profileRepos.updateUserImage(imageUrl: imageUrl);
    result.fold((failure) {
      emit(UpdateImageFailure(failure.errMessage));
    }, (newUser) async {
      userImage = newUser.imgUrl;
      emit(UpdateImageSuccess());
    });
  }
}
