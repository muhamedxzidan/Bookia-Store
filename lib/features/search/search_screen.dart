import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Search')),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      child: Column(
        children: [
          AppTextFormFild(
            controller: searchController,
            hintText: "search",
            onChanged: (text) {
              print(text);
            },
          ),
        ],
      ),
    ),
  );
}
