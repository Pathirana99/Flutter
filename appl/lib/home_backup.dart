// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'Asynchronous Programming',
// style: TextStyle(
// fontSize: 22,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: ElevatedButton(
// child: Text('CLICK ME'),
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => NetworkRequest()),
// );
// }),
// )
// // RaisedButton(child: Text('GET DATA'), onPressed: () {})
// ],
// ),
// ],
// ),
// ),
// );



// class Home extends StatefulWidget {
//   const Home({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   Future<List<User>> getUsers() async {
//     var url = Uri.parse('https://randomuser.me/api/?results=20');
//     late http.Response response;
//     List<User> users = [];
//     try {
//       response = await http.get(url);
//       if (response.statusCode == 200) {
//         Map peopleData = jsonDecode(response.body);
//         List<dynamic> peoples = peopleData["results"];
//
//         for (var item in peoples) {
//           var email = item['email'];
//           var name = item['name']['first'] + " " + item['name']['last'];
//           var id = item['login']['uuid'];
//           var avatar = item['picture']['large'];
//           User user = User(id, name, email, avatar);
//           users.add(user);
//         }
//       } else {
//         return Future.error("Somthing went wrong, ${response.statusCode}");
//       }
//     } catch (e) {
//       return Future.error(e.toString());
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent,
//         title: Text("Asynchronous Programming"),
//       ),
//       body: FutureBuilder(
//         future: getUsers(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Text('Waiting'),
//             );
//           } else {
//             if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage:
//                         NetworkImage(snapshot.data[index].avatar),
//                       ),
//                       title: Text(snapshot.data[index].name),
//                       subtitle: Text(snapshot.data[index].email),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 UserDetail(snapshot.data[index]),
//                           ),
//                         );
//                       },
//                     );
//                   });
//             }
//           }
//         },
//       ),
//     );
//   }
// }
