// import 'package:bloc_demo/main_export.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
//       body: Center(
//         child: BlocBuilder<UserBloc, UserState>(
//           builder: (BuildContext context, state) {
//             // debugPrint("$state");
//             if (state is UserLoading) {
//               return CircularProgressIndicator.adaptive();
//             } else if (state is UserFetched) {
//               return ListView.separated(
//                 itemBuilder: (_, index) {
//                   final user = state.user[index];
//                   return ListTile(
//                     leading: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.network(
//                         "https://picsum.photos/250?image=9",
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     title: Text(user.title ?? '', style: Theme.of(context).textTheme.bodySmall),
//                     subtitle: Text(user.completed.toString(), style: Theme.of(context).textTheme.bodySmall),
//                     trailing: IconButton(
//                       onPressed: (){
//                         context.read<UserBloc>().add(ToggleUserLike(index: index));
//                         debugPrint("GetUsers event dispatched");
//                       },
//                       icon: user.completed ?? false ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border),
//                     ),
//                   );
//                 },
//                 itemCount: state.user.length,
//                 separatorBuilder: (BuildContext context, int index) {
//                   return SizedBox(height: 10);
//                 },
//               );
//             } else if (state is ErrorInLoading) {
//               return Center(child: Text("Error"));
//             }
//             return SizedBox.shrink();
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read<UserBloc>().add(GetUsers());
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
