import 'package:flutter/material.dart';
import 'package:mvvm_practice/data/response/status.response.data.dart';
import 'package:mvvm_practice/view_model/home/home_view_model.home.view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchUsersListData();
  }

  @override
  Widget build(BuildContext context) {
    // final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.userResponse.apiStatus!) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ApiStatus.error:
                return Text(
                  value.userResponse.message.toString(),
                );

              case ApiStatus.success:
                return ListView.builder(
                  itemCount: value.userResponse.data!.data!.length,
                  itemBuilder: (context, index) {
                    final userData = value.userResponse.data!.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            userData.avatar.toString(),
                          ),
                        ),
                        title: Text(userData.firstName.toString()),
                        subtitle: Text(userData.lastName.toString()),
                        trailing: Text(userData.email.toString()),
                      ),
                    );
                  },
                );
            }

            // return Container();
          },
        ),
      ),
    );
  }
}

// Center(
// child: InkWell(
// onTap: () => userViewModel.logoutUser().then(
// (value) => Navigator.pushNamedAndRemoveUntil(
// context, RoutesName.login, (route) => false),
// ),
// child: Text(
// "LogOut",
// style: Theme.of(context).textTheme.headline6,
// ),
// ),
// ),
