import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

Widget obraComponent({
  required String entNome,
  required String entEmail,
  required String entImg,
  required String entCategoria,
  required String entMorada,
  required String entContacto,
  required String cliDesc,
  required BuildContext context,
  required deletar,
}) {
  return Card(
    elevation: 4,
    color: Colors.white60,
    child: Container(
      padding: const EdgeInsets.all(4.0),
      width: larguraPor(100, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text(entNome),
            subtitle: Text(entEmail),
            trailing: Text(entCategoria),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição da Minha Obra:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$cliDesc")
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Morada: $entMorada",
              style: TextStyle(fontSize: 13),
            ),
            subtitle: Text(
              "Contacto: $entContacto",
              style: TextStyle(fontSize: 13),
            ),
            trailing: ElevatedButton.icon(
              onPressed: deletar,
              icon: Icon(Icons.delete_forever_rounded),
              label: Text("Eliminar"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget obraComponentAceitado({
  required String entNome,
  required String entEmail,
  required String entImg,
  required String entCategoria,
  required String entMorada,
  required String entContacto,
  required String cliDesc,
  required String entDesc,
  required BuildContext context,
  required confirmar,
}) {
  return Card(
    elevation: 4,
    color: Colors.white60,
    child: Container(
      padding: const EdgeInsets.all(4.0),
      width: larguraPor(100, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text(entNome),
            subtitle: Text(entEmail),
            trailing: Text(entCategoria),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição da Minha Obra:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$cliDesc")
              ],
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contra-proposta da Entidade:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600]),
                ),
                Text("$entDesc")
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Morada: $entMorada",
              style: TextStyle(fontSize: 13),
            ),
            subtitle: Text(
              "Contacto: $entContacto",
              style: TextStyle(fontSize: 13),
            ),
            trailing: ElevatedButton(
              onPressed: confirmar,
              child: Text("Aceitar contra-proposta"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget obraComponentRecibo({
  required String entNome,
  required String entEmail,
  required String entImg,
  required String entCategoria,
  required String entMorada,
  required String entContacto,
  required String cliDesc,
  required String entDesc,
  required BuildContext context,
}) {
  return Card(
    elevation: 4,
    color: Colors.white60,
    child: Container(
      padding: const EdgeInsets.all(4.0),
      width: larguraPor(100, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text(entNome),
            subtitle: Text(entEmail),
            trailing: Text(entCategoria),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição da Minha Obra:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$cliDesc")
              ],
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contra-proposta da Entidade:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600]),
                ),
                Text("$entDesc")
              ],
            ),
          ),
          Divider(),
          Column(
            children: [
              ListTile(
                title: Text(
                  "Morada: $entMorada",
                  style: TextStyle(fontSize: 13),
                ),
                subtitle: Text(
                  "Contacto: $entContacto",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_rounded,
                      ),
                      Text("Contrato Fechado"),
                    ],
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
