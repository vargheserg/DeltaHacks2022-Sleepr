import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:intl/intl.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'globals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPage createState() => _SettingsPage();
}


class _SettingsPage extends State<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Personalization'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: Text('Preferred wake up time'),
                // sketchy code
                value: Text(DateFormat.jm().format(DateTime(1,1,1,wakeupTime.hour,wakeupTime.minute))),
                onPressed: _selectTime,
              ),
              SettingsTile.navigation(
                title: Text('Preferred hours of sleep'),
                value: Text(hoursOfSleep.toString()),
                onPressed: _showIntegerDialog,
              ),
            ],
          ),
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              // SettingsTile.switchTile(
              //   onToggle: (value) {},
              //   initialValue: isSwitched,
              //   leading: Icon(Icons.format_paint),
              //   title: Text('Dark mode'),
              // ),
            ],
          ),

        ],
      ),
    );
  }
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked_s = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(wakeupTime != picked_s && picked_s != null) {
      setState(() {
        wakeupTime = picked_s;
    });
   }
  }

  Future<void> _showIntegerDialog(BuildContext context) async {
    int? a = await showMaterialNumberPicker(
      context: context,
      title: "Preferred hours of sleep",
      maxNumber: 12,
      minNumber: 1,
      selectedNumber: hoursOfSleep,
    );
    if(a != null) {
      setState(() {
        hoursOfSleep = a;
      });
    }
  }

}


