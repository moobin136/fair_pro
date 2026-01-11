import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'get_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final List<GetDataModel> _getFirbaseDataList = [];
  bool _inProgress = false;

  Future<void> _getData() async {
    _inProgress = true;
    setState(() {});
    _getFirbaseDataList.clear();
    final QuerySnapshot snapshot =
        await _firebaseFirestore.collection('circket').get();
    for (DocumentSnapshot doc in snapshot.docs) {
      _getFirbaseDataList.add(
          GetDataModel.fromJson(doc.id, doc.data() as Map<String, dynamic>));
      print(_getFirbaseDataList);
    }
    _inProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase_Show_data_realtime'),
      ),
      body: Visibility(
        visible: _inProgress == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: _getFirbaseDataList.length,
            // itemCount: 10,
            itemBuilder: (context, index) {
              GetDataModel getDataModel = _getFirbaseDataList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorIndicator(getDataModel.isMatchRunning),
                  radius: 12,
                ),
                title: Text(
                  getDataModel.matchID,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '${getDataModel.teamOne}\n${getDataModel.teamTow}\nWiner: ${getDataModel.matchID}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  'Score Data : ${getDataModel.teamOneScore}/${getDataModel.teamTowScore}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              );
            }),
      ),
    );
  }

  Color colorIndicator(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.deepOrange;
  }
}
