import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_e_commerse_app_with_api/user_details/get_user_data.dart';
import 'package:flutter_application_e_commerse_app_with_api/user_details/google_sign_in.dart';
import 'package:flutter_application_e_commerse_app_with_api/view/user_profile.dart';
import 'package:provider/provider.dart';

import '../controller/api_call.dart';
import '../controller/userdpprovider.dart';
import '../user_details/passwordSignin.dart';
import 'notification_page.dart';

class DrawerScreen extends StatelessWidget {
  final String fullName;
  final String email;
  final String profilePIC;

  const DrawerScreen(this.fullName, this.email, this.profilePIC, {super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final passwordUser = Provider.of<PasswordSigninProvider>(context);

    final authenticationProvider = Provider.of<GoogleSignInProvider>(context);
    final getuser = Provider.of<UserDataProvider>(context);

    final User? user = FirebaseAuth.instance.currentUser;
    final String uid = user!.uid;

    return Drawer(
      backgroundColor: Colors.black38,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img4.goodfon.com/wallpaper/nbig/f/c6/material-design-hd-wallpaper-linii-background-color.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              fullName,
              style: const TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              email,
              style: const TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(profilePIC),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(userId: uid)));
              }),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to settings page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.white,
            ),
            title: const Text(
              'Help',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to help page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => authenticationProvider
                .logout()
                .then((value) => getuser.clearFormFields())
                .then((value) => passwordUser.clearFormFields())
                .then((value) => dataProvider.navigateToLoginPage(context)),
          ),
        ],
      ),
    );
  }
}
