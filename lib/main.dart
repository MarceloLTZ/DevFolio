import 'package:flutter/material.dart';
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DevFolioHomePage(),
    );
  }
}

class DevFolioHomePage extends StatelessWidget {
  const DevFolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevFolio Mobile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- TELA 01: PERFIL & CRACHÁ ---
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: const Color(0xFFE30613), child: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset('assets/images/perfil.jpg', fit: BoxFit.contain)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Desenvolvedor Mobile',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Turma t2dev-t3 • PPDM',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: const [
                          Chip(label: Text('Flutter')),
                          Chip(label: Text('Dart')),
                          Chip(label: Text('Git/GitHub')),
                          Chip(label: Text('Clean Architecture')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // --- TELA 02: DASHBOARD DE MÉTRICAS & PROJETOS ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Métricas & Projetos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.bar_chart, color: Colors.grey),
                ],
              ),

              const SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: const [
                  BlocoEstatistica(
                    titulo: 'Projetos Concluídos',
                    valor: '12',
                    icone: Icons.folder_special,
                    corIcone: Colors.greenAccent,
                    selo: 'Ativo',
                  ),
                  BlocoEstatistica(
                    titulo: 'Commits Realizados',
                    valor: '348',
                    icone: Icons.legend_toggle,
                    corIcone: Colors.cyanAccent,
                    selo: 'Top 5%',
                  ),
                  BlocoEstatistica(
                    titulo: 'Repositórios Git',
                    valor: '8',
                    icone: Icons.code,
                    corIcone: Colors.orangeAccent,
                  ),
                  BlocoEstatistica(
                    titulo: 'Horas de Código',
                    valor: '120h',
                    icone: Icons.timer,
                    corIcone: Colors.purpleAccent,
                    selo: 'Semestre',
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
