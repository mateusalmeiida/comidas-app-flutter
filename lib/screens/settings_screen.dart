import 'package:comidas/components/main_drawer.dart';
import 'package:flutter/material.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

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
      onChanged: onChanged,
    );
  }

  var settings = Settings();

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
                    settings.isGlutenFree, (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                  });
                }),
                _createSwitch(
                    'Sem Lactose',
                    'Exibir apenas refeições sem lactose',
                    settings.isLactoseFree, (value) {
                  setState(() {
                    settings.isLactoseFree = value;
                  });
                }),
                _createSwitch(
                    'Vegetariano',
                    'Exibir apenas refeições vegetarianas',
                    settings.isVegetarian, (value) {
                  setState(() {
                    settings.isVegetarian = value;
                  });
                }),
                _createSwitch('Vegano', 'Exibir apenas refeições veganas',
                    settings.isVegan, (value) {
                  setState(() {
                    settings.isVegan = value;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
