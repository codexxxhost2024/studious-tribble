import '/auth/firebase_auth/auth_util.dart';
import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'setting_screen_model.dart';
export 'setting_screen_model.dart';

class SettingScreenWidget extends StatefulWidget {
  const SettingScreenWidget({super.key});

  @override
  State<SettingScreenWidget> createState() => _SettingScreenWidgetState();
}

class _SettingScreenWidgetState extends State<SettingScreenWidget> {
  late SettingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            if (Theme.of(context).brightness == Brightness.dark)
              wrapWithModel(
                model: _model.pageBgModel,
                updateCallback: () => safeSetState(() {}),
                child: const PageBgWidget(),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/chatgpt_robot.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Settings',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(valueOrDefault<double>(
                      functions.getVerticalSize(
                          MediaQuery.sizeOf(context).height, 16.0),
                      0.0,
                    )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 10.0),
                                0.0,
                              )),
                          child: Text(
                            'Account',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ProfileScreen');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<String>(
                                            currentUserDisplayName,
                                            'User',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        currentUserEmail,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Icon(
                                      Icons.edit,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 26.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Alert'),
                                  content: const Text(
                                      'Please close the project and enable actions.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Clear History?'),
                                      content: const Text(
                                          'Are you sure want to clear history?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Clear'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.deleteHistory(
                                currentUserUid,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'History has been deleted!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(
                                'Clear History',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: Colors.transparent,
                              dense: true,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('LoginScreen', context.mounted);
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(
                                'Logout',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: Colors.transparent,
                              dense: true,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        if (false)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      functions.getVerticalSize(
                                          MediaQuery.sizeOf(context).height,
                                          16.0),
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      functions.getVerticalSize(
                                          MediaQuery.sizeOf(context).height,
                                          10.0),
                                      0.0,
                                    )),
                                child: Text(
                                  'Help Center',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  title: Text(
                                    'Get started',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  tileColor: Colors.transparent,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  title: Text(
                                    'Help & FAQ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  tileColor: Colors.transparent,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 16.0),
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 10.0),
                                0.0,
                              )),
                          child: Text(
                            'About',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'Privacy Policy',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: Colors.transparent,
                            dense: true,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'Terms of service',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: Colors.transparent,
                            dense: true,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
