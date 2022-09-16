part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final String? zipCode;
  final List<Product>? products;
  final Checkout? checkout;

  CheckoutLoaded({
    this.address,
    this.city,
    this.country,
    this.deliveryFee,
    this.email,
    this.fullName,
    this.products,
    this.subtotal,
    this.total,
    this.zipCode,
  }) : checkout = Checkout(
          fullName: fullName,
          email: email,
          address: address,
          city: city,
          deliveryFee: deliveryFee,
          subtotal: subtotal,
          total: total,
          zipCode: zipCode,
          country: country,
          products: products,
        );

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
