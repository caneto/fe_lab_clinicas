
import 'package:mix/mix.dart';

class CustomButtonType extends Variant {
  const CustomButtonType._(super.name);

  static const primary = CustomButtonType._('custom.buttom.primary');
  static const link = CustomButtonType._('custom.buttom.link');
}

class CustomButtonSize extends Variant {
  const CustomButtonSize._(super.name);

  static const medium = CustomButtonSize._('custom.buttom.medium');
  static const large = CustomButtonSize._('custom.buttom.large');
}