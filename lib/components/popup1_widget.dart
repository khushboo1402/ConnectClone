import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup1_model.dart';
export 'popup1_model.dart';

class Popup1Widget extends StatefulWidget {
  const Popup1Widget({Key? key}) : super(key: key);

  @override
  _Popup1WidgetState createState() => _Popup1WidgetState();
}

class _Popup1WidgetState extends State<Popup1Widget> {
  late Popup1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Popup1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'Out of Options \n\n\n\n\n',
      icon: FaIcon(
        FontAwesomeIcons.solidSadTear,
      ),
      options: FFButtonOptions(
        width: 150.0,
        height: 50.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).error,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Lexend Deca',
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
        elevation: 2.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
    );
  }
}
