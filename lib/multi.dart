import 'package:flutter/material.dart';
import 'package:sadik_work_fixer/others/colors.dart';
import 'package:sadik_work_fixer/others/data_table.dart';

import 'others/api.dart';
import 'others/button.dart';
import 'others/data_tile.dart';
import 'others/heading.dart';
import 'others/padding.dart';
import 'others/text_field.dart';

class SadikWorkDataBaseMultiFixer extends StatefulWidget {
  const SadikWorkDataBaseMultiFixer({Key? key}) : super(key: key);

  @override
  State<SadikWorkDataBaseMultiFixer> createState() => _SadikWorkDataBaseMultiFixerState();
}

class _SadikWorkDataBaseMultiFixerState extends State<SadikWorkDataBaseMultiFixer> {
  TextEditingController driveUrlListController = TextEditingController();
  TextEditingController youTubeUrlListController = TextEditingController();
  bool searchIsLoading = false;
  bool dataBaseCreated = false;
  int totalDriveVideoLength = 0;
  int totalYouTubeVideoLength = 0;
  List<String> driveVideoList = [];
  List<String> youTubeVideoList = [];
  List<String> videoTitleList = [];
  List<String> videoIdList = [];
  List<String> jobStatusList = [];
  int progress = 0;

  Future<void> createDataTable() async {
    driveVideoList = driveUrlListController.text.split("\n");
    youTubeVideoList = youTubeUrlListController.text.split("\n");
    videoTitleList = List.generate(driveVideoList.length, (index) => '---');
    jobStatusList = List.generate(driveVideoList.length, (index) => 'PENDING');
    videoIdList = List.generate(driveVideoList.length, (index) => '-');
    setState(() => dataBaseCreated = true);
    for (int i = 0; i < totalDriveVideoLength; i++) {
      dynamic searchResult = await API.findVideo(url: driveVideoList[i]);
      if (searchResult == null) {
        setState(() => jobStatusList[i] = "NOT FOUND");
        dynamic anotherSearchResult = await API.findVideo(url: youTubeVideoList[i]);
        if (anotherSearchResult != null) {
          setState(() {
            jobStatusList[i] = "ALREADY REPLACED";
            videoTitleList[i] = anotherSearchResult["post_title"].toString();
          });
        }
      } else {
        setState(() {
          videoTitleList[i] = searchResult["post_title"].toString();
          videoIdList[i] = searchResult["ID"].toString();
          jobStatusList[i] = "IN PROGRESS";
        });
        dynamic updateResult = await API.updateUrl(url: youTubeVideoList[i], postId: videoIdList[i]);
        updateResult == "yes" ? setState(() => jobStatusList[i] = "SUCCESS") : setState(() => jobStatusList[i] = "FAILED");
      }
      setState(() => progress++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: MyPadding.value * 8, title: const Heading(title: "Video Database Multi Fixer")),
        body: Padding(
            padding: MyPadding.primaryAndQrt.copyWith(top: MyPadding.value * 2),
            child: Column(children: [
              Row(children: [
                Expanded(
                    child: MyTextField.primary(
                        autoFocus: true,
                        labelText: "Existing Video Google Drive URL List",
                        controller: driveUrlListController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        onChanged: (value) => setState(() => totalDriveVideoLength = value.split("\n").length))),
                SizedBox(width: MyPadding.value),
                Expanded(
                    child: MyTextField.primary(
                        labelText: "New Youtube Video URL List",
                        controller: youTubeUrlListController,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) => setState(() => totalYouTubeVideoLength = value.split("\n").length)))
              ]),
              DataTile.two(titles: ["Total Drive Links", "Total YT Links"], values: [totalDriveVideoLength.toString(), totalYouTubeVideoLength.toString()]),
              if (totalDriveVideoLength == totalYouTubeVideoLength && totalDriveVideoLength > 0 && totalYouTubeVideoLength > 0)
                MyButton.primary(
                    margin: MyPadding.top * 2,
                    isLoading: searchIsLoading,
                    label: "Initiate Search & Replace Database",
                    onTap: () async {
                      setState(() => searchIsLoading = true);
                      await createDataTable();
                      setState(() => searchIsLoading = false);
                    }),
              if (dataBaseCreated)
                Padding(padding: MyPadding.primary * 2, child: LinearProgressIndicator(value: progress / totalDriveVideoLength, minHeight: 12, color: MyColor.success, backgroundColor: MyColor.off)),
              if (dataBaseCreated)
                MyDataTable.place(
                    dataTable: MyDataTable.table(header: [
                  "Drive Links",
                  "Found Video Title",
                  "Youtube Link",
                  "Status"
                ], rows: List.generate(driveVideoList.length, (index) => MyDataTable.row(index: index, values: [driveVideoList[index], videoTitleList[index], youTubeVideoList[index], jobStatusList[index]]))))
            ])));
  }
}
