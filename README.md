# Connect - Dating App

Connect is a dating app clone built using Flutterflow, a no-code platform for developing Flutter applications. It mimics the functionality and design of the popular dating app Tinder, allowing users to connect and match with potential partners based on their preferences.

## Features

- **User Registration and Authentication**: Users can create new accounts and log in to the app using their email address or social media accounts like Facebook or Google.

- **User Profiles**: Each user has a profile that displays their name, age, location, and a brief bio. Users can upload profile pictures and update their information.

- **Swiping and Matching**: The app enables users to swipe through potential matches by swiping left (dislike) or right (like) on user profiles. If two users both swipe right on each other, a match is created, allowing them to connect and chat.

- **Matching Algorithm**: Connect implements a matching algorithm that suggests potential matches based on user preferences such as age, gender, and location. The algorithm takes into account the swipes and matches of users to provide personalized recommendations.

- **Chatting**: Once a match is made, users can initiate a conversation in a chat interface. They can exchange text messages, emojis, and images within the app.

- **Notifications**: Connect sends notifications to users when they receive new matches, messages, or other important updates. This feature keeps users engaged and informed about their interactions.

- **Settings**: The app includes settings where users can configure their preferences, such as distance range, gender preferences, and notification settings.

## Tech Stack

Connect is built using the following technologies and frameworks:

- **Flutterflow**: A no-code platform for building Flutter applications.
- **Flutter**: An open-source UI toolkit for building natively compiled applications across mobile, web, and desktop from a single codebase.
- **Dart**: The programming language used by Flutter and Flutterflow.

## Getting Started

To run Connect locally on your machine, follow these steps:

1. **Clone the repository**:

   ```
   https://github.com/araczzz/Connect.git
   ```

2. **Install Flutter and Dart**:

   Make sure you have Flutter and Dart installed on your machine. Follow the official Flutter installation guide for your operating system: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

3. **Set up Firebase**:

   Connect uses Firebase for user authentication and real-time messaging. Set up a new Firebase project and obtain the necessary configuration files (e.g., `google-services.json` for Android or `GoogleService-Info.plist` for iOS).

4. **Configure Firebase**:

   Update the Firebase configuration files in your Flutter project according to the Firebase setup instructions. Make sure to enable Firebase Authentication and Firebase Realtime Database in your Firebase project.

5. **Set up Flutterflow**:

   Install Flutterflow CLI by following the instructions on the [Flutterflow CLI GitHub page](https://github.com/flutterflow/flutterflow).

6. **Open the project in Flutterflow**:

   Navigate to the project directory and run the following command to open the project in Flutterflow:

   ```
   flutterflow open
   ```

   This will launch the Flutterflow editor.

7. **Configure project dependencies**:

   In the Flutterflow editor, navigate to the **Dependencies** section and make sure all the necessary dependencies are added to the project. This includes Firebase-related dependencies.

8. **Run the app**:

   In the Flutterflow editor, click the **Play** button or use the following command to start the app:

   ```
   flutter run
   ```

   The Connect app should now be running on your device or emulator.

## Contributing

Contributions to Connect are welcome! If you find any

 issues or have suggestions for improvements, please submit a GitHub issue or create a pull request. Make sure to follow the project's code of conduct.

## License

The Connect project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Connect is inspired by the Tinder app and its features. Special thanks to the Flutterflow community for their support and contributions.

## Contact

For any inquiries or feedback, feel free to contact the project maintainer:

- Name: Anusha Ganguly
- Email: ganguly.anusha.12@gmail.com
  
