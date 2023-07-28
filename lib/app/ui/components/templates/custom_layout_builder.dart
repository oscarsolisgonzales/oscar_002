import 'package:appsivalmattel/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLayoutBuilder extends StatelessWidget {
  const CustomLayoutBuilder({
    Key? key,
    this.showAppBar = false,
    this.header,
    required this.body,
    this.footer,
    this.isScrollable = true,
  }) : super(key: key);

  final bool showAppBar;
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final bool isScrollable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBase,
      resizeToAvoidBottomInset: false,
      appBar: showAppBar ? AppBar() : null,
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(
                FocusNode(),
              ),
              child: SingleChildScrollView(
                physics: isScrollable
                    ? const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      )
                    : const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        header ?? const SizedBox(),
                        Expanded(child: body),
                        footer ?? const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
