import 'package:flutter/material.dart';

void main() {
  runApp(ReceitinhaApp());
}

class ReceitinhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitinha para agora!',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: TelaLoading(),
    );
  }
}

class TelaLoading extends StatefulWidget {
  @override
  _TelaLoadingState createState() => _TelaLoadingState();
}

class _TelaLoadingState extends State<TelaLoading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => TelaPrincipal()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 72, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Receitinha para agora!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<String> ingredientesSelecionados = [];

  final List<String> ingredientesDisponiveis = [
    'ovo',
    'leite',
    'achocolatado',
    'banana',
    'farinha',
    'tomate',
    'sardinha',
    'queijo',
    'manteiga',
    'fermento',
    'alho',
    'cebola',
    'açucar',
    'sal',
    'peito de frango',
    'batata',
  ];

  void alternarIngrediente(String ing) {
    setState(() {
      if (ingredientesSelecionados.contains(ing)) {
        ingredientesSelecionados.remove(ing);
      } else {
        ingredientesSelecionados.add(ing);
      }
    });
  }

  void irParaReceitas() {
    // Aqui vamos depois filtrar e navegar para a próxima tela
    print('Selecionados: $ingredientesSelecionados');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant_menu, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Receitinha para agora!',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'O que você tem em casa?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ingredientesDisponiveis.map((ing) {
                final selecionado = ingredientesSelecionados.contains(ing);
                return FilterChip(
                  label: Text(ing),
                  selected: selecionado,
                  onSelected: (_) => alternarIngrediente(ing),
                  selectedColor: Colors.deepOrange[200],
                );
              }).toList(),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: irParaReceitas,
                child: Text(
                  'Encontrar Receitas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
