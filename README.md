# Assignment 7

## Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.

A widget tree is a hierarchical structure that represents how widgets are organized in a Flutter application. Every widget exists inside this tree and has a parent-child relationship.

Parent widget: wraps and controls layout or behavior of its children.

Child widget: exists inside a parent and follows the structure defined by the parent.

Example in this project:

- Scaffold which is parent of AppBar and body

- Column which is parent of Row, Text, and GridView

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

## Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?

Differences between StatelessWidget and StatefulWidget:

StatelessWidget	                                                       
- Does not hold changing state.	                          
- UI does not update automatically after being built.	      
- Used for static screens/UI elements.	                  

StatefulWidget
- Holds state that can change during runtime.
- UI updates when state changes (using setState).
- Used for interactive or dynamic content.

Use cases:

StatelessWidget → static UI pages, simple buttons, labels, 
StatefulWidget → forms, animations, user input, data that changes


## What is BuildContext and why is it important in Flutter? How is it used in the build method?

BuildContext is an object that gives information about the location of a widget in the widget tree.

It is important because it allows widgets to:

- Access theme and styling 

- Access message handlers 

- Navigate between screens 

- Find parent widgets and shared data in the tree

Inside the build() method, context helps widgets build UI according to their position in the tree.

##  Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”.

Hot reload lets you apply code changes instantly without restarting the app. It keeps the current state, so things like typed text or the current screen stay as they are. This is useful when you're adjusting UI or making small changes during development.

Hot restart fully restarts the app from the beginning. It clears all state and re-loads the entire application, which is necessary when your changes affect the app’s initial setup or logic.
