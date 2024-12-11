import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bdoor"),
        backgroundColor: Color(0xFF02FFF7),
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu)
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert)
          ),
        ],
        flexibleSpace: Image.asset("assests/img1.jpg",
        fit: BoxFit.cover,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(Icons.brightness_4),
            title: Text('Brightness Auto'),
            subtitle: Text('Adjest the brightness'),
            trailing: Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Change Image'),
            subtitle: Text('change image'),
            trailing: Icon(Icons.menu),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Change Image'),
            subtitle: Text('change image'),
            trailing: Icon(Icons.menu),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Change Image'),
            subtitle: Text('change image'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Change Image'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Backups'),
          ),
        ],
      ),
    );
  }
}
// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'tist view',
// style: Theme.of(context).textTheme.displaySmall,
// ),
// Container(
// height: 200,
// color: Colors.blue,
// ),
// Container(
// height: 200,
// color: Colors.grey,
// ),
// Container(
// height: 200,
// color: Colors.orange,
// ),
// ],
// ),
// ),