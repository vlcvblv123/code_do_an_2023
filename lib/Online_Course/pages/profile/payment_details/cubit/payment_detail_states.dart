import '../../../../common/entities/course.dart';

abstract class PaymentDetailsStates{
  const PaymentDetailsStates();
}
 class InitialPaymentDetailsStates extends PaymentDetailsStates{
  const InitialPaymentDetailsStates();
 }
class LoadingPaymentDetailsStates extends PaymentDetailsStates{
  const LoadingPaymentDetailsStates();
}
class DoneLoadingPaymentDetailsStates extends PaymentDetailsStates{
  const DoneLoadingPaymentDetailsStates();
}
 class HistoryPaymentDetailsStates extends PaymentDetailsStates{
  final List<CourseItem> courseItem;
  const HistoryPaymentDetailsStates(this.courseItem);
 }