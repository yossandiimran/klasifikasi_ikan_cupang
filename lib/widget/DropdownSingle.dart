// ignore_for_file: file_names, prefer_typing_uninitialized_variables
part of '../header.dart';

class DropdownSingle {
  getItemsDropdown({required selection, required data}) {
    List<DropdownMenuItem<String>> widget = [];
    if (selection == "durasi") {
      widget.add(
        DropdownMenuItem(
          value: "3",
          child: Text("3 hari 2 Malam", style: textStyling.styleText4(13)),
        ),
      );
      widget.add(
        DropdownMenuItem(
          value: "2",
          child: Text("2 hari 1 Malam", style: textStyling.styleText4(13)),
        ),
      );
      widget.add(
        DropdownMenuItem(
          value: "1",
          child: Text("1 hari", style: textStyling.styleText4(13)),
        ),
      );
    }
    return widget;
  }
}
