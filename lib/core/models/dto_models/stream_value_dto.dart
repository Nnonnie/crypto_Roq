import 'package:roqqu_test/core/models/models.dart';

class StreamValueDTO {
  StreamValueDTO({
    required this.symbol,
    required this.interval,
  });
  late SymbolResponseModel symbol;
  late String? interval;
}
