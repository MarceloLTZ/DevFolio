import 'package:flutter/material.dart';

class BlocoEstatistica extends StatefulWidget {
  final String titulo;
  final double valorNumerico;
  final String sufixo;
  final IconData icone;
  final Color corIcone;
  final String? selo;
  final String descricao;
  final double progressoMeta;

  const BlocoEstatistica({
    super.key,
    required this.titulo,
    required this.valorNumerico,
    this.sufixo = '',
    required this.icone,
    required this.corIcone,
    required this.descricao,
    this.selo,
    this.progressoMeta = 0.8,
  });

  @override
  State<BlocoEstatistica> createState() => _BlocoEstatisticaState();
}

class _BlocoEstatisticaState extends State<BlocoEstatistica> {
  bool _emFoco = false;

  void _mostrarDescricao(BuildContext context) {
    final valorFormatado = '${widget.valorNumerico.toInt()}${widget.sufixo}';

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        icon: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: widget.corIcone.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icone, size: 36, color: widget.corIcone),
        ),
        title: Text(widget.titulo, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              valorFormatado,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: widget.corIcone,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.descricao,
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.4),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Progresso da meta semestral',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '${(widget.progressoMeta * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: widget.corIcone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: widget.progressoMeta,
                minHeight: 8,
                backgroundColor: widget.corIcone.withValues(alpha: 0.15),
                valueColor: AlwaysStoppedAnimation<Color>(widget.corIcone),
              ),
            ),
          ],
        ),
        actions: [
          FilledButton.tonal(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _emFoco = true),
      onExit: (_) => setState(() => _emFoco = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _emFoco ? -4 : 0, 0),
        child: Card(
          elevation: _emFoco ? 10 : 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: _emFoco
                  ? widget.corIcone.withValues(alpha: 0.5)
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: InkWell(
            onTap: () => _mostrarDescricao(context),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.corIcone.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          widget.icone,
                          size: 24,
                          color: widget.corIcone,
                        ),
                      ),
                      const Spacer(),
                      // Animação de contagem sempre que o valor muda (Dupla <-> Marcelo <-> Caio)
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0,
                          end: widget.valorNumerico,
                        ),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutCubic,
                        builder: (context, valorAnimado, _) {
                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${valorAnimado.toInt()}${widget.sufixo}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.titulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.selo != null)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.corIcone.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.selo!,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: widget.corIcone,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
