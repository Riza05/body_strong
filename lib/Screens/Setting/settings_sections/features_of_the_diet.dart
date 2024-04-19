import 'package:body_strong/Screens/Setting/settings_sections/Widgets/checkbox_state.dart';
import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';

class FeaturesOfTheDiet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(Expanded(child: _FeaturesOfTheDiet()), "Особенности рациона");
  }
}


class _FeaturesOfTheDiet extends StatefulWidget {
  const _FeaturesOfTheDiet({super.key});

  @override
  State<_FeaturesOfTheDiet> createState() => _FeaturesOfTheDietState();
}

class _FeaturesOfTheDietState extends State<_FeaturesOfTheDiet> {
  bool _value = false;
  final all = CheckBoxState(title: "Выбрать все");

  final text = [
    CheckBoxState(title: "Веган"),
    CheckBoxState(title: "Вегетарианец"),
    CheckBoxState(title: "Аллергия на рыбу"),
    CheckBoxState(title: "Аллергия на яйца"),
    CheckBoxState(title: "Аллергия на орехи"),
    CheckBoxState(title: "Аллергия на глютен"),
    CheckBoxState(title: "Аллергия на молоко"),
    CheckBoxState(title: "Аллергия на лактозу"),
    CheckBoxState(title: "Аллергия на пшеницу"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildGroupCheckbox(all),
        Divider(color: Color(0xFFFAFF00)),
        ...text.map(buildSinglCheckbox).toList()
      ],
    );
  }

  Widget buildSinglCheckbox(CheckBoxState checkBox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.white,
      value: checkBox.value,
      title: Text(checkBox.title,
          style: TextStyle(
              fontSize: 26,
             color: Color(0xFFFAFF00)
          )),
      onChanged: (_value) => setState(() {
        checkBox.value = _value!;
        all.value = text.every((text) => text.value);
      }
    )
  );

  Widget buildGroupCheckbox(CheckBoxState checkBox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0xFFFAFF00),
      value: checkBox.value,
      title: Text(checkBox.title,
          style: TextStyle(
              fontSize: 26
          )),
      onChanged: toggleMethod
  );

  void toggleMethod(bool? value) {
    if (value == null) return;
    setState(() {
      all.value = _value;
      text.forEach((text) => text.value = _value);
    });
  }
}

