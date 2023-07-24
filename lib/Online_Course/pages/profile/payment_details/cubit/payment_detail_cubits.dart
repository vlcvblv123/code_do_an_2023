import 'package:CodeGenius/Online_Course/pages/profile/payment_details/cubit/payment_detail_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/entities/course.dart';

class PaymentDetailCubits extends Cubit<PaymentDetailsStates> {
  PaymentDetailCubits() : super(const InitialPaymentDetailsStates());
  void historyPaymentDetails(List<CourseItem> courseItem) {
    print("---Here we are emitting states of history ");
    emit(HistoryPaymentDetailsStates(courseItem));
  }

  void loadingPaymentDetailsStates() {
    print("---Here we are emitting loading states of history ");
    emit(const LoadingPaymentDetailsStates());
  }

  void doneLoadingPaymentDetailsStates() {
    print("---Here we are emitting done loading states of history ");
    emit(const DoneLoadingPaymentDetailsStates());
  }
}
