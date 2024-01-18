import 'dart:async';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'surface_creation_event.dart';
part 'surface_creation_state.dart';

class MasterSurfaceCreationBloc extends Bloc<SurfaceCreationEvent, SurfaceCreationState> {
  MasterSurfaceCreationBloc() : super(SurfaceCreationInitial()) {
    initialSetup(); // breakpoint here
    print("before first breakpoint");

    print("first breakpoint - on ");
    print(
        "second breakpoint - off to start with and then when at first break point turn on. If it doesn't freeze the app when its turned on then at breakpt 3 switch it off, and sometimes it just works in both cases");
    print("third breakpoint - on");
  }

  void initialSetup() async {
    await setupSurfaceIsolate();
  }

  static Future<void> setupSurfaceIsolate() async {
    ReceivePort myReceivePort = ReceivePort();

    // Spawn an isolate, passing my receivePort sendPort
    Isolate.spawn<SendPort>(calculateUsingIsolate, myReceivePort.sendPort);
    // get the isolate send port, this is used to establish the connection, so that I can get the sendPort
    Future<dynamic> futurePort = myReceivePort.first;
    futurePort.then((value) {
      print("do something");
    });
  }
}

void calculateUsingIsolate(SendPort mySendPort) async {
  ReceivePort isolate1ReceivePort = ReceivePort();
  mySendPort.send(isolate1ReceivePort.sendPort);
  if (kDebugMode) {
    print("calculateUsingIsolate function is called");
  }
}
