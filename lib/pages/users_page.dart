import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';

import 'package:chat_app/models/models.dart';




class UsersPage extends StatefulWidget {

  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final usuarios = [
    Usuario(
      uid: 'Cod001',
      nombre: 'Mónica Pineda', 
      email: 'monipineda@gmail.com', 
      online: true, 
    ),
    Usuario(
      uid: 'Cod002',
      nombre: 'Juan Alvira', 
      email: 'test2@gmail.com', 
      online: false, 
    ),
    Usuario(
      uid: 'Cod003',
      nombre: 'Guillermo Pérez', 
      email: 'monipineda@gmail.com', 
      online: true, 
    ),
  ];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.flash_on_outlined, color: Color.fromARGB(255, 217, 178, 7),),
          ),
          
        ],
        leading: IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.exit_to_app),
          color: Colors.black87,
        ),
      ),

      body: SmartRefresher(
         controller: _refreshController,
         enablePullDown: true,
         onRefresh: _uploadUser,
         header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
         ),
         child: _listViewUser()
      )
   );
  }

  ListView _listViewUser() {
    return ListView.separated(
      itemBuilder: (_, i) => usuarioListTile(usuarios[i]), 
      separatorBuilder: (_, i) => const Divider(), 
      itemCount: usuarios.length
    );
  }

  ListTile usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _uploadUser() async{
   
    await Future.delayed(const Duration(milliseconds: 1000));
    
    _refreshController.refreshCompleted();
  
  }
}