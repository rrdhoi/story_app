import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:story_app/app/common/network/dio_options_network.dart';
import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:story_app/app/config/app_end_point.dart';
import 'package:story_app/app/config/flavor/app_flavor_config.dart';
import 'package:story_app/app/config/flavor/app_flavor_type.dart';
import 'package:story_app/app/shared/authenticated_provider/app_auth_provider.dart';
import 'package:story_app/app/shared/data_source_provider/dio_provider.dart';
import 'package:story_app/data/data_sources/remote/story_remote_data_source.dart';
import 'package:story_app/data/models/story_model/get_all_stories_response.dart';
import 'package:story_app/data/models/story_model/get_detail_story_response.dart';
import 'package:story_app/data/models/user_model/sign_in_response.dart';

import '../../../app/common/failure/failure_network.dart';
import '../../../app/common/network/network_utils.dart';

final storyRemoteDataSourceProvider =
    Provider.autoDispose<StoryRemoteDataSource>(
  (ref) => StoryRemoteDataSourceImpl(
    dio: ref.read(dioProvider),
    token: ref.read(appAuthProvider),
  ),
);

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  Dio dio;
  String? token;

  StoryRemoteDataSourceImpl({required this.dio, required this.token});

  @override
  Future<SignInResponse> userSignIn(SignInPayload signInPayload) async {
    try {
      final url = generateApiUrl(AppEndPoint.signIn);
      final response = await dio.post(
        url,
        data: signInPayload,
        options: DioOptions.fetchDataOptions(),
      );

      return SignInResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
        httpStatus: error.response?.statusCode,
        message: error.response?.data['message'],
      );
    }
  }

  @override
  Future<UserRegisterResponse> userSignUp(SignUpPayload signUpPayload) async {
    try {
      final url = generateApiUrl(AppEndPoint.signUp);
      final response = await dio.post(
        url,
        data: signUpPayload,
        options: DioOptions.fetchDataOptions(),
      );

      return (
        error: response.data['error'] as bool,
        message: response.data['message'] as String
      );
    } on DioException catch (error) {
      throw ServerException(
        httpStatus: error.response?.statusCode,
        message: error.response?.data['message'],
      );
    }
  }

  @override
  Future<GetAllStoriesResponse> getAllStories(int page, int size) async {
    try {
      final url = generateApiUrl(AppEndPoint.stories);
      final response = await dio.get(
        url,
        queryParameters: {
          'page': page,
          'size': size,
        },
        options: DioOptions.fetchDataOptions(token: token),
      );

      return GetAllStoriesResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
        httpStatus: error.response?.statusCode,
        message: error.response?.data['message'],
      );
    }
  }

  @override
  Future<GetDetailStoryResponse> getDetailStory(String id) async {
    try {
      final url = generateApiUrl(AppEndPoint.getDetailStory + id);
      final response = await dio.get(
        url,
        queryParameters: {"id": id},
        options: DioOptions.fetchDataOptions(token: token),
      );

      return GetDetailStoryResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
        httpStatus: error.response?.statusCode,
        message: error.response?.data['message'],
      );
    }
  }

  @override
  Future<CreateStoryResponse> createStory(
    String description,
    List<int> imageByte,
    String fileName,
    LatLng? latLng,
  ) async {
    try {
      final url = generateApiUrl(AppEndPoint.stories);
      final FormData formData = FormData();

      formData.fields.add(MapEntry("description", description));
      formData.files.add(
        MapEntry(
          'photo',
          MultipartFile.fromBytes(
            imageByte,
            filename: fileName,
            contentType: MediaType.parse("${lookupMimeType(fileName)}"),
          ),
        ),
      );

      if (latLng != null) {
        formData.fields.add(MapEntry("lat", latLng.latitude.toString()));
        formData.fields.add(MapEntry("lon", latLng.longitude.toString()));
      }

      final response = await dio.post(
        url,
        data: formData,
        options: DioOptions.sendDataOptions(token: token),
      );

      return (
        error: response.data['error'] as bool,
        message: response.data['message'] as String
      );
    } on DioException catch (error) {
      throw ServerException(
        httpStatus: error.response?.statusCode,
        message: error.response?.data['message'],
      );
    }
  }
}
