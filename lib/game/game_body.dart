import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rsp_game/game/enum.dart';

import 'widget/game_result.dart';
import 'widget/cpu_input.dart';

import 'widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  late InputType? _userInput;
  late InputType _cpuInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    setcpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(child: GameResult(isDone: isDone)),
        Expanded(child: UserInput(isDone: isDone, callback: setUserInput)),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = _userInput;
    });
  }

  void setcpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }
}
