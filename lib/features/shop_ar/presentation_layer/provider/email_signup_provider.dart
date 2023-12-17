import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');
final formFilledProvider = StateProvider<bool>((ref) => false);
