part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> banner;
  CategoryLoaded({this.banner=const <Category>[]});

  @override
  List<Object> get props => [banner];
}
