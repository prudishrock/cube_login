import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller;

  // TextFormField specific parameters
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLines;
  final String? initialValue;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.controller,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofillHints,
  }) : assert(
          controller == null || initialValue == null,
          'Cannot provide both controller and initialValue',
        );

  @override
  Widget build(BuildContext context) {
    // If obscureText is true, maxLines must be 1
    final effectiveMaxLines = obscureText ? 1 : (maxLines ?? 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          autovalidateMode: autovalidateMode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: effectiveMaxLines,
          focusNode: focusNode,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          autofillHints: autofillHints,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: AppColors.grey500),
            prefixIcon: Icon(prefixIcon, color: AppColors.white),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: AppColors.white),
                    onPressed: onSuffixTap,
                  )
                : null,
            filled: true,
            fillColor: AppColors.darkBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
