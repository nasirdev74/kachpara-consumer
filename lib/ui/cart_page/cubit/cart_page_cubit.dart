import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/status.dart';

part 'cart_page_state.dart';
part 'cart_page_cubit.freezed.dart';

class CartPageCubit extends Cubit<CartPageState> {
  CartPageCubit() : super(const CartPageState());
}
