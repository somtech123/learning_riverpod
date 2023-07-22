import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/usermodel.dart';

import 'data_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('riverpod tutorial'),
      ),
      body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(
                              userList[index].firstname,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(userList[index].lastname,
                                style: const TextStyle(color: Colors.white)),
                            trailing: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userList[index].avatar),
                            ),
                          ),
                        );
                      },
                      itemCount: userList.length,
                    ),
                  ),
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
