import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(_Subscription(), "Подписка");
  }
}

class _Subscription extends StatefulWidget {
  const _Subscription({super.key});

  @override
  State<_Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<_Subscription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ],
    );
  }
}

