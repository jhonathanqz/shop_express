import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';
import 'package:shop_express/presentation/shared/widgets/loading/color_loader.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool isMessage;

  const Loading({
    Key? key,
    required this.isLoading,
    required this.child,
    this.isMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Visibility(
            visible: isLoading,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: AppColors.blurredBackground.withOpacity(0.7),
              child: isMessage
                  ? Center(
                      child: SizedBox(
                        height: 70,
                        child: Column(
                          children: [
                            Text(
                              'Processando...',
                              style: AppTextStyles.heading.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            AppSpacing.md,
                            const ColorLoader(
                              dotOneColor: AppColors.primaryColor,
                              dotTwoColor: AppColors.primaryColor,
                              dotThreeColor: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                        height: 80,
                        child: ColorLoader(
                          dotOneColor: AppColors.white,
                          dotTwoColor: AppColors.white,
                          dotThreeColor: AppColors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
