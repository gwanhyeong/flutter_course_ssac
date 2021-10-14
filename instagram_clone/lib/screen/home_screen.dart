import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  const HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram Clone',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Instagram에 오신 것을 환영합니다',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('사진과 동영상을 보려면 팔로우하세요.'),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              child: Image.network(user?.photoURL ?? ''),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            user?.email ?? 'Email',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(user?.displayName ?? 'Name'),
                          const SizedBox(height: 16.0),
                          Wrap(
                            spacing: 6.0,
                            direction: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          const Text('Facebook 친구'),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('팔로우')),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
