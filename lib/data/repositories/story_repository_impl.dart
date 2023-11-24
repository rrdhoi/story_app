import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/failure/failure_network.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/data/data_sources/remote/story_remote_data_source.dart';
import 'package:story_app/data/data_sources/remote/story_remote_data_source_impl.dart';
import 'package:story_app/data/models/story_model/get_detail_story_response.dart';
import 'package:story_app/data/models/user_model/sign_in_response.dart';
import 'package:story_app/data/repositories/story_repository.dart';

import '../models/story_model/get_all_stories_response.dart';

final storyRepositoryProvider = Provider.autoDispose<StoryRepository>(
  (ref) => StoryRepositoryImpl(
    storyRemoteDataSource: ref.read(storyRemoteDataSourceProvider),
  ),
);

class StoryRepositoryImpl extends StoryRepository {
  StoryRemoteDataSource storyRemoteDataSource;

  StoryRepositoryImpl({required this.storyRemoteDataSource});

  @override
  Future<Either<Failure, GetAllStoriesResponse>> getAllStories(
    int page,
    int size,
  ) async {
    try {
      final result = await storyRemoteDataSource.getAllStories(page, size);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailureNetwork(
          httpStatus: error.httpStatus,
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SignInResponse>> userSignIn(
    SignInPayload signInPayload,
  ) async {
    try {
      final result = await storyRemoteDataSource.userSignIn(signInPayload);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailureNetwork(
          httpStatus: error.httpStatus,
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserRegisterResponse>> userSignUp(
    SignUpPayload signUpPayload,
  ) async {
    try {
      final result = await storyRemoteDataSource.userSignUp(signUpPayload);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailureNetwork(
          httpStatus: error.httpStatus,
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, GetDetailStoryResponse>> getDetailStory(
    String id,
  ) async {
    try {
      final result = await storyRemoteDataSource.getDetailStory(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailureNetwork(
          httpStatus: error.httpStatus,
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CreateStoryResponse>> createStory(
    String description,
    List<int> imageByte,
    String fileName,
    LatLng? latLng,
  ) async {
    try {
      final result = await storyRemoteDataSource.createStory(
        description,
        imageByte,
        fileName,
        latLng,
      );

      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailureNetwork(
          httpStatus: error.httpStatus,
          message: error.message,
        ),
      );
    }
  }
}
