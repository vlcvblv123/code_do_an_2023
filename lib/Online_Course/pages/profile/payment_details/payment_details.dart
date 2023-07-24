import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart';
import 'package:CodeGenius/Online_Course/pages/profile/payment_details/cubit/payment_detail_states.dart';
import 'package:CodeGenius/Online_Course/pages/profile/payment_details/payment_details_controller.dart';
import 'package:CodeGenius/Online_Course/pages/profile/payment_details/widgets/payment_details_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets.dart';

import 'cubit/payment_detail_cubits.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late PaymentDetailsController _paymentDetailsController;
  @override
  void didChangeDependencies() {
    _paymentDetailsController = PaymentDetailsController(context: context);
    _paymentDetailsController.init();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentDetailCubits, PaymentDetailsStates>(
        builder: (context, state) {
      if (state is HistoryPaymentDetailsStates) {
        return Scaffold(
            appBar: buildAppBars("Buy Courses"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    menuViews(),
                    buildOrderListItems(state),
                  ],
                ),
              ),
            ));
      } else if (state is LoadingPaymentDetailsStates) {
        return Scaffold(
          appBar: buildAppBar("Payment details"),
          body: Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
