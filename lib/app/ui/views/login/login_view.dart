import 'package:appsivalmattel/app/ui/components/templates/custom_layout_builder.dart';
import 'package:appsivalmattel/app/ui/views/login/widgets/body_form.dart';
import 'package:appsivalmattel/app/ui/views/login/widgets/footer_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomLayoutBuilder(
      //header: AppLogo(logoSize: LogoSize.medium),
      isScrollable: true,
      body: BodyForm(),
      footer: FooterForm(),
    );
  }
}
