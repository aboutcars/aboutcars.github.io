import 'package:tuple/tuple.dart';

abstract class Op {
  List<int> process(List<int> bytes);
}

class WriteOp extends Op {
  int position;
  int value;

  WriteOp(this.position, this.value);

  @override
  List<int> process(List<int> bytes) {
    bytes[position] = value;

    return bytes;
  }
}

class WriteRangeOp extends Op {
  Tuple2<int, int> range;
  int value;

  WriteRangeOp(this.range, this.value);

  @override
  List<int> process(List<int> bytes) {
    for (var i = range.item1; i < range.item2; i++) {
      bytes[i] = value;
    }

    return bytes;
  }
}

class CopyOp extends Op {
  Tuple2<int, int> addresses;

  CopyOp(this.addresses);

  @override
  List<int> process(List<int> bytes) {
    bytes[addresses.item1] = bytes[addresses.item2];

    return bytes;
  }
}

class Parser extends Op {
  List<Op> ops;

  Parser(List<dynamic> unparsedOps) {
    this.ops = unparsedOps.map((op) {
      switch(op[0]) {
        case "W":
          return WriteOp(op[1], op[2]);
        case "WI":
          return WriteRangeOp(Tuple2.fromList(op[1]), op[2]);
        default:
          throw "Invalid operation";
      }
    }).toList();
  }

  @override
  List<int> process(List<int> bytes) {
    return ops.fold(bytes, (acc, op) => op.process(acc)).toList();
  }
}
