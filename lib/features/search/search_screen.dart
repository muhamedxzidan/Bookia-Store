import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
              debugPrint(text);
            },
          ),
        ],
      ),
    ),
  );
}
