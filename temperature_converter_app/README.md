# Temperature Converter App

A responsive Flutter application for converting temperatures between Fahrenheit and Celsius. The app features a modern UI with green and yellow color themes, box shadows, and rounded corners for a delightful user experience. It works seamlessly in both portrait and landscape orientations.

## Features
- **Fahrenheit to Celsius and Celsius to Fahrenheit conversions**
- **User input field** for entering temperature
- **Conversion result** displayed instantly and clearly
- **Conversion history** (most recent at the top)
- **Responsive design** for all device sizes and orientations
- **Modern UI** with Material Design, custom colors, and shadows

## Code Structure
```
lib/
  main.dart         # Main application code, all UI and logic

test/
  widget_test.dart  # Widget test for main app UI and conversion logic

pubspec.yaml        # Project dependencies and configuration
```

- All logic and UI are in `lib/main.dart`.
- The main widget is `TemperatureConverterApp`, which sets up the theme and home screen.
- The `TemperatureConverterScreen` stateful widget manages user input, conversion logic, and history.
- Helper widgets (as methods) are used for input, output, conversion selector, and history list.

## How to Use
1. **Enter a temperature** in the input field.
2. **Select the conversion direction** (Fahrenheit to Celsius or Celsius to Fahrenheit).
3. **Tap the CONVERT button** to see the result.
4. The **converted value** appears in the output field.
5. Each conversion is added to the **history list** below, with the most recent at the top.
6. The app automatically adapts to portrait and landscape modes for the best experience.

## Running the App
1. Make sure you have [Flutter installed](https://docs.flutter.dev/get-started/install).
2. Clone this repository and open the project folder.
3. Run `flutter pub get` to install dependencies.
4. Run the app on an emulator, device, or web:
   - For mobile: `flutter run`
   - For web: `flutter run -d chrome`

## Testing
- Run `flutter test` to execute the included widget test.

## Screenshots
- Portrait and landscape layouts are supported and visually consistent.

---

**Enjoy converting temperatures with style!**