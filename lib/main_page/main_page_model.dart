import '/auth/firebase_auth/auth_util.dart';
import '/authenticate/authenticate_widget.dart';
import '/backend/backend.dart';
import '/components/popup1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for popup1 component.
  late Popup1Model popup1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    popup1Model = createModel(context, () => Popup1Model());
  }

  void dispose() {
    popup1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
