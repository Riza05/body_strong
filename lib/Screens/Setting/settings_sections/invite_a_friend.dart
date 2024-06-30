import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';

class InviteAFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(_InviteFriend(),"Пригласи друга");
  }
}


class _InviteFriend extends StatefulWidget {
  const _InviteFriend({super.key});

  @override
  State<_InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<_InviteFriend> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 340,
            ),
              child: Text("Разница между желанием и достижением-это дисциплина. В команде с надежным другом достичь дисциплины будет гораздо проще и гораздо легче",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            )
          ),
          SizedBox(
            height: 60,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("Пригласить друга",
                    style: TextStyle(
                        fontSize: 18
                    )
                )
            ),
          ),
        ],
    );
  }
}
