class Video {
  String? id;
  String? title;
  String? img;
  String? channel;
  String? description;

  Video({this.id, this.channel, this.description, this.img, this.title});
//O PROBLEMA DO METODO ABAIXO É QUE ELE OCUPA MUITO ESPACO DA MEMORIA
//PORQUE ELE INSTANCIA ITEM POR ITEM DA LISTA DO MAP
  // static converterJson(Map<String, dynamic> json){
  //   return Video(
  //     id: json["id"]["videoId"],
  //     title: json["snippet"]["title"],
  //     img: json["snippet"]["thumbnails"]["high"]["url"],
  //     channel: json["snippet"]["channelId"],
  //   );
  // }

  //PARA RESOLVER ISSO USAMOS O CONSTRUTOR FACTORY QUE NAO EH NADA ALEM
  //DE UM CONSTRUTOR STATIC, POREM NAO PODE USAR STATIC PRA CONSTRUTOR
  //AULA 101 EXPLICA CERTINHO AOS 15 MINUTOS
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      img: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelTitle"],
      description: json["snippet"]["description"],
    );
  }
}
