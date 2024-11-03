import 'package:flutter/material.dart';
import '../models/reminder.dart';
import '../services/notification_service.dart';

class DetoksHomePage extends StatefulWidget {
  @override
  _DetoksHomePageState createState() => _DetoksHomePageState();
}

class _DetoksHomePageState extends State<DetoksHomePage> {
  List<Reminder> reminders = [];
  final NotificationService _notificationService = NotificationService();

  void _scheduleReminder(Reminder reminder) {
    final now = DateTime.now();
    final reminderTime = DateTime(now.year, now.month, now.day, reminder.time.hour, reminder.time.minute);

    if (reminderTime.isAfter(now)) {
      final duration = reminderTime.difference(now);
      Future.delayed(duration, () {
        if (reminder.isActive) {
          _notificationService.showReminderNotification(reminder.message);
          _showPopupMessage(reminder.message);
        }
      });
    }
  }

  void _showPopupMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hatırlatma"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _addReminder(String message, TimeOfDay time) {
    final newReminder = Reminder(message: message, time: time);
    setState(() {
      reminders.add(newReminder);
    });
    _scheduleReminder(newReminder);
  }

  Future<void> _showAddReminderDialog() async {
    String message = '';
    TimeOfDay? time = TimeOfDay.now();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Hatırlatıcı Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Mesaj'),
                onChanged: (value) {
                  message = value;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: Text("Saat Seç"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                if (message.isNotEmpty && time != null) {
                  _addReminder(message, time!);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  void _deleteReminder(Reminder reminder) {
    setState(() {
      reminders.remove(reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dijital Detoks Hatırlatıcısı'),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ListTile(
            title: Text(reminder.message),
            subtitle: Text(reminder.time.format(context)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: reminder.isActive,
                  onChanged: (value) {
                    setState(() {
                      reminder.isActive = value;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteReminder(reminder),
                ),
              ],
            ),
            onTap: () => _showAddReminderDialog(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddReminderDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
