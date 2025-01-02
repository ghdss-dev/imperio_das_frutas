import 'package:flutter/material.dart';
import 'package:imperio_das_frutas/pages/common_widgets/custom_text_field.dart';
import 'package:imperio_das_frutas/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          Customtextfield(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          SizedBox(height: 16), // Espaçamento entre os campos

          Customtextfield(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          SizedBox(height: 16),

          Customtextfield(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),

          SizedBox(height: 16),

          Customtextfield(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            issecret: true,
          ),

          SizedBox(height: 32), // Espaçamento maior antes do botão

          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                updatePassword();
              },
              child: Text('Atualizar Senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Customtextfield(
                      issecret: true,
                      icon: Icons.lock,
                      label: 'Senha atual',
                    ),
              
                    SizedBox(height: 16),
              
                    Customtextfield(
                      issecret: true,
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                    ),
              
                    SizedBox(height: 16),
              
                    Customtextfield(
                      issecret: true,
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                    ),
              
                    SizedBox(height: 16),
              
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                        onPressed: () {
              
                        },
                        child: Text('Atualizar'),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
