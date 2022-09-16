import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/checkout_model.dart';
import '../../model/model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoading()) {
    on<CheckoutEvent>((event, emit) {
      
    });
  }
}
