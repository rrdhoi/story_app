import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/data/models/story_model/get_detail_story_response.dart';
import 'package:story_app/data/models/user_model/sign_in_response.dart';

import '../../models/story_model/get_all_stories_response.dart';

abstract class StoryRemoteDataSource {
  Future<GetAllStoriesResponse> getAllStories(int page, int size);

  Future<GetDetailStoryResponse> getDetailStory(String id);

  Future<CreateStoryResponse> createStory(
    String description,
    List<int> imageByte,
    String fileName,
    LatLng? latLng,
  );

  Future<UserRegisterResponse> userSignUp(SignUpPayload signUpPayload);

  Future<SignInResponse> userSignIn(SignInPayload signInPayload);
}
