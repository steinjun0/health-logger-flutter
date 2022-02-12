import 'package:flutter/material.dart';

class DateSummary extends StatelessWidget {
  String date = '';
  List exercises = [];
  String time = '';

  // DateSummary({Key? key}, this.date, this.exercises, this.time) super(key: key);
  DateSummary(
      {Key? key,
      required this.date,
      required this.exercises,
      required this.time})
      : super(key: key);

  List<Widget> getExercisesTextList() {
    List exercises = this.exercises;
    List<Widget> exercisesTextList = [];

    int index = 1;
    for (var exercise in exercises) {
      exercisesTextList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("#${index++} ${exercise['name']}"),
            Text("${exercise['value']}"),
          ],
        ),
      ));
    }

    return exercisesTextList;
  }

  @override
  Widget build(BuildContext context) {
    String date = this.date;
    String time = this.time;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(date), Text("$time")]),
              const SizedBox(
                height: 16,
              ),
              ...getExercisesTextList(),
            ],
          ),
        ),
      ),
    );
  }
}
