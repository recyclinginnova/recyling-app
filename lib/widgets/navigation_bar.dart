import 'package:flutter/material.dart';

class NavBar extends StatefulWidget{
  final Function(int) onNav;
  const NavBar({Key? key, required this.onNav}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavBar();
}

class _NavBar extends State<NavBar>{
  int destinationIndex = 0;

  void onDestinationSelected(int index){
    setState(() => destinationIndex = index);
    widget.onNav(index);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
        data: NavigationBarThemeData(
          // changed font size to be more readable
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
          ),
        ),
        child: NavigationBar(
            height: 64,
            selectedIndex: destinationIndex,
            onDestinationSelected: (index) => onDestinationSelected(index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.document_scanner_outlined),
                  // NOTE: better icon needs to be found for barcode scanner (fix later not important now)
                  label: 'Barcode Scanner'),
              NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Materials'),
              NavigationDestination(
                  icon: Icon(Icons.location_on),
                  label: 'Map'),
            ])
    );
  }

}