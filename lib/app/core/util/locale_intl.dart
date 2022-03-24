import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

extension LocaleContextExtension on BuildContext {
  S locale() => S.of(this);
}
