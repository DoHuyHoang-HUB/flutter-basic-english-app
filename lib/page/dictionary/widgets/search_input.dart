import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key, required this.onSubmit}) : super(key: key);

  final Function(String) onSubmit;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchBarColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderLineColor),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 15.0,
            offset: Offset(0, 6.0),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.search,
        onEditingComplete: () {
          widget.onSubmit(_searchController.text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 27.w,
            vertical: 26.h,
          ),
          hintText: 'Search here',
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Image.asset('assets/images/search.png'),
          suffixIcon: _searchController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
