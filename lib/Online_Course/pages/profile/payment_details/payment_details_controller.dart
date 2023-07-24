import 'package:CodeGenius/Online_Course/common/apis/course_api.dart';

import 'package:CodeGenius/Online_Course/pages/profile/payment_details/cubit/payment_detail_cubits.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailsController {
  late BuildContext context;
  PaymentDetailsController({required this.context});

  // after the context is ready this init() method gets called
  void init() {
    asyncLoadBuyCourseData();
  }

  asyncLoadBuyCourseData() async {
    context.read<PaymentDetailCubits>().loadingPaymentDetailsStates();
    var result = await CourseAPI.orderList();
    if (result.code == 200) {
      if (context.mounted) {
        // save data to shared storage
        context.read<PaymentDetailCubits>().doneLoadingPaymentDetailsStates();
        Future.delayed(const Duration(milliseconds: 10), () {
          {
            print('${DateTime.now()}');
            context.read<PaymentDetailCubits>().historyPaymentDetails(result.data!);
          }
        });
      }
    }
  }
}
