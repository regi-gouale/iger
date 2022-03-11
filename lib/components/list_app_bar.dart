import 'package:flutter/material.dart';

class ListAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const ListAppBar({
    Key? key,
    required this.title,
  })  : preferredSize = const Size.fromHeight(60),
        super(key: key);

  @override
  State<ListAppBar> createState() => _ListAppBarState();

  @override
  final Size preferredSize;
  // Size get preferredSize => throw UnimplementedError();
}

class _ListAppBarState extends State<ListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Icon(
            Icons.account_circle_rounded,
            size: 30.0,
          ),
        ),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_rounded,
          ),
        ),
      ],
    );
  }
}
