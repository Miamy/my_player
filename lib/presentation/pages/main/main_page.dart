import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/main_page_bloc/main_page_bloc.dart';
import '../../widgets/button_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'group placeholder',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'year placeholder',
                ),
                const Text(
                  'album placeholder',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '# placeholder',
                ),
                const Text(
                  'song placeholder',
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
            ),
            //SizedBox.expand(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  icon: const Icon(
                    Icons.first_page,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(PrevEvent()),
                ),
                ButtonWidget(
                  icon: const Icon(
                    Icons.navigate_before,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(PrevEvent()),
                ),
                ButtonWidget(
                  icon: const Icon(
                    Icons.navigate_next,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(NextEvent()),
                ),
                ButtonWidget(
                  icon: const Icon(
                    Icons.last_page,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(PrevEvent()),
                ),
                ButtonWidget(
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(PrevEvent()),
                ),
                ButtonWidget(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(PrevEvent()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
