# Dainamicauth: Integrating Facebook Login with Firebase in Flutter

This guide outlines the steps to integrate Facebook login functionality into your Flutter application using Firebase. Follow these steps carefully to ensure a smooth setup.

## Getting Started

1. **Create a Firebase App:** Begin by creating a new app in Firebase to get started.
2. **Enable Facebook Authentication:**
    - In your Firebase app, navigate to the Authentication section.
    - Activate the Facebook login method by toggling the Facebook option. You'll be prompted to enter the App ID and Secret Key.
3. **Set Up Facebook App:**
    - Log in to the Meta Developer platform using a Facebook admin account.
    - Create a new app and name it appropriately in the General Settings.
    - Copy the App ID and Secret Key provided.
4. **Configure Firebase with Facebook Details:**
    - Enter the copied App ID and Secret Key into the corresponding fields in Firebase and save your changes.
5. **Firebase CLI Tools:**
    - Install Firebase CLI globally with `npm install -g firebase-tools`.
    - Activate FlutterFire CLI with `dart pub global activate flutterfire_cli`.
6. **Integrate Firebase in Flutter:**
    - Navigate back to the Firebase dashboard, select "Integrate Firebase using Flutter," and execute the provided command in the root of your Flutter project (e.g., `flutterfire configure --project=PROJECT_NAME-ID`). This step incorporates necessary Firebase files into your project.

## Android Configuration

1. **Create `strings.xml`:** In your Flutter project, under `android/app/src/main/res/values`, create a `strings.xml` file.
2. **Add Required Fields:**
    - App name and App ID from the Meta Developer dashboard.
    - Facebook login protocol scheme (prepend "fb" to your App ID).
    - Facebook client token found in the Meta Developer's advanced settings.
3. **Update `pubspec.yaml`:** Add Firebase and Facebook authentication dependencies.
    ```yaml
    firebase_core: ^2.25.4
    firebase_auth: ^4.17.5
    flutter_facebook_auth: ^6.1.0
    ```
    Note: Check for the latest versions as needed.
4. **Modify `android/app/build.gradle`:** Add the Facebook Login dependency inside the dependencies block.
    ```gradle
    implementation 'com.facebook.android:facebook-login:latest.release'
    ```

## XML Configuration in `AndroidManifest.xml`

Include the following code snippets:

- Namespace declaration:
    ```xml
    xmlns:tools="http://schemas.android.com/tools"
    ```
- Permissions and Facebook activity configurations:
    ```xml
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/> 
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="com.google.android.gms.permission.AD_ID" tools:node="remove"/>

    <activity android:name="com.facebook.FacebookActivity"
              android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
              android:label="@string/app_name" />
    <activity android:name="com.facebook.CustomTabActivity"
              android:exported="true">
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="@string/fb_login_protocol_scheme" />
        </intent-filter>
    </activity>

    <meta-data android:name="com.facebook.sdk.ApplicationId"
               android:value="@string/facebook_app_id"/>
    <meta-data android:name="com.facebook.sdk.ClientToken"
               android:value="@string/facebook_client_token"/>
    ```

## Final Steps

1. **Configure Facebook Login for Android:**
    - Visit [Facebook's Android Login Documentation](https://developers.facebook.com/docs/facebook-login/android/) and complete the required fields, including package name, Activity class name (typically `package_name.MainActivity`), and Hash key (instructions for generating this are provided on the website, if you already have a signing key(.jks) you can extract the hash key from it, else create one).
2. **Complete Integration:**
    - With the configuration complete, proceed to implement the Facebook login functionality in your code. Sample code and further instructions are available in this project's repository.
3. **Publish the facebook app to get it out of development mode:**
    - In order for the facebook-app link to function, the app needs to be published, you can achieve that in the meta
    developer app dashboard.


Congratulations! You've successfully integrated Facebook login with Firebase in your Flutter app. For additional guidance, refer to the official documentation and resources provided by Firebase and Facebook.
