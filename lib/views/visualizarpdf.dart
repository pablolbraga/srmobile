import 'package:flutter/material.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class VisualizarPdf extends StatefulWidget {
  const VisualizarPdf({super.key});

  @override
  State<VisualizarPdf> createState() => _VisualizarPdfState();
}

class _VisualizarPdfState extends State<VisualizarPdf> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  //String? titulo = VariaveisGlobais.pathPdf;
  String? titulo = "Visualização da Ficha";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text(titulo!),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  semanticLabel: 'Bookmark',
                ),
                onPressed: () {
                  _pdfViewerKey.currentState?.openBookmarkView();
                },
              ),
            ],
          ),
          body: SfPdfViewer.network(
            VariaveisGlobais.pathPdf!,
            key: _pdfViewerKey,
          )),
    );
  }

  Future<bool> _onBackPressed() async {
    if (VariaveisGlobais.tipoRedirecionamento == 1) {
      Navigator.pushNamed(context, "pacienteopcao");
    } else {
      Navigator.pushNamed(context, "visitasrealizadas");
    }
    return true;
  }
}
