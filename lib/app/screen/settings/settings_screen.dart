import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: light ? Colors.white : Colors.black,
      appBar: AppBar(
        title: const Text("Profile Settings"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 151, 208, 255), // Outline color
                        width: 3, // Outline width
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/43/e2/d0/43e2d072cb46f66129cb67127c46ad52.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF2756FF), width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Kmaw",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "kmawkmaw@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Change Password"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notification Settings"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text("Privacy Settings"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Help & Support"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Language Settings"),
                trailing: DropdownMenuExample(),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark Mode"),
                trailing: SwitchExample(),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text("Account Security"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About App"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    const WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(
      <WidgetStatesConstraint, Color>{
        WidgetState.selected: Color.fromARGB(119, 0, 0, 0)
      },
    );

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(
      <WidgetState, Color>{
        WidgetState.selected:
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
        WidgetState.disabled: Colors.grey.shade400,
      },
    );

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}

const List<String> list = <String>['KH', 'EN', 'CH', 'FR'];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue, // Makes dropdown background transparent
        style:
            const TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Text style
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
