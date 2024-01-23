import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/widgets/textfield.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  final TextEditingController titleController = TextEditingController();
  HtmlEditorController problemController = HtmlEditorController();
  HtmlEditorController solutionController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/app_bar.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.only(top: 28, bottom: 8),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 31,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Add Lessons Learnt',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print('tapped');
                },
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBox(
                  controller: titleController,
                  hinttext: "Title",
                  label: "",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    "Problem",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                HtmlEditor(
                  controller: problemController,
                  htmlEditorOptions: const HtmlEditorOptions(
                    hint: "Write here...",
                  ),
                  htmlToolbarOptions: const HtmlToolbarOptions(
                    toolbarType: ToolbarType.nativeGrid,
                    gridViewHorizontalSpacing: 2,
                    gridViewVerticalSpacing: 1,
                    toolbarItemHeight: 29,
                    defaultToolbarButtons: [
                      FontButtons(clearAll: false),
                      ColorButtons(highlightColor: false),
                      ListButtons(listStyles: false),
                      ParagraphButtons(
                        alignRight: false,
                        caseConverter: false,
                        lineHeight: false,
                        textDirection: false,
                        increaseIndent: false,
                        decreaseIndent: false,
                      ),
                      InsertButtons(
                          link: true,
                          picture: true,
                          video: true,
                          otherFile: true,
                          hr: false,
                          table: false),
                    ],
                  ),
                  otherOptions: OtherOptions(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: grey1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    "Solution",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                HtmlEditor(
                  controller: solutionController,
                  htmlEditorOptions: const HtmlEditorOptions(
                    hint: "Write here...",
                  ),
                  htmlToolbarOptions: const HtmlToolbarOptions(
                    toolbarType: ToolbarType.nativeGrid,
                    gridViewHorizontalSpacing: 2,
                    gridViewVerticalSpacing: 2,
                    toolbarItemHeight: 29,
                    defaultToolbarButtons: [
                      FontButtons(clearAll: false),
                      ColorButtons(highlightColor: false),
                      ListButtons(listStyles: false),
                      ParagraphButtons(
                        alignRight: false,
                        caseConverter: false,
                        lineHeight: false,
                        textDirection: false,
                        increaseIndent: false,
                        decreaseIndent: false,
                      ),
                      InsertButtons(
                          link: true,
                          picture: true,
                          video: true,
                          otherFile: true,
                          hr: false,
                          table: false),
                    ],
                  ),
                  otherOptions: OtherOptions(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: grey1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color1,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
