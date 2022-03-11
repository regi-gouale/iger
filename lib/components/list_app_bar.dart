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
}

class _ListAppBarState extends State<ListAppBar> {
  late bool search = false;

  Widget _searchTextField(String title) {
    return const TextField(
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "Rechercher",
        hintStyle: TextStyle(
          color: Colors.white60
        ),
      ),
    );
  }

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
      title: !search
          ? Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          : _searchTextField(widget.title),
      actions: !search
          ? [
              IconButton(
                onPressed: () {
                  setState(() {
                    search = true;
                  });
                },
                icon: const Icon(
                  Icons.search_rounded,
                ),
              ),
            ]
          : [
              IconButton(
                onPressed: () {
                  setState(() {
                    search = false;
                  });
                },
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ],
    );
  }
}
