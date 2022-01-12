import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  final Map<String, bool> filters;
  final Function filterHandler;

  FiltersPage({required this.filters, required this.filterHandler});

  static const routeName = '/filters';

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var gluttenFree = false;
  var lactoseFree = false;
  var vegan = false;
  var vegetarian = false;

  @override
  void initState() {
    super.initState();
    gluttenFree = widget.filters['glutten']!;
    lactoseFree = widget.filters['lactose']!;
    vegan = widget.filters['vegan']!;
    vegetarian = widget.filters['vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Filters'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                var appliedFilters = {
                  'glutten': gluttenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                //print(appliedFilters);
                widget.filterHandler(appliedFilters);
              });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Adjust your meal selection here',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Glutten-Free'),
                  subtitle: const Text('Only show Glutten free meals'),
                  value: gluttenFree,
                  onChanged: (newValue) {
                    setState(() {
                      gluttenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-Free'),
                  subtitle: const Text('Only show Lactose free meals'),
                  value: lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text('Only show Vegan meals'),
                  value: vegan,
                  onChanged: (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only show Vegetarian meals'),
                  value: vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
