import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/File/file_util.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'dart:io';

import '../../../Components/Button/button_skin_config.dart';
import '../../../Components/Font/font_config.dart';

class HistoryGameScreen extends StatefulWidget {
  int score = 0;
  int availableHints = 6;
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
  final Size answer_btn_size = Size(120, 60);
  Map<String, Question> questions = Map<String, Question>();

  @override
  void initState() {
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
    var header = HistoryGameLevelHeader(
      historyEra: "Modern times",
      question: "aabace asdasdas sda",
    );

    for (var i = 0; i < widget.entries.length; i++) {
      var btnBackgr = Colors.lightBlueAccent;
      var disabled = false;
      if (widget.pressedEntries.contains(widget.entries[i])) {
        disabled = true;
      }

      var answerBtn = MyButton(
          width: answer_btn_size.width,
          height: answer_btn_size.height,
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
            "assets/implementations/history/questions/images/i$i.png",
            alignment: Alignment.center,
            height: answer_btn_size.height * 1.8,
            width: answer_btn_size.height * 1.8,
          ),
          answerBtn,
          widget.entries[i]);
    }

    var listView = ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        var question = questions[widget.entries[index]];
        return createOptionItem(question!.button, true, question.image, index);
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

  Widget createOptionItem(
      MyButton answerBtn, bool? correctAnswer, Image questionImg, int index) {
    Widget answerPart = correctAnswer == null
        ? AnimateZoomInZoomOut(
            toAnimateWidgetSize: answer_btn_size,
            toAnimateWidget: answerBtn,
          )
        : answerBtn;

    var item = Row(children: <Widget>[
      Spacer(),
      SizedBox(width: answer_btn_size.width + 10, child: answerPart),
      SizedBox(width: 20),
      Container(
          width: 10,
          height: answer_btn_size.height * 2,
          color: correctAnswer == null
              ? Colors.blueGrey
              : correctAnswer
                  ? Colors.green
                  : Colors.red),
      SizedBox(width: 20),
      questionImg,
      Spacer()
    ]);

    return Container(
        child: item,
        color: index % 2 == 0
              ? Colors.yellow.shade500.withOpacity(0.1)
            : Colors.yellow.shade500.withOpacity(0.6));
  }
}
