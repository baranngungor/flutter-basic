import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controllers/user/user_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userController.usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: userController.nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: userController.surnameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Surname"),
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: () async {
                    // BuildContext? dialogContext;
                    // showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (context) {
                    //       dialogContext = context;
                    //       return const MyLoader();
                    //     });
                    // userController.login(LoginModel(
                    //     username: userController.usernameController.text,
                    //     password: userController.nameController.text));
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const NewPage())).then((s) {
                      userController.controllersClear();
                    });
                    // await userController
                    //     .createUserFromJson(usernameController.text,
                    //         nameController.text, surnameController.text)
                    //     .then((value) {
                    //   try {
                    //     Navigator.pop(dialogContext!);
                    //   } catch (e) {}
                    // });
                  },
                  child: const Text('Create')),
              Text(
                  "${userController.activeUser?.name} ${userController.activeUser?.surname}"),
              TextButton(
                  onPressed: () {
                    userController.getLocalUser();
                  },
                  child: const Text('Get Local User')),
              Text(
                  "${userController.localUser?.name} ${userController.localUser?.surname}"),
              TextButton(
                  onPressed: () {
                    userController.removeLocalUser();
                  },
                  child: const Text('Remove Local User')),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Hello from NewPage'),
        ));
  }
}
