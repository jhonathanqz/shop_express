import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/widgets/loading/loading.dart';

class ScaffoldLight extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const ScaffoldLight({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton ?? Container(),
        floatingActionButtonLocation: floatingActionButtonLocation ??
            FloatingActionButtonLocation.endFloat,
        backgroundColor: AppColors.background,
        body: Loading(
          isLoading: isLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header ?? Container(),
              Expanded(child: child),
              footer ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
