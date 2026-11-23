import 'package:flutter/material.dart';
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const DevFolioApp());
}

/// Modelo com os dados, habilidades e métricas individuais ou da dupla
class PerfilDev {
  final String id;
  final String nome;
  final String cargo;
  final String bio;
  final Color corDestaque;
  final Map<String, double> habilidades; // Habilidade -> Nível (0.0 a 1.0)
  final List<String> ferramentas;
  final List<DadoMetrica> metricas;

  const PerfilDev({
    required this.id,
    required this.nome,
    required this.cargo,
    required this.bio,
    required this.corDestaque,
    required this.habilidades,
    required this.ferramentas,
    required this.metricas,
  });
}

class DadoMetrica {
  final String titulo;
  final double valorNumerico;
  final String sufixo;
  final IconData icone;
  final Color corIcone;
  final String? selo;
  final String descricao;
  final double progressoMeta;

  const DadoMetrica({
    required this.titulo,
    required this.valorNumerico,
    this.sufixo = '',
    required this.icone,
    required this.corIcone,
    this.selo,
    required this.descricao,
    required this.progressoMeta,
  });
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

class DevFolioHomePage extends StatefulWidget {
  final bool modoEscuro;
  final VoidCallback aoAlternarTema;

  const DevFolioHomePage({
    super.key,
    required this.modoEscuro,
    required this.aoAlternarTema,
  });

  @override
  State<DevFolioHomePage> createState() => _DevFolioHomePageState();
}

class _DevFolioHomePageState extends State<DevFolioHomePage> {
  String _selecionadoId = 'dupla';

