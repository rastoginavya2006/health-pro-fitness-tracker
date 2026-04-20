// import 'package:flutter/material.dart';
// export 'home_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 202, 24, 122),
//         title: Text("Welocme to Web Technologyyyyyy"),
//         centerTitle: true,
//       ),
//       body: Container(
//         height: 200,
//         width: 200,
//         decoration: BoxDecoration(
//           color: Colors.orange,
//           // borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.green, width: 5),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withAlpha(255),
//               blurRadius: 10,
//               spreadRadius: 10,
//               offset: Offset(5, 5),
//             ),
//           ],
//           shape: BoxShape.circle,
//           gradient: LinearGradient(
//             colors: [Colors.red, Colors.orange, Colors.yellow],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// export 'home_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor : Colors.amber,
//         title: Text("Web Technology"),
//         centerTitle: true
//       ),
//       body: Center(
//         child: Text("Hello", textScaler: TextScaler.linear(5)),
//       )
//     );
//   }
// }

// class HomeScreen1 extends StatefulWidget {
//   const HomeScreen1({super.key});

//   @override
//   State<HomeScreen1> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor : Colors.amber,
//         title: Text("Web Technology"),
//         centerTitle: true
//       ),
//       body: ElevatedButton(
//         onPressed: () {
//           print('Hello');
//         },
//         child: Text('Submit')
//       )
//     );
//   }
// }







// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(height: 100, width: 200, color: const Color.fromARGB(255, 76, 212, 7)),
//             Container(height: 200, width: 200, color: const Color.fromARGB(255, 255, 0, 0)),
//             Container(height: 200, width: 200, color: const Color.fromARGB(255, 228, 117, 209)),
//             Container(height: 200, width: 200, color: const Color.fromARGB(255, 255, 230, 0)),
//              Container(height: 200, width: 200, color: const Color.fromARGB(255, 73, 216, 183)),
//             Container(height: 200, width: 200, color: const Color.fromARGB(255, 81, 232, 255)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen1 extends StatefulWidget {
//   const HomeScreen1({super.key});

//   @override
//   State<HomeScreen1> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor : Colors.amber,
//         title: Text("Web Technology"),
//         centerTitle: true
//       ),
//       body: ElevatedButton(
//         onPressed: () {
//           print('Hello');
//         },
//         child: Text('Submit')
//       )
//     );
//   }
// }










// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(backgroundColor: Colors.amber,),
//       body:ListView(
//         padding: EdgeInsets.all(20),
//         scrollDirection: Axis.horizontal,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 114, 8, 1),
//             width: 100,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 165, 46, 38),
//             width: 100,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 190, 17, 5),
//             width: 100,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 255, 18, 1),
//             width: 100,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 237, 87, 77),
//             width: 100,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             color: const Color.fromARGB(255, 231, 145, 145),
//             width:100,
//           )

//         ],
//       ) 
//     );
//   }
// }

// class HomeScreen1 extends StatefulWidget {
//   const HomeScreen1({super.key});

//   @override
//   State<HomeScreen1> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor : Colors.amber,
//         title: Text("Web Technology"),
//         centerTitle: true
//       ),
//       body: ElevatedButton(
//         onPressed: () {
//           print('Hello');
//         },
//         child: Text('Submit')
//       )
//     );
//   }
// }








// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text("Creative UI"),
//         centerTitle: true,
//         elevation: 0, // Flat look
//       ),
//       body: Column(
//         children: [
//           // Horizontal Stories/Profiles
//           const Padding(
//             padding: EdgeInsets.only(top: 20, left: 20),
//             child: Align(alignment: Alignment.centerLeft, child: Text("Recent Highlights", style: TextStyle(fontWeight: FontWeight.bold))),
//           ),
//           SizedBox(
//             height: 120, // Height fixed karni padti hai ListView ke liye
//             child: ListView.builder(
//               padding: const EdgeInsets.all(15),
//               scrollDirection: Axis.horizontal,
//               itemCount: 6,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 15),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.amber, width: 3), // Story border
//                   ),
//                   child: CircleAvatar(
//                     radius: 35,
//                     backgroundColor: Colors.red[100 * (index + 1)],
//                     child: Icon(Icons.person, color: Colors.red[900]),
//                   ),
//                 );
//               },
//             ),
//           ),
          
//           const Divider(),

//           // A more interesting Button
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: InkWell(
//               onTap: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text("Profile submitted successfully!"),
//                     backgroundColor: Colors.green,
//                     behavior: SnackBarBehavior.floating,
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(colors: [Colors.amber, Colors.orange]),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))
//                   ]
//                 ),
//                 child: const Center(
//                   child: Text("SUBMIT PROFILE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text("Creative UI"),
//         centerTitle: true,
//         elevation: 0, // Flat look
//       ),
//       body: Image(image: AssetImage('assets/images/1.png'),
        

//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   State<MyCustomForm> createState() => _MyCustomFormState();
// }

// class _MyCustomFormState extends State<MyCustomForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registration Form"),
//         backgroundColor: Colors.amber,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 25),
                
//                 // Name
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
//                   validator: (value) => value == null || value.isEmpty ? 'Enter name' : null,
//                 ),
//                 const SizedBox(height: 15),

//                 // Email
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) => value != null && !value.contains('@') ? 'Invalid email' : null,
//                 ),
//                 const SizedBox(height: 15),

//                 // Mobile
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Mobile', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone), prefixText: '+91 '),
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   validator: (value) => value?.length != 10 ? 'Enter 10 digits' : null,
//                 ),
//                 const SizedBox(height: 15),

//                 // Password
//                 TextFormField(
//                   obscureText: !_isPasswordVisible,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: const OutlineInputBorder(),
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
//                       onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
//                     ),
//                   ),
//                   validator: (value) => (value?.length ?? 0) < 6 ? 'Min 6 chars required' : null,
//                 ),
//                 const SizedBox(height: 30),

//                 // Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing...')));
//                       }
//                     },
//                     child: const Text('REGISTER', style: TextStyle(fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _resetCounter() {
//     setState(() {
//       _counter = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Counter Screen"),
//         backgroundColor: const Color.fromARGB(255, 226, 207, 4),
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _resetCounter, // Reset logic
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Current Count Value:"),
//             Text(
//               '$_counter',
//               style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// class HomeProvider with ChangeNotifier{
//   int count=0;
//   void incremnet(){
//     count++;
//     notifyListeners();
//   }
// }




// Business Card

// import 'package:flutter/material.dart';

// class BusinessCard extends StatelessWidget {
//   const BusinessCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.indigo,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.white,
//               child: Icon(Icons.code, size: 50, color: Colors.indigo),
//             ),
//             Text(
//               'Navya Rastogi',
//               style: TextStyle(
//                 fontSize: 32,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'FLUTTER DEVELOPER',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//                 letterSpacing: 2.0,
//               ),
//             ),
//             Divider(indent: 80, endIndent: 80, color: Colors.white30),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//               child: ListTile(
//                 leading: Icon(Icons.email, color: Colors.indigo),
//                 title: Text('rastoginavya2006@gmail.com'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: const Text('Go to Profile'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: const Text('Go to Settings', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
