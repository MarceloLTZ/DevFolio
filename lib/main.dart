import 'package:flutter/material.dart';
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatefulWidget {
  const DevFolioApp({super.key});

  @override
  State<DevFolioApp> createState() => _DevFolioAppState();
}

class _DevFolioAppState extends State<DevFolioApp> {
  ThemeMode _modo = ThemeMode.dark;

  void _alternarTema() {
    setState(() {
      _modo = _modo == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  ThemeData _montarTema(Brightness brilho) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: brilho,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: _montarTema(Brightness.light),
      darkTheme: _montarTema(Brightness.dark),
      themeMode: _modo,
      home: DevFolioHomePage(
        modoEscuro: _modo == ThemeMode.dark,
        aoAlternarTema: _alternarTema,
      ),
    );
  }
}

class DevFolioHomePage extends StatelessWidget {
  final bool modoEscuro;
  final VoidCallback aoAlternarTema;

  const DevFolioHomePage({
    super.key,
    required this.modoEscuro,
    required this.aoAlternarTema,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DevFolio Mobile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: modoEscuro ? 'Tema claro' : 'Tema escuro',
            icon: Icon(modoEscuro ? Icons.light_mode : Icons.dark_mode),
            onPressed: aoAlternarTema,
          ),
        ],
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

/// Animação de entrada: o card aparece com fade e sobe levemente.
class _Entrada extends StatelessWidget {
  final int atrasoMs;
  final Widget child;

  const _Entrada({required this.atrasoMs, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + atrasoMs),
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, t, filho) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - t)),
          child: filho,
        ),
      ),
    );
  }
}

class _GradeMetricas extends StatelessWidget {
  const _GradeMetricas();

  // TODO: ajuste as descrições (aparecem ao tocar no card)
  static const List<BlocoEstatistica> _blocos = [
    BlocoEstatistica(
      titulo: 'Projetos Concluídos',
      valor: '12',
      icone: Icons.folder_special,
      corIcone: Colors.greenAccent,
      selo: 'Ativo',
      descricao: 'Projetos finalizados e entregues ao longo do curso.',
    ),
    BlocoEstatistica(
      titulo: 'Commits Realizados',
      valor: '345',
      icone: Icons.legend_toggle,
      corIcone: Colors.cyanAccent,
      selo: 'Top 5%',
      descricao: 'Total de commits registrados nos repositórios da dupla.',
    ),
    BlocoEstatistica(
      titulo: 'Repositórios Git',
      valor: '8',
      icone: Icons.code,
      corIcone: Colors.orangeAccent,
      descricao: 'Repositórios publicados no GitHub com código-fonte versionado.',
    ),
    BlocoEstatistica(
      titulo: 'Horas de Código',
      valor: '120h',
      icone: Icons.timer,
      corIcone: Colors.purpleAccent,
      selo: 'Semestre',
      descricao: 'Horas dedicadas à programação durante o semestre.',
    ),
  ];

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
          children: [
            for (var i = 0; i < _blocos.length; i++)
              _Entrada(atrasoMs: i * 150, child: _blocos[i]),
          ],
        );
      },
    );
  }
}
