import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelectCheckboxList extends StatefulWidget {
  final List<String> options;
  final Function(List<String>) onChange;

  const MultiSelectCheckboxList(
      {super.key, required this.options, required this.onChange});

  @override
  State<MultiSelectCheckboxList> createState() =>
      _MultiSelectCheckboxListState();
}

class _MultiSelectCheckboxListState extends State<MultiSelectCheckboxList> {
  final List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: Column(
        children: [

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(widget.options[index]),
                  value: selectedOptions.contains(widget.options[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedOptions.add(widget.options[index]);
                      } else {
                        selectedOptions.remove(widget.options[index]);
                      }
                      widget.onChange(selectedOptions);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
