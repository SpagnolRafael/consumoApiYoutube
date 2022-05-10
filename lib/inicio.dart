// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_local_variable
import 'package:youtube/reproducao.dart';

import 'package:flutter/material.dart';
import 'package:youtube/api.dart';

import 'model/video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisas) {
    Future<List<Video>> videos;
    Api api = Api();

    return api.searchMethod(pesquisas);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    List<Video>? videos = snapshot.data!;
                    Video video = videos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReprodutorVideo(video.id),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              //border: ,
                              image: DecorationImage(
                                image: NetworkImage(video.img!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //child: Text("OI"),
                          ),
                          ListTile(
                            title: Text(video.title!),
                            subtitle: Text(video.channel!),
                          )
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text("Nada a ser exibido..."),
              );
            }
        }
      },
    );
  }
}
