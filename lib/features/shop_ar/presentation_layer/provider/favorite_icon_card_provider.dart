import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteColorProvider =
    StateProvider<Color>((ref) => Colors.black.withOpacity(0.5));
