# Books Finder 

[![License: MIT][license_badge]][license_link]

<img src="https://github.com/leonardocaracho/books_finder/blob/main/.github/images/books_finder.gif?raw=true" alt="BooksFinder" width=300 height=auto>

---

## Getting Started 🚀

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following command:

```sh
$ flutter run --target lib/main.dart
```

\*The Books Finder works on iOS and Android.

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## App Architecture

<img src="https://bloclibrary.dev/assets/bloc_architecture_full.png" alt="BooksFinder" width=500 height=auto>

Using the bloc library allows us to separate our application into three layers:

* **Presentation**
    - This layer holds all the widgets, along with their blocs.
Widgets do not communicate directly with the repository.

* **Business Logic**
    - Consumes the domain model from the repository layer and expose a feature-level model which will be surfaced to the user via UI.
  
* **Data**
    - **Repository**: Abstract the data layer and expose domain models for the application to consume, facilitating the communication with the Bussiness Logic layer.
    - **Data Provider**: The data provider is used to fetch raw data from the API and to handle the local storage for the favorites feature.

## Supported Features

- [x] Search for a book using the google api.
- [x] Show book details in a separated page.
- [x] Save a book into your favorites.
- [x] Access/Delete your favorites books while offline.

## Packages in use

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [build_runner](https://pub.dev/packages/build_runner) for code generation
- [http](https://pub.dev/packages/http) for talking to the REST API
- [mocktail](https://pub.dev/packages/mocktail) for testing

## About the Google API

The app fetchs data from the following endpoint:

- [Get Books by query](https://www.googleapis.com/books/v1/volumes?q=dune)

**Note**: to use the API you don't need to have your own API key.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT