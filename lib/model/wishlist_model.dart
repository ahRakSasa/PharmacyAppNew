import 'package:equatable/equatable.dart';
import 'package:pharmacy_appnew_version/model/product_model.dart';

class WishList extends Equatable {
  final List<Product> products;

  const WishList({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
