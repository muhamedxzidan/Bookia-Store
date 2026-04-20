import 'package:bookia_store/core/routing/routes.dart';
import 'package:bookia_store/core/theme/app_colors.dart';
import 'package:bookia_store/core/theme/app_strings.dart';
import 'package:bookia_store/core/utils/assets.gen.dart';
import 'package:bookia_store/features/profile/cubit/profile_cubit.dart';
import 'package:bookia_store/features/profile/data/models/profile_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    if (cubit.state is! ProfileLoaded) {
      cubit.getProfile();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppStrings.profileScreenTitle.tr()),
      centerTitle: true,
    ),
    body: BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => switch (state) {
          ProfileLoaded(:final user) => _ProfileBody(user: user),
          ProfileError(:final message) => _ProfileErrorView(message: message),
          _ => const _ProfileSkeleton(),
        },
      ),
    ),
  );
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    children: [
      _ProfileHeader(user: user),
      SizedBox(height: 24.h),
      _ProfileMenuTile(
        icon: Assets.icons.bookmark,
        label: AppStrings.profileMyWishlist.tr(),
        onTap: () => Navigator.pushNamed(context, Routes.wishlist),
      ),
      _ProfileMenuTile(
        icon: Assets.icons.category,
        label: AppStrings.profileMyCart.tr(),
        onTap: () => Navigator.pushNamed(context, Routes.cart),
      ),
      _ProfileMenuTile(
        icon: Assets.icons.home,
        label: AppStrings.profileLanguage.tr(),
        onTap: () => _toggleLanguage(context),
      ),
      SizedBox(height: 16.h),
      _LogoutButton(onTap: () => _confirmLogout(context)),
    ],
  );

  void _toggleLanguage(BuildContext context) {
    final next = context.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    context.setLocale(next);
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final cubit = context.read<ProfileCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(AppStrings.profileLogoutConfirmTitle.tr()),
        content: Text(AppStrings.profileLogoutConfirmMessage.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(AppStrings.cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(AppStrings.profileLogout.tr()),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await cubit.logout();
    }
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CircleAvatar(
        radius: 48.r,
        backgroundColor: AppColors.bookCardBackgroundColor,
        backgroundImage: (user.image ?? '').isNotEmpty
            ? NetworkImage(user.image!)
            : null,
        child: (user.image ?? '').isEmpty
            ? SvgPicture.asset(Assets.icons.profile, width: 40.w, height: 40.h)
            : null,
      ),
      SizedBox(height: 12.h),
      Text(
        user.name ?? '',
        style: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 22.sp,
          color: AppColors.darkTextColor,
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        user.email ?? '',
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.subtitleTextColor,
        ),
      ),
    ],
  );
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: AppColors.secondaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    margin: EdgeInsets.only(bottom: 10.h),
    child: ListTile(
      leading: SvgPicture.asset(icon, width: 22.w, height: 22.h),
      title: Text(
        label,
        style: TextStyle(fontSize: 16.sp, color: AppColors.darkTextColor),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.subtitleTextColor,
      ),
      onTap: onTap,
    ),
  );
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 52.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkTextColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: onTap,
      child: Text(
        AppStrings.profileLogout.tr(),
        style: TextStyle(fontSize: 16.sp),
      ),
    ),
  );
}

class _ProfileErrorView extends StatelessWidget {
  const _ProfileErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        SizedBox(height: 12.h),
        TextButton(
          onPressed: () => context.read<ProfileCubit>().getProfile(),
          child: Text(AppStrings.retry.tr()),
        ),
      ],
    ),
  );
}

class _ProfileSkeleton extends StatelessWidget {
  const _ProfileSkeleton();

  @override
  Widget build(BuildContext context) => Skeletonizer(
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      children: [
        _ProfileHeader(
          user: UserProfile(
            name: 'User Name',
            email: 'user@example.com',
          ),
        ),
        SizedBox(height: 24.h),
        for (int i = 0; i < 3; i++)
          _ProfileMenuTile(
            icon: Assets.icons.bookmark,
            label: 'Menu item',
            onTap: () {},
          ),
      ],
    ),
  );
}
