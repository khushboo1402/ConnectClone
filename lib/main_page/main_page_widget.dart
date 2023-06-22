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
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord
              .where('gender',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.desiredGender, ''))
              .whereNotIn(
                  'uid',
                  functions.combinedList(
                      (currentUserDocument?.matches?.toList() ?? []).toList(),
                      (currentUserDocument?.rejected?.toList() ?? [])
                          .toList())),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: Color(0xFF0FB8FF),
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> mainPageUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();
          final mainPageUsersRecord = mainPageUsersRecordList.isNotEmpty
              ? mainPageUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF0FB8FF),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MainPage',
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                if (mainPageUsersRecord != null)
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            mainPageUsersRecord!.photoUrl,
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 355.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 0.0, 0.0),
                          child: Text(
                            mainPageUsersRecord!.displayName,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Text(
                                  mainPageUsersRecord!.location,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                ),
                              ),
                              Text(
                                mainPageUsersRecord!.bio,
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 80.0, 0.0),
                                      child: Text(
                                        formatNumber(
                                          mainPageUsersRecord!.age,
                                          formatType: FormatType.custom,
                                          format: '',
                                          locale: '',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 24.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final usersUpdateData = {
                                      'matches': FieldValue.arrayUnion(
                                          [mainPageUsersRecord!.uid]),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    if (mainPageUsersRecord!.matches
                                        .contains(currentUserUid)) {
                                      final chatsCreateData = {
                                        ...createChatsRecordData(
                                          userA: mainPageUsersRecord!.reference,
                                          userB: currentUserReference,
                                          lastMessage: 'It\'s A Match!',
                                        ),
                                        'users': functions.createChatUserList(
                                            mainPageUsersRecord!.reference,
                                            currentUserReference!),
                                        'last_message_time':
                                            FieldValue.serverTimestamp(),
                                      };
                                      await ChatsRecord.collection
                                          .doc()
                                          .set(chatsCreateData);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Congratulations! You\'ve a New Match!',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      await Future.delayed(
                                          const Duration(milliseconds: 3000));
                                    }
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child:
                                            NavBarPage(initialPage: 'mainPage'),
                                      ),
                                    );
                                  },
                                  text: 'Accept',
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).success,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 24.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final usersUpdateData = {
                                      'rejected': FieldValue.arrayUnion(
                                          [mainPageUsersRecord!.uid]),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child:
                                            NavBarPage(initialPage: 'mainPage'),
                                      ),
                                    );
                                  },
                                  text: 'Reject',
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              300.0, 0.0, 0.0, 100.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await authManager.signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthenticateWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            child: Icon(
                              Icons.login_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!(mainPageUsersRecord != null))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      wrapWithModel(
                        model: _model.popup1Model,
                        updateCallback: () => setState(() {}),
                        child: Popup1Widget(),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