  // TODO: Personalize aqui as habilidades, bios e números do Marcelo e do Caio!
  static const Map<String, PerfilDev> _perfis = {
    'dupla': PerfilDev(
      id: 'dupla',
      nome: 'Marcelo & Caio',
      cargo: 'Dupla Full-Cycle Mobile • SENAI',
      bio: 'Desenvolvemos aplicativos completos unindo interfaces fluidas, arquitetura limpa e integração robusta com APIs.',
      corDestaque: Colors.deepPurpleAccent,
      habilidades: {
        'Desenvolvimento Flutter & Dart': 0.92,
        'Clean Architecture & Padrões': 0.85,
        'Versionamento & CI/CD (Git)': 0.90,
      },
      ferramentas: ['Flutter', 'Dart', 'Git/GitHub', 'Clean Architecture'],
      metricas: [
        DadoMetrica(
          titulo: 'Projetos Concluídos',
          valorNumerico: 12,
          icone: Icons.folder_special,
          corIcone: Colors.greenAccent,
          selo: 'Ativo',
          descricao: 'Projetos finalizados e entregues em conjunto ao longo do curso.',
          progressoMeta: 0.85,
        ),
        DadoMetrica(
          titulo: 'Commits Realizados',
          valorNumerico: 345,
          icone: Icons.legend_toggle,
          corIcone: Colors.cyanAccent,
          selo: 'Top 5%',
          descricao: 'Total de commits registrados nos repositórios compartilhados da dupla.',
          progressoMeta: 0.95,
        ),
        DadoMetrica(
          titulo: 'Repositórios Git',
          valorNumerico: 8,
          icone: Icons.code,
          corIcone: Colors.orangeAccent,
          descricao: 'Repositórios publicados no GitHub com código-fonte documentado.',
          progressoMeta: 0.80,
        ),
        DadoMetrica(
          titulo: 'Horas de Código',
          valorNumerico: 120,
          sufixo: 'h',
          icone: Icons.timer,
          corIcone: Colors.purpleAccent,
          selo: 'Semestre',
          descricao: 'Horas totais dedicadas à programação e pair programming no semestre.',
          progressoMeta: 0.75,
        ),
      ],
    ),
    'marcelo': PerfilDev(
      id: 'marcelo',
      nome: 'Marcelo',
      cargo: 'Frontend Mobile & UI/UX Specialist',
      bio: 'Focado na criação de interfaces responsivas, micro-interações, animações fluidas e experiência do usuário em Flutter.',
      corDestaque: Colors.cyanAccent,
      habilidades: {
        'UI/UX Design & Responsividade': 0.95,
        'Animações & Custom Widgets': 0.90,
        'Gerenciamento de Estado': 0.84,
        'Consumo de APIs REST': 0.80,
      },
      ferramentas: ['Flutter UI', 'Material 3', 'Figma', 'Animations', 'Provider/Bloc'],
      metricas: [
        DadoMetrica(
          titulo: 'Telas & Componentes',
          valorNumerico: 48,
          icone: Icons.widgets_rounded,
          corIcone: Colors.greenAccent,
          selo: 'UI/UX',
          descricao: 'Interfaces e widgets reutilizáveis desenhados e implementados pelo Marcelo.',
          progressoMeta: 0.90,
        ),
        DadoMetrica(
          titulo: 'Commits Realizados',
          valorNumerico: 182,
          icone: Icons.legend_toggle,
          corIcone: Colors.cyanAccent,
          selo: 'Frontend',
          descricao: 'Contribuições focadas em layout, temas e interatividade.',
          progressoMeta: 0.88,
        ),
        DadoMetrica(
          titulo: 'Protótipos Figma',
          valorNumerico: 11,
          icone: Icons.design_services,
          corIcone: Colors.orangeAccent,
          descricao: 'Protótipos navegáveis criados antes da codificação.',
          progressoMeta: 0.92,
        ),
        DadoMetrica(
          titulo: 'Horas de Código',
          valorNumerico: 64,
          sufixo: 'h',
          icone: Icons.timer,
          corIcone: Colors.purpleAccent,
          selo: 'Semestre',
          descricao: 'Horas dedicadas ao desenvolvimento visual e testes de usabilidade.',
          progressoMeta: 0.80,
        ),
      ],
    ),
    'caio': PerfilDev(
      id: 'caio',
      nome: 'Caio',
      cargo: 'Arquitetura, Lógica & Integrações',
      bio: 'Especialista em estruturação de código limpo, regras de negócio, persistência local e integração com serviços em nuvem.',
      corDestaque: Colors.orangeAccent,
      habilidades: {
        'Clean Architecture & SOLID': 0.94,
        'APIs REST & Firebase': 0.91,
        'Banco de Dados Local (SQLite/Hive)': 0.88,
        'Testes Unitários & Git Flow': 0.86,
      },
      ferramentas: ['Dart Core', 'Clean Arch', 'Firebase', 'REST APIs', 'Git Flow'],
      metricas: [
        DadoMetrica(
          titulo: 'APIs Integradas',
          valorNumerico: 15,
          icone: Icons.cloud_sync_rounded,
          corIcone: Colors.greenAccent,
          selo: 'Backend',
          descricao: 'Serviços externos, autenticações e bancos de dados conectados.',
          progressoMeta: 0.88,
        ),
        DadoMetrica(
          titulo: 'Commits Realizados',
          valorNumerico: 163,
          icone: Icons.legend_toggle,
          corIcone: Colors.cyanAccent,
          selo: 'Core',
          descricao: 'Contribuições focadas em regras de negócio, modelos e repositórios.',
          progressoMeta: 0.85,
        ),
        DadoMetrica(
          titulo: 'Pull Requests',
          valorNumerico: 29,
          icone: Icons.merge_type_rounded,
          corIcone: Colors.orangeAccent,
          descricao: 'Revisões de código e merges realizados nos repositórios da equipe.',
          progressoMeta: 0.90,
        ),
        DadoMetrica(
          titulo: 'Horas de Código',
          valorNumerico: 56,
          sufixo: 'h',
          icone: Icons.timer,
          corIcone: Colors.purpleAccent,
          selo: 'Semestre',
          descricao: 'Horas dedicadas à arquitetura, lógica e refatoração.',
          progressoMeta: 0.72,
        ),
      ],
    ),
  };

  void _selecionarEAbirDetalhes(String id) {
    setState(() {
      _selecionadoId = id;
    });

    // Se clicou especificamente no Marcelo ou no Caio, abre o painel de capacidades
    if (id == 'marcelo' || id == 'caio') {
      _mostrarCapacidadesModal(context, _perfis[id]!);
    }
  }

