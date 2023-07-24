import 'package:CodeGenius/Online_Course/common/values/constant.dart';
import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart'
    as res;
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_states.dart';
import 'package:CodeGenius/Online_Course/pages/search/search_controller.dart';
import 'package:CodeGenius/Online_Course/pages/search/widgets/search_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routers/names.dart';
import '../../common/values/colors.dart';
import '../../common/widgets/base_text_widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SearchController _searchController;
  @override
  void didChangeDependencies() {
    _searchController = SearchController(context: context);
    _searchController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBlocs, SearchStates>(builder: (context, state) {
      return Scaffold(
          appBar: res.buildAppBar("Search"),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                sliver: SliverToBoxAdapter(
                  child: searchView(context, "Courses you might like",
                      home: false),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
                sliver: SliverToBoxAdapter(
                    child: SingleChildScrollView(
                  child: searchList(state),
                )),
              )
            ],
          ));
    });
  }
}
