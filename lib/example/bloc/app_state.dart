import 'package:equatable/equatable.dart';
import 'package:pharmacy_appnew_version/example/model/model.dart';

abstract class ProductState extends Equatable {}

class InitialState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductAdding extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductAdded extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  List<Object?> get props => [error];
}

class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  List<ProductModel> mydata;
  ProductLoaded(this.mydata);
  @override
  // TODO: implement props
  List<Object?> get props => [mydata];
}
