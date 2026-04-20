import 'package:bookia_store/core/share_widgets/app_text_form_fild.dart';
import 'package:bookia_store/features/home/Presentation/widget/book_card.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Search')),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      child: Column(
        children: [
          AppTextFormFild(
            controller: searchController,
            hintText: 'Search',
            onChanged: context.read<SearchCubit>().onQueryChanged,
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) => switch (state) {
                SearchInitial() => const _SearchPlaceholder(),
                SearchLoading() => const _SearchSkeleton(),
                SearchLoaded(:final results) => _SearchGrid(results: results),
                SearchEmpty(:final keyword) => _SearchEmpty(keyword: keyword),
                SearchError(:final message) => _SearchError(message: message),
              },
            ),
          ),
        ],
      ),
    ),
  );
}

class _SearchPlaceholder extends StatelessWidget {
  const _SearchPlaceholder();

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Type to search for books'));
}

class _SearchEmpty extends StatelessWidget {
  const _SearchEmpty({required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) =>
      Center(child: Text('No results for "$keyword"'));
}

class _SearchError extends StatelessWidget {
  const _SearchError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(child: Text(message));
}

class _SearchGrid extends StatelessWidget {
  const _SearchGrid({required this.results});

  final List<BookProduct> results;

  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: results.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 0.58,
    ),
    itemBuilder: (context, index) => BookCard(product: results[index]),
  );
}

class _SearchSkeleton extends StatelessWidget {
  const _SearchSkeleton();

  @override
  Widget build(BuildContext context) {
    final placeholders = List<BookProduct>.generate(
      6,
      (_) => BookProduct(id: 0, name: 'Book Title', price: '285'),
    );
    return Skeletonizer(
      child: GridView.builder(
        itemCount: placeholders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 0.58,
        ),
        itemBuilder: (context, index) =>
            BookCard(product: placeholders[index]),
      ),
    );
  }
}