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
  final allChecked = CheckBoxModal(title: "Все");
  final checkBoxList = [
    CheckBoxModal(title: "Веган"),
    CheckBoxModal(title: "Вегетарианец"),
    CheckBoxModal(title: "Аллергия на рыбу"),
    CheckBoxModal(title: "Аллергия на яйца"),
    CheckBoxModal(title: "Аллергия на орехи"),
    CheckBoxModal(title: "Аллергия на глютен"),
    CheckBoxModal(title: "Аллергия на молоко"),
    CheckBoxModal(title: "Аллергия на лактозу"),
    CheckBoxModal(title: "Аллергия на пшеницу"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                onTap: () => onAllClicked(allChecked),
                leading: Checkbox(
                    side: BorderSide(color: Colors.white),
                    checkColor: Colors.black,
                    activeColor: Color(0xFFFAFF00),
                  value: allChecked.value,
                  onChanged: (value) => onAllClicked(allChecked)
                ),
                title: Text(allChecked.title,style: TextStyle(color: Colors.white)),
              ),
              Divider(),
              ...checkBoxList.map((item) =>
                  ListTile(
                    onTap: () => onItemClicked(item),
                    leading: Checkbox(
                      side: BorderSide(color: Colors.white),
                        checkColor: Colors.black,
                        activeColor: Color(0xFFFAFF00),
                        value: item.value,
                        onChanged: (value) => onItemClicked(item)
                    ),
                    title: Text(item.title, style: TextStyle(color: Colors.white)),
                  ),
              ).toList()
            ]
          ),
        ),
        ElevatedButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context) {
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.pop(context);
                });
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text("Данные сохранены успешно"),
                      ],
                    ),
                  ),
                );
              }
            );
          },
          child: Text("Сохранить")
        )
      ],
    );
  }

  onAllClicked(CheckBoxModal ckdItem) {
    final newValue = !ckdItem.value;
    setState(() {
      ckdItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModal ckdItem) {
    final newValue = !ckdItem.value;
    setState(() {
      ckdItem.value = newValue;

      if(!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({
    required this.title,
    this.value = false
  });
}

