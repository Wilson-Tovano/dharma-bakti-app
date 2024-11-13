import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;

  const SearchBarCustom({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_updateClearButtonVisibility);
  }

  void _updateClearButtonVisibility() {
    setState(() {
      _showClearButton = widget.searchController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_updateClearButtonVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.thirdColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: widget.searchController,
            onChanged: widget.onSearchChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Search...",
              border: InputBorder.none,
              icon: const Icon(Icons.search, color: AppColors.labelTextColor),
              suffixIcon: _showClearButton
                  ? IconButton(
                      icon: const Icon(Icons.clear,
                          color: AppColors.labelTextColor),
                      onPressed: () {
                        widget.searchController.clear();
                        widget.onSearchChanged(
                            ''); // Trigger search update on clear
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
