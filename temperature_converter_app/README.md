# Temperature Converter App

## Overview
The Temperature Converter App is a Flutter application that allows users to convert temperatures between Fahrenheit and Celsius. Users can select the conversion type, input a temperature value, and view the converted result along with a history of previous conversions.

## Features
- Select between Fahrenheit-to-Celsius and Celsius-to-Fahrenheit conversions.
- Input field for entering temperature values.
- Convert button to trigger the conversion process.
- Display of conversion results rounded to two decimal places.
- History of conversions to track previous calculations.

## Project Structure
```
temperature_converter_app
├── lib
│   ├── main.dart                  # Entry point of the application
│   ├── screens
│   │   └── home_screen.dart       # Main interface for the app
│   ├── widgets
│   │   ├── conversion_selector.dart # Widget for selecting conversion type
│   │   ├── temperature_input.dart   # Widget for temperature input
│   │   ├── convert_button.dart       # Button to trigger conversion
│   │   └── history_list.dart         # Widget to display conversion history
│   └── models
│       └── conversion_history.dart   # Model for managing conversion history
├── test
│   └── widget_test.dart             # Widget tests for the application
├── pubspec.yaml                     # Configuration file for the Flutter project
└── README.md                        # Documentation for the project
```

## Setup Instructions
1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `flutter pub get` to install the necessary dependencies.
4. Use an emulator or a physical device to run the app with `flutter run`.

## Usage
- Launch the app on your device.
- Select the desired conversion type (Fahrenheit to Celsius or Celsius to Fahrenheit).
- Enter the temperature value in the input field.
- Press the "Convert" button to see the converted temperature.
- View the conversion history displayed below the input field.

## Contribution
Feel free to contribute to the project by submitting issues or pull requests. Your feedback and suggestions are welcome!

## License
This project is open-source and available under the MIT License.