import 'package:comidas/components/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<Settings> onSettingsChanged;
  final Settings settings;
  const SettingsScreen(
      {required this.settings, required this.onSettingsChanged, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    'Sem Glúten',
                    'Exibir apenas refeições sem glúten',
                    widget.settings.isGlutenFree, (value) {
                  setState(() {
                    widget.settings.isGlutenFree = value;
                  });
                }),
                _createSwitch(
                    'Sem Lactose',
                    'Exibir apenas refeições sem lactose',
                    widget.settings.isLactoseFree, (value) {
                  setState(() {
                    widget.settings.isLactoseFree = value;
                  });
                }),
                _createSwitch(
                    'Vegetariano',
                    'Exibir apenas refeições vegetarianas',
                    widget.settings.isVegetarian, (value) {
                  setState(() {
                    widget.settings.isVegetarian = value;
                  });
                }),
                _createSwitch('Vegano', 'Exibir apenas refeições veganas',
                    widget.settings.isVegan, (value) {
                  setState(() {
                    widget.settings.isVegan = value;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
