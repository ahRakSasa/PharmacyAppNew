import 'package:equatable/equatable.dart';
import 'package:pharmacy_appnew_version/model/model.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  final List<Product>? products;

  const Checkout(
      {this.address,
      this.city,
      this.country,
      this.deliveryFee,
      this.email,
      this.fullName,
      this.products,
      this.subtotal,
      this.total,
      this.zipCode});

  @override
  // TODO: implement props
  List<Object?> get props => [
        fullName,
        email,
        address,
        zipCode,
        subtotal,
        total,
        products,
        deliveryFee,
        country,
        city,
      ];
}
