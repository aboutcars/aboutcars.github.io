import 'dart:async';
import 'dart:html';
import 'dart:js' as js;

import 'package:airbagcleaner/modules/parser/parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

enum DragState { over, enter, leave }

class DropZoneWidget extends StatefulWidget {
  final Parser parser;

  DropZoneWidget(this.parser);

  @override
  State<StatefulWidget> createState() {
    return _DropZoneWidgetState(parser);
  }
}

class _DropZoneWidgetState extends State<StatefulWidget> {
  Parser parser;

  _DropZoneWidgetState(this.parser);

  StreamSubscription<MouseEvent> onDragOverSubscription;
  StreamSubscription<MouseEvent> onDragEnterSubscription;
  StreamSubscription<MouseEvent> onDragLeaveSubscription;
  StreamSubscription<MouseEvent> onDropSubscription;

  final StreamController<Point<double>> pointStreamController =
      new StreamController<Point<double>>.broadcast();
  final StreamController<DragState> dragStateStreamController =
      new StreamController<DragState>.broadcast();

  @override
  void dispose() {
    this.onDropSubscription.cancel();
    this.onDragOverSubscription.cancel();
    this.onDragEnterSubscription.cancel();
    this.onDragLeaveSubscription.cancel();
    this.pointStreamController.close();
    this.dragStateStreamController.close();
    super.dispose();
  }

  List<File> files = <File>[];

  void onDrop(MouseEvent value) {
    value.stopPropagation();
    value.preventDefault();
    pointStreamController.sink.add(null);

    this.setState(() {
      this.files = [];
      this.files = this.files..addAll(value.dataTransfer.files);

      final file = this.files.first;

      final reader = FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoad.first.then((_) {
        List<int> bytes = reader.result;

        bytes = parser.process(bytes);

        js.context.callMethod("saveAs", [
          Blob([reader.result]),
          "${file.name}_clear.bin"
        ]);
      });
    });
  }

  void onDragOver(MouseEvent value) {
    value.stopPropagation();
    value.preventDefault();
    this
        .pointStreamController
        .sink
        .add(Point<double>(value.layer.x.toDouble(), value.layer.y.toDouble()));
    this.dragStateStreamController.sink.add(DragState.over);
  }

  void onDragLeave(MouseEvent value) {
    this.dragStateStreamController.sink.add(DragState.leave);
  }

  void onDragEnter(MouseEvent value) {
    this.dragStateStreamController.sink.add(DragState.enter);
  }

  @override
  void initState() {
    super.initState();
    this.onDropSubscription = document.body.onDrop.listen(onDrop);
    this.onDragOverSubscription = document.body.onDragOver.listen(onDragOver);
    this.onDragLeaveSubscription =
        document.body.onDragLeave.listen(onDragLeave);
    this.onDragEnterSubscription =
        document.body.onDragEnter.listen(onDragEnter);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: DragState.leave,
        stream: dragStateStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<DragState> snapshot) {
          return InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {
              FilePicker.platform
                  .pickFiles(allowMultiple: true)
                  .then((FilePickerResult result) {
                if (result != null) {
                  this.setState(() {
                    this.files = result.files
                        .map((file) => File(file.bytes, file.name))
                        .toList();
                  });
                }
              });
            },
            child: Container(
              child: Center(
                child: Text(this.files.isEmpty
                    ? "Drag or click to select some file"
                    : this.files.map((e) => e.name).toList().join(', ')),
              ),
              height: 200,
              decoration: BoxDecoration(
                  color: snapshot.data == DragState.over
                      ? Colors.black.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  border:
                      Border.all(color: Color.fromRGBO(125, 125, 125, 0.7))),
            ),
          );
        });
  }
}
