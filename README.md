# Assignment 7

## Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.

A widget tree is a hierarchical structure that represents how widgets are organized in a Flutter application. Every widget exists inside this tree and has a parent-child relationship.

Parent widget: wraps and controls layout or behavior of its children.

Child widget: exists inside a parent and follows the structure defined by the parent.

Example in this project:

Scaffold → parent of AppBar and body

Column → parent of Row, Text, and GridView

Flutter builds UI based on this hierarchical widget tree structure.

## List all the widgets you used in this project and explain their functions.

1. MaterialApp = Configures the overall app and provides Material Design structure.
2. Scaffold = Base layout structure (provides AppBar, body, Snackbar, etc.).
3. AppBar = Displays the top navigation bar.
4. Text = Displays text.
5. Row = Arranges widgets horizontally.
6. Column = Arranges widgets vertically.
7. adding = Adds spacing around widgets.
8. Card = Displays a container with a card style and elevation.
9. Container = Wraps widgets and provides padding/size styling.
10. GridView.count = Displays widgets in a grid layout.
11. Icon = Displays icons.
12. Material = Provides Material design styling and behavior.
13. InkWell = Makes widgets clickable with ripple effect.
14. SnackBar = Shows a temporary notification message at the bottom of the screen.
15. MediaQuery = Accesses device screen size for responsive layout

## What is the function of the MaterialApp widget? Explain why this widget is often used as the root widget.

MaterialApp is responsible for:

- Defining the app's theme and color scheme

- Managing navigation between screens

- Applying Material Design components

- Handling localization and configuration

It is used as the root widget because many Flutter widgets (like Scaffold, AppBar, and SnackBar) require a Material Design context provided by MaterialApp.
