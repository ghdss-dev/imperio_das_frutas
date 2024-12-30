import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 90, // Largura proporcional ao texto
        height: 40, // Altura reduzida
        margin: const EdgeInsets.symmetric(horizontal: 8), // Espaço entre os itens
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Arredondamento
          color: isSelected ? Colors.orange : Colors.transparent, // Cor do fundo
        ),
        alignment: Alignment.center, // Centraliza o texto
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, // Cor do texto
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Negrito se selecionado
            fontSize: 14, // Tamanho da fonte ajustado
          ),
        ),
      ),
    );
  }
}