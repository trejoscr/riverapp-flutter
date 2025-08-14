import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    final pokemonId = ref.watch(pokemonIdProvider);

    //final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (name) => Text(name, style: titleStyle),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: '2',
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            },
          ),
        ],
      ),
    );
  }
}