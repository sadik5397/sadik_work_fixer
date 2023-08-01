import 'package:flutter/material.dart';
import 'package:sadik_work_fixer/others/colors.dart';
import 'package:sadik_work_fixer/others/data_table.dart';

import 'others/api.dart';
import 'others/button.dart';
import 'others/data_tile.dart';
import 'others/heading.dart';
import 'others/padding.dart';
import 'others/text_field.dart';

class FindChannel extends StatefulWidget {
  const FindChannel({Key? key}) : super(key: key);

  @override
  State<FindChannel> createState() => _FindChannelState();
}

class _FindChannelState extends State<FindChannel> {
  TextEditingController youTubeUrlListController = TextEditingController();
  bool searchIsLoading = false;
  bool dataBaseCreated = false;
  int totalYouTubeVideoLength = 0;
  List<String> youTubeVideoList = [];
  List<String> channelName = [];
  List<String> jobStatusList = [];
  int progress = 0;

  Future<void> createDataTable() async {
    youTubeVideoList = youTubeUrlListController.text.split("\n");
    channelName = List.generate(youTubeVideoList.length, (index) => '---');
    jobStatusList = List.generate(youTubeVideoList.length, (index) => 'PENDING');
    setState(() => dataBaseCreated = true);
    for (int i = 0; i < totalYouTubeVideoLength; i++) {
      dynamic searchResult = await API.findChannel(url: youTubeVideoList[i]);
      if (searchResult != null) {
        setState(() {
          jobStatusList[i] = "SUCCESS";
          channelName[i] = searchResult.toString();
        });
      } else {
        setState(() => jobStatusList[i] = "FAILED");
      }
    }
    setState(() => progress++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: MyPadding.value * 8, title: const Heading(title: "Find Channel ID From Video Link")),
        body: Padding(
            padding: MyPadding.primaryAndQrt.copyWith(top: MyPadding.value * 2),
            child: Column(children: [
              MyTextField.primary(
                  labelText: "Youtube Video URL List",
                  controller: youTubeUrlListController,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) => setState(() => totalYouTubeVideoLength = value.split("\n").length)),
              DataTile.one(title: "Total YT Links", value: totalYouTubeVideoLength.toString()),
              if (totalYouTubeVideoLength > 0)
                MyButton.primary(
                    margin: MyPadding.top * 2,
                    isLoading: searchIsLoading,
                    label: "Initiate Search",
                    onTap: () async {
                      setState(() => searchIsLoading = true);
                      await createDataTable();
                      setState(() => searchIsLoading = false);
                    }),
              if (dataBaseCreated)
                Padding(padding: MyPadding.primary * 2, child: LinearProgressIndicator(value: progress / totalYouTubeVideoLength, minHeight: 12, color: MyColor.success, backgroundColor: MyColor.off)),
              if (dataBaseCreated)
                MyDataTable.place(
                    dataTable: MyDataTable.table(
                        header: ["Youtube Link", "Status", "Result"],
                        rows: List.generate(youTubeVideoList.length, (index) => MyDataTable.row(index: index, values: [youTubeVideoList[index], jobStatusList[index], channelName[index]]))))
            ])));
  }
}
