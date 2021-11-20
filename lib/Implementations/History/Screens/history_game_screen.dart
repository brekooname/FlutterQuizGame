import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';
import 'package:flutter_app_quiz_game/File/file_util.dart';

import '../../../Components/Button/button_skin_config.dart';
import '../../../Components/Font/font_config.dart';

class HistoryGameScreen extends StatefulWidget {
  int score = 0;
  List<String> pressedEntries = [];
  List<String> entries = [];

  @override
  State<HistoryGameScreen> createState() => HistoryGameScreenState();
}

class Question {
  Image image;
  MyButton button;
  String question;

  Question(this.image, this.button, this.question);
}

class HistoryGameScreenState extends State<HistoryGameScreen> {
  final double answer_btn_height = 60;
  Map<String, Question> questions = Map<String, Question>();

  @override
  void initState () {
    super.initState();
    setup();

  }

  setup() async {
    print("read file");
    if (widget.entries.isEmpty) {
      String questions = await FileUtil.loadText(context);
      setState(() {
        widget.entries
            .addAll(questions.split("\n").reversed.map((e) => e.split(":")[1]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var header = createLevelHeader();

    for (var i = 0; i < widget.entries.length; i++) {
      var btnBackgr = Colors.lightBlueAccent;
      var disabled = false;
      if (widget.pressedEntries.contains(widget.entries[i])) {
        disabled = true;
      }

      var answerBtn = MyButton(
          width: 120,
          height: answer_btn_height,
          disabled: disabled,
          disabledBackgroundColor: Colors.red.shade100,
          onClick: () {
            setState(() {
              widget.pressedEntries.add(widget.entries[i]);
            });
          },
          buttonSkinConfig: ButtonSkinConfig(
              borderColor: Colors.blue.shade600, backgroundColor: btnBackgr),
          fontConfig: FontConfig(),
          text: widget.entries[i]);

      questions[widget.entries[i]] = Question(
          Image.asset(
            "assets/implementations/history/score_icon.png",
            alignment: Alignment.center,
            height: answer_btn_height * 1.4,
          ),
          answerBtn,
          widget.entries[i]);
    }

    var listView = ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return createOptionItem(questions[widget.entries[index]]!.button,
            questions[widget.entries[index]]!.image);
      },
    );

    var mainColumn = Column(
      children: <Widget>[
        SizedBox(height: 5),
        header,
        Expanded(child: listView)
      ],
    );

    return AspectRatio(
      aspectRatio: 1.777083333333333,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage(
              'assets/implementations/history/background_texture.png'),
        )),
        alignment: Alignment.center,
        child: mainColumn,
      ),
    );
  }

  Widget createOptionItem(MyButton answerBtn, Image questionImg) {
    var item = Row(children: <Widget>[
      Spacer(),
      answerBtn,
      SizedBox(width: 20),
      Container(
          width: 10, height: answer_btn_height * 2, color: Colors.blueGrey),
      SizedBox(width: 20),
      questionImg,
      Spacer()
    ]);

    return Container(child: item);
  }

  Container createLevelHeader() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent.withAlpha(150),
      ),
      child: Row(
        children: <Widget>[
          Spacer(),
          MyText(
            text: "Modern History",
            fontConfig: FontConfig(textColor: Colors.green.shade600),
          ),
          Spacer(),
          MyText(
            text: "0",
            fontConfig: FontConfig(
                textColor: Colors.yellow,
                borderColor: Colors.black,
                fontSize: FontConfig.getBigFontSize()),
          ),
          SizedBox(width: 10),
          Image.asset(
            "assets/implementations/history/score_icon.png",
            alignment: Alignment.center,
            width: 40,
          ),
        ],
      ),
    );
  }
}
