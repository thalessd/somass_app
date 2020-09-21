import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:somass_app/app/home/components/section_title.dart';
import 'package:somass_app/app/shared/constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(Style.APP_MARGIN),
        children: [
          SizedBox(
            height: 8,
          ),
          SvgPicture.asset("assets/images/devdes-brand-color.svg", width: 230),
          SizedBox(
            height: 18,
          ),
          Text(
            "Desenvolvimento de Softwares",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          SectionTitle(
            title: "Contatos",
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            onTap: () { launch("tel:89 99988 9460"); },
            leading: Icon(Icons.phone),
            title: Text("Telefone"),
            subtitle: Text("89 99988 9460"),
          ),
          ListTile(
            onTap: () { launch("https://api.whatsapp.com/send?phone=5589999889460"); },
            leading: Icon(MdiIcons.whatsapp),
            title: Text("Whatsapp"),
            subtitle: Text("89 99988 9460"),
          ),
          ListTile(
            onTap: () { launch("https://instagram.com/devdes.io"); },
            leading: Icon(MdiIcons.instagram),
            title: Text("Instagram"),
            subtitle: Text("@devdes.io"),
          ),
          ListTile(
            onTap: () { launch("https://devdes.io"); },
            leading: Icon(MdiIcons.application),
            title: Text("Site"),
            subtitle: Text("www.devdes.io"),
          ),
          SizedBox(
            height: 8,
          ),
          SectionTitle(
            title: "Iniciativa",
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Este aplicativo foi criado com o intuito"
                " de ajudar, a todos que possuem um celular inteligente, consigam,"
                " marcar o melhor horário e dia da semana para "
                "participar da missa, eliminando a necessidade de entrar em "
                "contato via mensagem de texto e afins.",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 8,
          ),
          SectionTitle(
            title: "Participantes",
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Desenvolvimento"),
            subtitle: Text(
                "Thales de Carvalho Nascimento\n89 99988 9460 | @thalessd"),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
