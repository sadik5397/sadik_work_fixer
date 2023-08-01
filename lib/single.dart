import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sadik_work_fixer/multi.dart';
import 'package:sadik_work_fixer/others/console.dart';

import 'others/api.dart';
import 'others/button.dart';
import 'others/colors.dart';
import 'others/heading.dart';
import 'others/padding.dart';
import 'others/show_alert.dart';
import 'others/text_field.dart';

class SadikWorkDataBaseFixer extends StatefulWidget {
  const SadikWorkDataBaseFixer({Key? key}) : super(key: key);

  @override
  State<SadikWorkDataBaseFixer> createState() => _SadikWorkDataBaseFixerState();
}

class _SadikWorkDataBaseFixerState extends State<SadikWorkDataBaseFixer> {
  TextEditingController driveUrlController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController postIdController = TextEditingController();
  TextEditingController youTubeUrlController = TextEditingController();
  bool searchIsLoading = false, updateIsLoading = false;
  FocusNode searchFocusNode = FocusNode(), updateFocusNode = FocusNode();
  dynamic errorConsole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: MyPadding.value * 8,
            title: const Heading(title: "SADIK.WORK Video Database Fixer", subtitle: "Replace the google drive video URL with youtube url from this platform."),
            actions: [MyButton.outline(margin: MyPadding.right * 2, icon: Icons.repeat_rounded, label: "Multiple", onTap: () => Get.to(() => const SadikWorkDataBaseMultiFixer()))]),
        body: Padding(
            padding: MyPadding.primaryAndQrt.copyWith(top: MyPadding.value * 2),
            child: Column(children: [
              MyTextField.primary(
                  focusNode: searchFocusNode,
                  autoFocus: true,
                  labelText: "Existing Video Google Drive URL",
                  controller: driveUrlController,
                  onFieldSubmitted: (value) async {
                    setState(() => searchIsLoading = true);
                    dynamic result = await API.findVideo(url: driveUrlController.text);
                    setState(() => errorConsole = result);
                    if (result != null) {
                      setState(() => postIdController.text = result["ID"].toString());
                      setState(() => videoTitleController.text = result["post_title"].toString());
                      updateFocusNode.requestFocus();
                    }
                    setState(() => searchIsLoading = false);
                  }),
              MyButton.primary(
                  isLoading: searchIsLoading,
                  label: "Search Database",
                  onTap: () async {
                    setState(() => searchIsLoading = true);
                    dynamic result = await API.findVideo(url: driveUrlController.text);
                    setState(() => errorConsole = result);
                    if (result != null) {
                      setState(() => postIdController.text = result["ID"].toString());
                      setState(() => videoTitleController.text = result["post_title"].toString());
                      updateFocusNode.requestFocus();
                    }
                    setState(() => searchIsLoading = false);
                  }),
              if (postIdController.text != "")
                Column(children: [
                  Padding(padding: MyPadding.vert, child: Divider(color: MyColor.off)),
                  Row(children: [
                    Expanded(child: MyTextField.primary(labelText: "Video Title", controller: videoTitleController, isDisable: true)),
                    SizedBox(width: MyPadding.value),
                    SizedBox(width: 150, child: MyTextField.primary(labelText: "ID", controller: postIdController, isDisable: true)),
                  ]),
                  Padding(padding: MyPadding.bottom, child: Divider(color: MyColor.off)),
                  MyTextField.primary(
                      focusNode: updateFocusNode,
                      labelText: "New Youtube Video Url",
                      controller: youTubeUrlController,
                      onFieldSubmitted: (value) async {
                        setState(() => updateIsLoading = true);
                        dynamic result = await API.updateUrl(url: youTubeUrlController.text, postId: postIdController.text);
                        setState(() => errorConsole = result);
                        result == "yes"
                            ? Show.success().then((value) => setState(() {
                                  postIdController.clear();
                                  youTubeUrlController.clear();
                                  videoTitleController.clear();
                                  driveUrlController.clear();
                                  searchFocusNode.requestFocus();
                                }))
                            : Show.error();
                        setState(() => updateIsLoading = false);
                      }),
                  MyButton.primary(
                      isLoading: updateIsLoading,
                      label: "Initiate Changes",
                      onTap: () async {
                        setState(() => updateIsLoading = true);
                        dynamic result = await API.updateUrl(url: youTubeUrlController.text, postId: postIdController.text);
                        setState(() => errorConsole = result);
                        result == "yes"
                            ? Show.success().then((value) => setState(() {
                                  postIdController.clear();
                                  youTubeUrlController.clear();
                                  videoTitleController.clear();
                                  driveUrlController.clear();
                                  searchFocusNode.requestFocus();
                                }))
                            : Show.error();
                        setState(() => updateIsLoading = false);
                      })
                ]),
              Padding(padding: MyPadding.primary * 3, child: PRINTJson(errorConsole))
            ])));
  }
}
