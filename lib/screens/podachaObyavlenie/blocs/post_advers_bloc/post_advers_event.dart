part of 'post_advers_bloc.dart';

 class PostAdversEvent extends Equatable {
  const PostAdversEvent(this.paa);
  final PodachaAvtoAdver paa;
  @override
  List<Object> get props => [paa];
}
