import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/contributor_controller.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/cubit/contributor_cubits.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/cubit/contributor_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contributor extends StatefulWidget {
  const Contributor({super.key});

  @override
  State<Contributor> createState() => _ContributorState();
}

class _ContributorState extends State<Contributor> {
  late ContributorController _contributorController;
  @override
  void didChangeDependencies() {
    _contributorController = ContributorController(context: context);
    _contributorController.init();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContributorCubits, ContributorStates>(
        builder: (context, state) {
      return Scaffold(
          appBar: buildAppBar("Author"),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                children: [
                  //this container contains background image and profile photo
                  Container(
                    width: 325.w,
                    height: 220.h,
                    child: Stack(
                      children: [
                        Container(
                          width: 325.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/background.png"))),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: authorView(context, state),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}

Widget authorView(BuildContext context, ContributorStates state) {
  return Container(
    width: 325.w,
    color: Colors.red,
    child: state.authorItem == null
        ? Container()
        : Row(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${state.authorItem!.avatar}"))),
              )
            ],
          ),
  );
}
