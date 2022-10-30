import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {


 // void checkboxCallback(bool? newValue)
 // {
 //   setState(() {
 //     isChecked = newValue!;
 //   });
 // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>( // consumer widget gives access to taskData without calling provider.of().
    builder: (context,taskData,child){
      return ListView.builder(itemBuilder: (context,index)
      {
        final task = taskData.tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          taskTitle: task.name,
          checkboxCallback : (bool? newValue){
            taskData.updateTask(task);
          }, longPressCallback: () {
            taskData.deleteTask(task);
        },
        );
      },
        itemCount: taskData.taskCount,);
    },
    );
  }
}
