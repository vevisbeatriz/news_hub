# News Hub

## Description

News Hub is a comprehensive news application that provides daily news updates from reliable sources. It offers a user-friendly interface with features like saving articles for later reading and deleting articles. It's designed for individuals who want to stay updated with the latest news in a convenient and efficient manner.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [App Functionality](#app-functionality)
- [Code and System Design](#code-and-system-design)
- [Clean Architecture Structure](#clean-architecture-structure)
- [Packages Used](#packages-used)
- [Use of BLoC](#use-of-bloc)

## Installation

This project uses Flutter. To install and run the project:

1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`

## Usage

This section includes screenshots and instructions on how to use the app.

![Home Screen](./assets/images/screenshots/home_screen.png)

This is the home screen of the app. Here you can see the list of all the news articles.

![Article Screen](./assets/images/screenshots/article_screen.png)

When you tap on an article, you are taken to this screen where you can read the full article.

![Saved Articles Screen](./assets/images/screenshots/saved_articles_screen.png)

This is the saved articles screen of the app. Here you can see the list of all the articles you have saved for later reading. You can access this screen from the main menu.

## App Functionality

The News Hub app is a comprehensive news application that provides daily news updates from reliable sources. It offers a user-friendly interface with features like saving articles for later reading and deleting articles. It's designed for individuals who want to stay updated with the latest news in a convenient and efficient manner.

## Code and System Design

The app is built using Flutter, a UI toolkit from Google that allows developers to create natively compiled applications for mobile, web, and desktop from a single codebase. Flutter uses the Dart programming language.
The app follows the principles of Clean Architecture, which separates the software into layers, each with its own distinct responsibility. This separation allows for easier testing and maintenance, as changes in one layer do not affect the others.

## Clean Architecture Structure

In the context of this project, the Clean Architecture is structured as follows:

1. **Presentation Layer**: This layer contains the UI of the application and the presentation logic. It uses the BLoC (Business Logic Component) pattern for state management. BLoC helps to separate the presentation layer from the business logic, making the code more maintainable and testable.
2. **Domain Layer**: This layer contains the business logic of the application. It defines use cases which represent all the possible actions a user can perform in the app.
3. **Data Layer**: This layer handles data retrieval and storage. It abstracts the source of the data, which can be a local database or a remote API.

## Packages Used

The app uses several packages to facilitate development:

- `flutter_bloc`: This package is used for implementing the BLoC pattern for state management. It helps to manage the app's state in a predictable way by handling all the possible states of the UI.
- `get_it`: This is a service locator package that is used for dependency injection. It allows for easy access to services throughout the app, promoting loose coupling and easier testing.
- `floor`: This package provides abstraction for accessing the SQLite database in Flutter. It's used for local data persistence in the app.
- `retrofit`: This package is used for networking. It simplifies the process of making HTTP requests.
- `equatable`: This package helps in comparing Dart objects. It's used in the BLoC pattern to compare states and events.
- `flutter_hooks`: This package is used to manage the lifecycle of stateful logic in the app.
- `cached_network_image`: This package is used for loading and caching network images. It improves the user experience by storing images in cache for faster loading.

## Use of BLoC

The BLoC pattern is used extensively in the app for state management. It separates the presentation layer from the business logic, making the code more maintainable and testable. In the BLoC pattern, the UI components dispatch events to the BLoC, and the BLoC changes its state in response to the events and returns the new state to the UI components. This ensures that the UI components only need to know how to render themselves given a certain state, and don't need to know anything about how to retrieve or update data.