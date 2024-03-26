import 'package:flutter/material.dart';
import 'package:moneymanagementapp/ui/colors/colors.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return KPrimaryButton();
  }
}

class KPrimaryButton extends StatelessWidget {
  const KPrimaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Kprimarycolor,
      child: Text('data'),
    );
  }
}
