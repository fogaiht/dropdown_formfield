library dropdown_formfield;

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final TextStyle itemsTextStyle;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final Function onTap;
  final bool filled;
  final bool isDense;
  final EdgeInsets contentPadding;
  final Color hintColorText;
  final Color dropdownColor;
  final Color iconDisabledColor;
  final Color iconEnabledColor;

  DropDownFormField({
    FormFieldSetter<dynamic> onSaved,
    FormFieldValidator<dynamic> validator,
    bool autovalidate = false,
    this.titleText = 'Title',
    this.hintText = 'Select one option',
    this.hintColorText,
    this.dropdownColor,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.itemsTextStyle,
    this.required = false,
    this.errorText = 'Please select one option',
    this.value,
    this.dataSource,
    this.textField,
    this.valueField,
    this.onChanged,
    this.onTap,
    this.filled = true,
    this.isDense = false,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0),
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      labelText: titleText,
                      filled: filled,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        dropdownColor: dropdownColor,
                        iconDisabledColor: iconDisabledColor,
                        iconEnabledColor: iconEnabledColor,
                        isDense: isDense,
                        onTap: onTap,
                        isExpanded: true,
                        hint: Text(
                          hintText,
                          style: TextStyle(color: hintColorText ?? Colors.grey.shade500),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(
                              item[textField],
                              overflow: TextOverflow.ellipsis,
                              style: itemsTextStyle,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(color: Colors.redAccent.shade700, fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
