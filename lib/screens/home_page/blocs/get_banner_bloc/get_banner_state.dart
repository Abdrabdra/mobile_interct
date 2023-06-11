// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_banner_bloc.dart';

abstract class GetBannerState extends Equatable {
  const GetBannerState();

  @override
  List<Object> get props => [];
}

class GetBannerInitial extends GetBannerState {}

class GetBannerLoading extends GetBannerState {}

class GetBannerSuccess extends GetBannerState {
  final List<String> urlsToImages;
  GetBannerSuccess({
    required this.urlsToImages,
  });

  @override
  List<Object> get props => [urlsToImages];
}

class GetBannerFailure extends GetBannerState {
  final String errorText;
  GetBannerFailure({
    required this.errorText,
  });

  @override
  List<Object> get props => [errorText];
}
