import 'package:story_app/app/common/utils/type_deff_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_story_state.freezed.dart';

@freezed
abstract class CreateStoryState with _$CreateStoryState {
  const factory CreateStoryState.initial() = CreateStoryStateInital;
  const factory CreateStoryState.loading() = CreateStoryStateLoading;
  const factory CreateStoryState.success({
    required CreateStoryResponse createStoryResponse,
  }) = CreateStoryStateSuccess;
  const factory CreateStoryState.error({int? httpStatus, String? message}) =
      CreateStoryStateError;
}
