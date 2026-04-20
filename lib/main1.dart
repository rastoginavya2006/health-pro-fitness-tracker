// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/Settings/setting_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/Notes/notes_screen.dart';
import 'screens/Schedule/schedule_screen.dart';
import 'screens/task/task_screen.dart';


// void main() {
//   runApp(MaterialApp(home: MyCustomForm()));
// }


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
//         useMaterial3: true,
//       ),
//       // Yahan hum MyCustomForm ko call kar rahe hain jo dusri file mein hai
//       home: const MyCustomForm(), 
//     );
//   }
// }



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, 
//       title: 'Counter App',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
//       home: const CounterScreen(), 
//           );
//   }
// }




// void main() {
//   runApp(const MyCardApp());
// }

// class MyCardApp extends StatelessWidget {
//   const MyCardApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Business Card',
//       theme: ThemeData(useMaterial3: true),
//       home: const BusinessCard(), 
//     );
//   }
// }









// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider(create: (context){
//         return HomeProvider();
//       },
//       child: CounterScreen()),
//           );
//   }
// }













// Navigation from homescreen to profile and setting screen
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Multi-Screen App',
//       theme: ThemeData(primarySwatch: Colors.indigo),
   
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomeScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/settings': (context) => const SettingsScreen(),
//       },
//     );
//   }
// }





// void main() => runApp(const TaskApp());

// class TaskApp extends StatelessWidget {
//   const TaskApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
//       home: const MainNavigationShell(),
//     );
//   }
// }

// class MainNavigationShell extends StatefulWidget {
//   const MainNavigationShell({super.key});

//   @override
//   State<MainNavigationShell> createState() => _MainNavigationShellState();
// }

// class _MainNavigationShellState extends State<MainNavigationShell> {
//   int _selectedIndex = 0;

//   // List of screens for the tabs
//   final List<Widget> _screens = [
//     const TaskScreen(),
//     const ScheduleScreen(),
//     const NotesScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Schedule'),
//           BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
//         ],
//       ),
//     );
//   }
// }



//Sample problem -1 (SMART STUDENT ORGANIZER APP)
// import 'package:flutter/material.dart';

// void main() => runApp(const StudentOrganizerApp());

// // --- THEME & MODELS ---
// class StudentOrganizerApp extends StatelessWidget {
//   const StudentOrganizerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Smart Student Organizer',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         useMaterial3: true,
//         fontFamily: 'Georgia', // Custom Font usage
//       ),
//       // Named Routes
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const DashboardShell(),
//       },
//     );
//   }
// }

// // Data Structures
// class Task {
//   String title, desc, date;
//   bool isCompleted;
//   Task(this.title, this.desc, this.date, {this.isCompleted = false});
// }

// class ScheduleItem {
//   String subject, time;
//   ScheduleItem(this.subject, this.time);
// }

// // --- MAIN DASHBOARD SHELL ---
// class DashboardShell extends StatefulWidget {
//   const DashboardShell({super.key});
//   @override
//   State<DashboardShell> createState() => _DashboardShellState();
// }

// class _DashboardShellState extends State<DashboardShell> {
//   int _selectedIndex = 0;

//   // Shared Data (State)
//   List<Task> tasks = [Task("Web Exam", "Complete Flutter App", "2026-04-20")];
//   List<ScheduleItem> schedule = [
//     ScheduleItem("Maths", "09:00 AM"),
//     ScheduleItem("Web Tech", "11:00 AM"),
//   ];
//   List<String> notes = ["Don't forget the admit card!"];

//   // Tabs logic
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // We update pages here to reflect state changes
//     _pages = [
//       TasksModule(tasks: tasks, onToggle: (idx) => setState(() => tasks[idx].isCompleted = !tasks[idx].isCompleted), onAdd: (t) => setState(() => tasks.add(t))),
//       ScheduleModule(schedule: schedule),
//       NotesModule(notes: notes, onAdd: (n) => setState(() => notes.add(n))),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Student Organizer"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.indigo)),
//           )
//         ],
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
//           BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
//         ],
//       ),
//     );
//   }
// }

// // --- MODULE 1: TASKS ---
// class TasksModule extends StatelessWidget {
//   final List<Task> tasks;
//   final Function(int) onToggle;
//   final Function(Task) onAdd;

