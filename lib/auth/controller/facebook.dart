import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<User?> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Check if login was successful
  if (loginResult.status == LoginStatus.success) {
    // Get the user's AccessToken
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Sign-in to Firebase using the Facebook credentials
    final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return userCredential.user;
  }

  // Return null if login failed
  return null;
}