  void _mostrarCapacidadesModal(BuildContext context, PerfilDev perfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barrinha superior de arrastar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: perfil.corDestaque.withValues(alpha: 0.2),
                    child: Text(
                      perfil.nome[0],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: perfil.corDestaque,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          perfil.nome,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          perfil.cargo,
                          style: TextStyle(
                            fontSize: 13,
                            color: perfil.corDestaque,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                perfil.bio,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Principais Capacidades',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              ...perfil.habilidades.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${(entry.value * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: perfil.corDestaque,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: entry.value),
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutCubic,
                        builder: (context, valor, _) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: valor,
                            minHeight: 8,
                            backgroundColor:
                                perfil.corDestaque.withValues(alpha: 0.15),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              perfil.corDestaque,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 8),
              const Text(
                'Stack & Foco',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: perfil.ferramentas
                    .map(
                      (item) => Chip(
                        label: Text(
                          item,
                          style: const TextStyle(fontSize: 12),
                        ),
                        backgroundColor:
                            perfil.corDestaque.withValues(alpha: 0.12),
                        side: BorderSide(
                          color: perfil.corDestaque.withValues(alpha: 0.3),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final perfilAtual = _perfis[_selecionadoId]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DevFolio Mobile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: widget.modoEscuro ? 'Tema claro' : 'Tema escuro',
            icon: Icon(widget.modoEscuro ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.aoAlternarTema,
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
                  _CabecalhoPerfil(
                    selecionadoId: _selecionadoId,
                    onSelecionarDev: _selecionarEAbirDetalhes,
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            _selecionadoId == 'dupla'
                                ? 'Métricas & Projetos'
                                : 'Métricas • ${perfilAtual.nome}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_selecionadoId != 'dupla') ...[
                            const SizedBox(width: 10),
                            ActionChip(
                              label: const Text(
                                'Ver capacidades',
                                style: TextStyle(fontSize: 12),
                              ),
                              avatar: const Icon(Icons.person_search, size: 16),
                              onPressed: () =>
                                  _mostrarCapacidadesModal(context, perfilAtual),
                            ),
                          ],
                        ],
                      ),
                      Icon(
                        Icons.bar_chart_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _GradeMetricas(metricas: perfilAtual.metricas),
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
  final String selecionadoId;
  final ValueChanged<String> onSelecionarDev;

  const _CabecalhoPerfil({
    required this.selecionadoId,
    required this.onSelecionarDev,
  });

  static const Map<String, String> _infoTags = {
    'Flutter': 'Framework principal utilizado para criar interfaces nativas multiplataforma.',
    'Dart': 'Linguagem otimizada para UI com tipagem segura e programação assíncrona.',
    'Git/GitHub': 'Controle de versão colaborativo com branches, pull requests e code review.',
    'Clean Architecture': 'Separação em camadas (Domain, Data, Presentation) para código escalável.',
  };

  void _mostrarInfoTag(BuildContext context, String tag) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '$tag: ${_infoTags[tag] ?? ''}',
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
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
          const SizedBox(height: 10),

          // Seletor interativo: Marcelo | & (Dupla) | Caio
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _BotaoNomeDev(
                  nome: 'Marcelo',
                  ativo: selecionadoId == 'marcelo',
                  corDestaque: Colors.cyanAccent,
                  aoClicar: () => onSelecionarDev('marcelo'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => onSelecionarDev('dupla'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: selecionadoId == 'dupla'
                            ? Colors.white.withValues(alpha: 0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '&',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: selecionadoId == 'dupla'
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.65),
                        ),
                      ),
                    ),
                  ),
                ),
                _BotaoNomeDev(
                  nome: 'Caio',
                  ativo: selecionadoId == 'caio',
                  corDestaque: Colors.orangeAccent,
                  aoClicar: () => onSelecionarDev('caio'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Toque em um nome para ver habilidades',
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: _infoTags.keys
                .map(
                  (tag) => _Tag(
                    tag,
                    aoClicar: () => _mostrarInfoTag(context, tag),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BotaoNomeDev extends StatelessWidget {
  final String nome;
  final bool ativo;
  final Color corDestaque;
  final VoidCallback aoClicar;

  const _BotaoNomeDev({
    required this.nome,
    required this.ativo,
    required this.corDestaque,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: aoClicar,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: ativo
                ? Colors.white.withValues(alpha: 0.22)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: ativo ? corDestaque : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nome,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: ativo ? FontWeight.bold : FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.touch_app_rounded,
                size: 14,
                color: ativo ? corDestaque : Colors.white.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String texto;
  final VoidCallback aoClicar;

  const _Tag(this.texto, {required this.aoClicar});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: aoClicar,
      label: Text(
        texto,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black.withValues(alpha: 0.25),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
      shape: const StadiumBorder(),
    );
  }
}

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
  final List<DadoMetrica> metricas;

  const _GradeMetricas({required this.metricas});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = constraints.maxWidth >= 700 ? 4 : 2;
        const espaco = 12.0;
        const alturaCard = 148.0;
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
            for (var i = 0; i < metricas.length; i++)
              _Entrada(
                atrasoMs: i * 120,
                child: BlocoEstatistica(
                  titulo: metricas[i].titulo,
                  valorNumerico: metricas[i].valorNumerico,
                  sufixo: metricas[i].sufixo,
                  icone: metricas[i].icone,
                  corIcone: metricas[i].corIcone,
                  selo: metricas[i].selo,
                  descricao: metricas[i].descricao,
                  progressoMeta: metricas[i].progressoMeta,
                ),
              ),
          ],
        );
      },
    );
  }
}
