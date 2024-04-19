import 'package:body_strong/Screens/Chat/Model/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus){
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 90,
          titleSpacing: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, size: 24),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFFAFF00),
                  child: widget.chatModel.isGroup ? Icon(Icons.groups, size: 30) : Icon(Icons.person),
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatModel.name, style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold
                  )),
                  Text("last seen today at 12:00", style: TextStyle(
                    fontSize: 13
                  ))
                ]
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.videocam)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.call)
            ),
            PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: Text("Пользователь"), value: "Пользователь"),
                    PopupMenuItem(
                        child: Text("Файлы"), value: "Файлы"),
                    PopupMenuItem(
                        child: Text("Body strong web"), value: "Body strong web"),
                    PopupMenuItem(
                        child: Text("Search"), value: "Starred message"),
                    PopupMenuItem(child: Text("Настройки"), value: "Настройки"),
                  ];
                })
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Напишите сообщение",
                                prefixIcon: IconButton(
                                  onPressed: (){
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                  icon: Icon(Icons.emoji_emotions)
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomsheet()
                                        );
                                      },
                                      icon: Icon(Icons.attach_file)
                                    ),
                                    IconButton(
                                        onPressed: (){},
                                        icon: Icon(Icons.camera_alt)
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5)
                              ),
                            )
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 5, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFFFAFF00),
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.mic),
                            )
                          ),
                        ),
                      ],
                    ),
                    show? emojiSelect() : Container()
                  ],
                ),
              ),
            ],
          ),
          onWillPop: (){
            if(show) {
              setState(() {
                show = false;
              });
            }else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, Emoji emoji){
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file, Colors.indigo, "Документ"),
                  SizedBox(width: 40),
                  iconcreation(Icons.camera_alt, Colors.indigo, "Камера"),
                  SizedBox(width: 40),
                  iconcreation(Icons.insert_photo, Colors.indigo, "Галерея"),
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconcreation(Icons.headphones, Colors.indigo, "Аудио"),
                    SizedBox(width: 40),
                    iconcreation(Icons.location_pin, Colors.indigo, "Локация"),
                    SizedBox(width: 40),
                    iconcreation(Icons.person, Colors.indigo, "Контакт"),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, color: Colors.white, size: 29),
          ),
          SizedBox(height: 5),
          Text(text, style: TextStyle(
            fontSize: 12
          )),
        ],
      ),
    );
  }
}