//   TasksModule({required this.tasks, required this.onToggle, required this.onAdd});

//   @override
//   Widget build(BuildContext context) {
//     int completedCount = tasks.where((t) => t.isCompleted).length;

//     return Column(
//       children: [
//         // Summary Cards
//         Row(
//           children: [
//             _buildSummaryCard("Total", "${tasks.length}", Colors.blue),
//             _buildSummaryCard("Done", "$completedCount", Colors.green),
//           ],
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: ListTile(
//                   leading: Icon(tasks[index].isCompleted ? Icons.check_circle : Icons.radio_button_unchecked, color: Colors.indigo),
//                   title: Text(tasks[index].title, style: TextStyle(decoration: tasks[index].isCompleted ? TextDecoration.lineThrough : null)),
//                   subtitle: Text("${tasks[index].desc}\nDue: ${tasks[index].date}"),
//                   trailing: IconButton(icon: Icon(Icons.done), onPressed: () => onToggle(index)),
//                 ),
//               );
//             },
//           ),
//         ),
//         FloatingActionButton(
//           onPressed: () => _showAddTaskDialog(context),
//           child: Icon(Icons.add),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   Widget _buildSummaryCard(String title, String count, Color color) {
//     return Expanded(
//       child: Card(
//         color: color,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(children: [Text(title, style: TextStyle(color: Colors.white)), Text(count, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))]),
//         ),
//       ),
//     );
//   }

//   void _showAddTaskDialog(BuildContext context) {
//     final titleCtrl = TextEditingController();
//     final descCtrl = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Add Task"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(controller: titleCtrl, decoration: InputDecoration(labelText: "Title")),
//             TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Description")),
//           ],
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
//           ElevatedButton(onPressed: () {
//             onAdd(Task(titleCtrl.text, descCtrl.text, "Today"));
//             Navigator.pop(context);
//           }, child: Text("Add")),
//         ],
//       ),
//     );
//   }
// }

// // --- MODULE 2: SCHEDULE ---
// class ScheduleModule extends StatelessWidget {
//   final List<ScheduleItem> schedule;
//   ScheduleModule({required this.schedule});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(10),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemCount: schedule.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text(schedule[index].subject),
//                 content: Text("Lecture Time: ${schedule[index].time}"),
//               ),
//             );
//           },
//           child: Card(
//             color: Colors.indigo[100],
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.book, size: 40, color: Colors.indigo),
//                   Text(schedule[index].subject, style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text(schedule[index].time),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // --- MODULE 3: NOTES ---
// class NotesModule extends StatelessWidget {
//   final List<String> notes;
//   final Function(String) onAdd;
//   NotesModule({required this.notes, required this.onAdd});

//   @override
//   Widget build(BuildContext context) {
//     final noteCtrl = TextEditingController();
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(child: TextField(controller: noteCtrl, decoration: InputDecoration(hintText: "Write a note..."))),
//               IconButton(icon: Icon(Icons.send), onPressed: () {
//                 if(noteCtrl.text.isNotEmpty) onAdd(noteCtrl.text);
//                 noteCtrl.clear();
//               }),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: notes.length,
//             itemBuilder: (context, index) => Card(child: ListTile(title: Text(notes[index]))),
//           ),
//         ),
//       ],
//     );
//   }
// }


// void main() => runApp(const StudentOrganizerApp());

// // --- THEME & MODELS ---
// class StudentOrganizerApp extends StatelessWidget {
//   const StudentOrganizerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Smart Student Organizer',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         useMaterial3: true,
//         fontFamily: 'Georgia', // Custom Font usage
//       ),
//       // Named Routes
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const DashboardShell(),
//       },
//     );
//   }
// }

// // Data Structures
// class Task {
//   String title, desc, date;
//   bool isCompleted;
//   Task(this.title, this.desc, this.date, {this.isCompleted = false});
// }

// class ScheduleItem {
//   String subject, time;
//   ScheduleItem(this.subject, this.time);
// }

// // --- MAIN DASHBOARD SHELL ---
// class DashboardShell extends StatefulWidget {
//   const DashboardShell({super.key});
//   @override
//   State<DashboardShell> createState() => _DashboardShellState();
// }

// class _DashboardShellState extends State<DashboardShell> {
//   int _selectedIndex = 0;

