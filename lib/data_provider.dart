import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/api_services.dart';
import 'package:learning_riverpod/usermodel.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUser();
});
