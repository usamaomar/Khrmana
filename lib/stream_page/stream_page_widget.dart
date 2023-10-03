import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stream_page_model.dart';
export 'stream_page_model.dart';

class StreamPageWidget extends StatefulWidget {
  const StreamPageWidget({Key? key}) : super(key: key);

  @override
  _StreamPageWidgetState createState() => _StreamPageWidgetState();
}

class _StreamPageWidgetState extends State<StreamPageWidget> {
  late StreamPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ZegoUIKitPrebuiltLiveStreaming(
                appID: 2073713405,
                appSign:
                    '1fead54d1af0497cd9bb0e104a860e5e0361468d9f21b47b066028807ccd2edc' /*input your AppSign*/,
                userID: "uok",
                userName: "usama",
                liveID: '123',
                config: ZegoUIKitPrebuiltLiveStreamingConfig.host(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
