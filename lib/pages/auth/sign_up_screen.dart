import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../config/custom_colors.dart';
import '../common_widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final cpffFormatter = MaskTextInputFormatter(
   mask: '###.###.###-##',
   filter:{'#':RegExp(r'[0-9]')},
  );
 final phoneFormatter = MaskTextInputFormatter(
   mask: '##.#.####-####',
   filter:{'#':RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customConstrastColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
               Positioned(
                          top: 10,
                         left: 10,
                          child: SafeArea(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  //formulario de cadastro
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 244, 244, 244),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Customtextfield(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                         const SizedBox(height: 16),
                        const Customtextfield(
                          icon: Icons.lock,
                          label: 'Senha',
                          issecret: true,
                        ), const SizedBox(height: 16),
                      
                        const Customtextfield(
                          icon: Icons.person,
                          label: 'Nome',
                        ), 
                        const SizedBox(height: 16),
                      
                        Customtextfield(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters:[phoneFormatter],
                        ),
                         const SizedBox(height: 16),
                      
                        Customtextfield(
                          icon: Icons.file_copy,
                          label: 'Cpf',
                          inputFormatters: [cpffFormatter],
                        ), const SizedBox(height: 16),
                      
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar Usuario',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}