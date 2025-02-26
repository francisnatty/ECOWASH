import 'package:ecowash/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A utility class to provide reusable and customizable text fields.
class TextFields {
  /// Normal text field
  static Widget normalTextField({
    required String hintText,
    required TextEditingController controller,
    Color? fillColor,
    bool? fill = false,
    int? maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool obscureText = false,
    bool format = false,
    TextStyle? style,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
      style: style ?? const TextStyle(fontFamily: 'Poppins'),
      keyboardType: keyboardType,
      // inputFormatters: format ? [PriceFormatter()] : null,
      decoration: _inputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: fill,
      ),
    );
  }

  /// Text field with a prefix icon
  static Widget iconTextField({
    required String hintText,
    required TextEditingController controller,
    required String iconPath,
    Color? fillColor,
    bool? fill = false,
    Color? iconColor,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
    FocusNode? focusNode,
    bool readOnly = false,
    TextStyle? style,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: style ?? const TextStyle(fontFamily: 'Poppins'),
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: _inputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: fill,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            iconPath,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }

  static Widget passwordTextField({
    required String hintText,
    required TextEditingController controller,
    required String iconPath,
    required String suffixIcon,
    Color? fillColor,
    bool? fill = false,
    Color? iconColor,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
    FocusNode? focusNode,
    bool readOnly = false,
    TextStyle? style,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: style ?? const TextStyle(fontFamily: 'Poppins'),
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: _inputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: fill,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            suffixIcon,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                : null,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            iconPath,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }

  /// Dropdown field
  // static Widget dropDownField({
  //   required List<String> items,
  //   required String label,
  //   required String? value,
  //   required ValueChanged<String?> onChanged,
  //   Color? fillColor,
  //   bool? filled = true,
  // }) {
  //   return DropdownButtonFormField<String>(
  //     value: value,
  //     style: appStyles.textBodyTextReuglar12px.copyWith(color: onSurface),
  //     hint: Text(label),
  //     decoration: _inputDecoration(
  //       hintText: label,
  //       fillColor: fillColor,
  //       filled: filled,
  //     ),
  //     icon: const Icon(Icons.keyboard_arrow_down),
  //     items: items.map((String item) {
  //       return DropdownMenuItem<String>(
  //         value: item,
  //         child: Text(
  //           item,
  //           overflow: TextOverflow.ellipsis,
  //           softWrap: false,
  //         ),
  //       );
  //     }).toList(),
  //     onChanged: onChanged,
  //   );
  // }

  /// Common input decoration
  static InputDecoration _inputDecoration({
    required String hintText,
    Color? fillColor,
    bool? filled = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: AppColors.outlineVariant,
          width: 1,
        ),
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.onSurfaceVariant,
        fontFamily: 'Lato',
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: AppColors.outlineVariant,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      fillColor: fillColor ?? Colors.transparent,
      filled: filled,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      hintText: hintText,
      suffixIcon: suffixIcon,
    );
  }
}
