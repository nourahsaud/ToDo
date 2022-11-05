import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

var valuecontroller = TextEditingController();

class Todo extends StatelessWidget {
  var todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: valuecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
              onFieldSubmitted: ((value) {
                todoController.additem(value);
                valuecontroller.clear();
                print(value);
              }),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Obx(() {
              return ListView.builder(
                  itemCount: todoController.tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          title: Text('${todoController.tasks[index]}'),
                          leading: Checkbox(
                            value: todoController.isChecked[index],
                            onChanged: (value) {
                              todoController.isChecked[index] = value!;
                            },
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Edit Ur 2Do item'),
                                    content: TextFormField(
                                      controller: valuecontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: todoController.tasks[index],
                                      ),
                                      onFieldSubmitted: ((value) {
                                        todoController.edititem(value, index);
                                        valuecontroller.clear();
                                        Navigator.pop(context, 'Cancel');
                                        print(value);
                                      }),
                                    ),
                                  ),
                                ),
                                icon: Icon(Icons.edit_rounded),
                              ),
                              IconButton(
                                onPressed: () {
                                  todoController.deleteitem(index);
                                  print(index);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          )),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}
