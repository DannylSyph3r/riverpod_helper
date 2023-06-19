import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mastery/provider_logger.dart';
import 'package:riverpod_mastery/riverpod_home_screen.dart';
import 'package:riverpod_mastery/user.dart';


//Riverpod providers
//1. Providers
//2. StateProvider - Used to update simple values from inputs not posible with provider
//3. StateNotifier/StateNotifierProvider
//4. ChangeNotifierProvider - This provider is mutable that means the user object values can be changed outside tbe class
//5. FutureProvider - (async code) Firebase calls
//6. StreamProvider 


//final nameprovider = Provider<String>((ref) => "Daniel Akinola");
//final changeNameProvider = StateProvider<String?>((ref) => null);
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//     (ref) => UserNotifier());

final fetchUserProvider = FutureProvider.family.autoDispose((ref, String input) {
  final userRespository = ref.watch(userRespositoryProvider);
  return userRespository.fetchUserData(input);
});

final streamProvider = StreamProvider((ref) async* {
  yield (1,2,3,4,5,6,7,8,9,10);
});

void main() {
  runApp( ProviderScope(
    observers: [
      LoggerRiverpod(),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Mastery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
