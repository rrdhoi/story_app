import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/data/models/user_model/sign_in_response.dart';

import '../../app/common/failure/failure_network.dart';
import '../models/story_model/get_all_stories_response.dart';
import '../models/story_model/get_detail_story_response.dart';

abstract class StoryRepository {
  Future<Either<Failure, GetAllStoriesResponse>> getAllStories(
    int page,
    int size,
  );

  Future<Either<Failure, GetDetailStoryResponse>> getDetailStory(String id);

  Future<Either<Failure, CreateStoryResponse>> createStory(
    String description,
    List<int> imageByte,
    String fileName,
    LatLng? latLng,
  );

  Future<Either<Failure, UserRegisterResponse>> userSignUp(
    SignUpPayload signUpPayload,
  );

  Future<Either<Failure, SignInResponse>> userSignIn(
    SignInPayload signInPayload,
  );
}
