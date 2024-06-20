import 'package:reminder/features/home/presentation/bloc/home_bloc.dart';

import '../../../ui_export.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..getListReminder(),
      child: BlocBuilder<HomeBloc, HomeEvent>(
        builder: (ctx, state) {
          return MyScaffold(
            showLeading: false,
            fab: FloatingActionButton(
              onPressed: () async {
                await showMyDialog(context,
                    child: const FormScreen()
                ).whenComplete(() => doRefresh(ctx));
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add_rounded),
            ),
            body: RefreshIndicator(
              onRefresh: () async => doRefresh(ctx),
              child: Builder(
                builder: (context) {
                  if (state.data.isEmpty) {
                    return const Center(
                      child: MyText('Please Create New Reminder'),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: state.data.length,
                    separatorBuilder: (ctx, i) => const Divider(
                      height: 6,
                    ),
                    itemBuilder: (ctx, i) {
                      final item = state.data[i];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        padding: const EdgeInsets.all(12),
                        child: MyText(item.reminderTime,
                          fontSize: 14,
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          );
        },
      ),
    );
  }

  void doRefresh(BuildContext context) {
    context.read<HomeBloc>().getListReminder();
  }
}
