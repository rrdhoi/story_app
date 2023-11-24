import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? httpStatus;
  final String? message;
  final dynamic data;

  const Failure({
    this.httpStatus = 0,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [httpStatus, message, data];
}

class ServerException implements Exception {
  final int? httpStatus;

  final String? message;
  final dynamic data;

  ServerException({this.httpStatus = 0, this.message, this.data});
}

class ServerFailureNetwork extends Failure {
  const ServerFailureNetwork({
    super.httpStatus = null,
    super.message,
    super.data,
  });
}
