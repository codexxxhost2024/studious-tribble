import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'chat_screen_model.dart';
export 'chat_screen_model.dart';

class ChatScreenWidget extends StatefulWidget {
  const ChatScreenWidget({super.key});

  @override
  State<ChatScreenWidget> createState() => _ChatScreenWidgetState();
}

class _ChatScreenWidgetState extends State<ChatScreenWidget> {
  late ChatScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatScreenModel());
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
            Align(
              alignment: const AlignmentDirectional(1.0, -0.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Screenshot_from_2024-11-16_07-04-59-removebg-preview.png',
                  height: 332.0,
                  fit: BoxFit.contain,
                  alignment: const Alignment(1.0, 0.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Screenshot_from_2024-11-16_07-04-59-removebg-preview.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            'aiConnect',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 4),
                          const Spacer(flex: 3),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final question =
                                            FFAppConstants.questions.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              question.length, (questionIndex) {
                                            final questionItem =
                                                question[questionIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ThreadScreen',
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionItem,
                                                      ParamType.String,
                                                    ),
                                                    'collectionId':
                                                        serializeParam(
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    functions.getVerticalSize(
                                                        MediaQuery.sizeOf(
                                                                context)
                                                            .height,
                                                        7.0),
                                                    0.0,
                                                  )),
                                                  child: Text(
                                                    questionItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final question =
                                            FFAppConstants.questions2.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              question.length, (questionIndex) {
                                            final questionItem =
                                                question[questionIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ThreadScreen',
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionItem,
                                                      ParamType.String,
                                                    ),
                                                    'collectionId':
                                                        serializeParam(
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    questionItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final question =
                                            FFAppConstants.questions3.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              question.length, (questionIndex) {
                                            final questionItem =
                                                question[questionIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ThreadScreen',
                                                  queryParameters: {
                                                    'question': serializeParam(
                                                      questionItem,
                                                      ParamType.String,
                                                    ),
                                                    'collectionId':
                                                        serializeParam(
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    questionItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'ThreadScreen',
                          queryParameters: {
                            'collectionId': serializeParam(
                              getCurrentTimestamp.millisecondsSinceEpoch,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                functions.getHorizontalSize(
                                    MediaQuery.sizeOf(context).width, 22.0),
                                0.0,
                              ),
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 14.0),
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                functions.getVerticalSize(
                                    MediaQuery.sizeOf(context).height, 14.0),
                                0.0,
                              )),
                          child: Text(
                            'Ask anything...',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
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