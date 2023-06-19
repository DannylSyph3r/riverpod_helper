import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mastery/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  // void onSubmit(String value, WidgetRef ref) {
  //   //State Controllers or updating values of a provider via State Provider
  //   //ref.read(changeNameProvider.notifier).update((state) => value);

  //   //StateNotifier Provider submit function
  //   //ref.read(userProvider.notifier).updateName(value);
  // }

  // void onSubmitAge(String value, WidgetRef ref) {
  //   //ref.read(userProvider.notifier).updateAge(int.parse(value));
  // }

//Use consumer widget so widet tree can be divided and state changes is only applied to the necessry widget
  String userNo = "1";

  @override
  Widget build(BuildContext context) {
    //final user = ref.watch(userProvider);
    //final name = ref.watch(changeNameProvider) ?? ""; //ref.watch watches for changes
    //final nameRead  = ref.read(nameprovider); //ref.read reads only once
    return ref.watch(fetchUserProvider(userNo)).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: Column(children: [
            TextField(
              onSubmitted: (value) => setState(() {
                userNo = value;
              }),
            ),
            Center(child: Text(data.name))
          ]),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // return Scaffold(
    //   body: ref.watch(streamProvider).when(data: (data) {
    //   return Text(data.toString());
    // }, error: ((error, stackTrace) {
    //    return Center(
    //       child: Text(error.toString()),
    //     );
    // }), loading: () {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }),
    // );
  }
}
