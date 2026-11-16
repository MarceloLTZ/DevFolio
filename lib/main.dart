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
        title: const Text(
          'DevFolio Mobile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _CabecalhoPerfil(),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Métricas & Projetos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.bar_chart_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _GradeMetricas(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CabecalhoPerfil extends StatelessWidget {
  const _CabecalhoPerfil();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade700, Colors.indigo.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 46,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 43,
              backgroundColor: const Color(0xFFE30613),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/perfil.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Devs mobile',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Marcelo & Caio',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 18),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _Tag('Flutter'),
              _Tag('Dart'),
              _Tag('Git/GitHub'),
              _Tag('Clean Architecture'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String texto;
  const _Tag(this.texto);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        texto,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.25),
      side: BorderSide(color: Colors.white.withOpacity(0.15)),
      shape: const StadiumBorder(),
    );
  }
}

class _GradeMetricas extends StatelessWidget {
  const _GradeMetricas();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = constraints.maxWidth >= 700 ? 4 : 2;
        const espaco = 12.0;
        const alturaCard = 144.0;
        final larguraCard =
            (constraints.maxWidth - espaco * (colunas - 1)) / colunas;
        return GridView.count(
          crossAxisCount: colunas,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: espaco,
          crossAxisSpacing: espaco,
          childAspectRatio: larguraCard / alturaCard,
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
              valor: '345',
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
        );
      },
    );
  }
}
