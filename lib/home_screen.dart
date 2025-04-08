import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_app/provider/favourite_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourList = ref.watch(favouriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref
                  .read(favouriteProvider.notifier)
                  .filterByFavourite(value); // ✅ corrected
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: 'All', child: Text('All')),
                PopupMenuItem(value: 'Favourite', child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search Here ...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref
                    .read(favouriteProvider.notifier)
                    .filterBySearch(value); // ✅ corrected
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favourList.filteredItem.length,
              itemBuilder: (context, index) {
                final item = favourList.filteredItem[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(
                    item.favourite ? Icons.favorite : Icons.favorite_border,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