//   // Shared Data (State)
//   List<Task> tasks = [Task("Web Exam", "Complete Flutter App", "2026-04-20")];
//   List<ScheduleItem> schedule = [
//     ScheduleItem("Maths", "09:00 AM"),
//     ScheduleItem("Web Tech", "11:00 AM"),
//   ];
//   List<String> notes = ["Don't forget the admit card!"];

//   // Tabs logic
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // We update pages here to reflect state changes
//     _pages = [
//       TasksModule(tasks: tasks, onToggle: (idx) => setState(() => tasks[idx].isCompleted = !tasks[idx].isCompleted), onAdd: (t) => setState(() => tasks.add(t))),
//       ScheduleModule(schedule: schedule),
//       NotesModule(notes: notes, onAdd: (n) => setState(() => notes.add(n))),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Student Organizer"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.indigo)),
//           )
//         ],
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
//           BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
//         ],
//       ),
//     );
//   }
// }

// // --- MODULE 1: TASKS ---
// class TasksModule extends StatelessWidget {
//   final List<Task> tasks;
//   final Function(int) onToggle;
//   final Function(Task) onAdd;

//   TasksModule({required this.tasks, required this.onToggle, required this.onAdd});

//   @override
//   Widget build(BuildContext context) {
//     int completedCount = tasks.where((t) => t.isCompleted).length;

//     return Column(
//       children: [
//         // Summary Cards
//         Row(
//           children: [
//             _buildSummaryCard("Total", "${tasks.length}", Colors.blue),
//             _buildSummaryCard("Done", "$completedCount", Colors.green),
//           ],
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: ListTile(
//                   leading: Icon(tasks[index].isCompleted ? Icons.check_circle : Icons.radio_button_unchecked, color: Colors.indigo),
//                   title: Text(tasks[index].title, style: TextStyle(decoration: tasks[index].isCompleted ? TextDecoration.lineThrough : null)),
//                   subtitle: Text("${tasks[index].desc}\nDue: ${tasks[index].date}"),
//                   trailing: IconButton(icon: Icon(Icons.done), onPressed: () => onToggle(index)),
//                 ),
//               );
//             },
//           ),
//         ),
//         FloatingActionButton(
//           onPressed: () => _showAddTaskDialog(context),
//           child: Icon(Icons.add),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   Widget _buildSummaryCard(String title, String count, Color color) {
//     return Expanded(
//       child: Card(
//         color: color,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(children: [Text(title, style: TextStyle(color: Colors.white)), Text(count, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))]),
//         ),
//       ),
//     );
//   }

//   void _showAddTaskDialog(BuildContext context) {
//     final titleCtrl = TextEditingController();
//     final descCtrl = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Add Task"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(controller: titleCtrl, decoration: InputDecoration(labelText: "Title")),
//             TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Description")),
//           ],
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
//           ElevatedButton(onPressed: () {
//             onAdd(Task(titleCtrl.text, descCtrl.text, "Today"));
//             Navigator.pop(context);
//           }, child: Text("Add")),
//         ],
//       ),
//     );
//   }
// }

// // --- MODULE 2: SCHEDULE ---
// class ScheduleModule extends StatelessWidget {
//   final List<ScheduleItem> schedule;
//   ScheduleModule({required this.schedule});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(10),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemCount: schedule.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text(schedule[index].subject),
//                 content: Text("Lecture Time: ${schedule[index].time}"),
//               ),
//             );
//           },
//           child: Card(
//             color: Colors.indigo[100],
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.book, size: 40, color: Colors.indigo),
//                   Text(schedule[index].subject, style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text(schedule[index].time),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // --- MODULE 3: NOTES ---
// class NotesModule extends StatelessWidget {
//   final List<String> notes;
//   final Function(String) onAdd;
//   NotesModule({required this.notes, required this.onAdd});

//   @override
//   Widget build(BuildContext context) {
//     final noteCtrl = TextEditingController();
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(child: TextField(controller: noteCtrl, decoration: InputDecoration(hintText: "Write a note..."))),
//               IconButton(icon: Icon(Icons.send), onPressed: () {
//                 if(noteCtrl.text.isNotEmpty) onAdd(noteCtrl.text);
//                 noteCtrl.clear();
//               }),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: notes.length,
//             itemBuilder: (context, index) => Card(child: ListTile(title: Text(notes[index]))),
//           ),
//         ),
//       ],
//     );
//   }
// }