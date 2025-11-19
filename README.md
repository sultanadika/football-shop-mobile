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

# Assignment 8

## Explain the difference between Navigator.push() and Navigator.pushReplacement() in Flutter. In what context of your application is each best used?

### Navigator.push()

Adds (pushes) a new page on top of the current page stack.

The previous page stays in memory, so the user can go back using the back button (Navigator.pop()).

Use this when you want users to be able to go back
Example in my app:

<pre>
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const AddNewItemPage()),
);
</pre>

When the user finishes filling the form, they can press the back arrow to return to the home page.

### Navigator.pushReplacement()

Replaces the current page with a new one — the old page is removed from the stack.

The user cannot go back to the replaced page.

Use this when you don’t want users to return (like after login, or when switching between drawer pages).

Example in my app (Drawer navigation):
<pre>
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const AddNewItemPage()),
);
</pre>

When you select “Add Product” from the drawer, it replaces the current page, ensuring the drawer doesn’t “stack up” multiple pages.

## How do you use hierarchy widget like Scaffold, AppBar, dan Drawer to build a consistent page structure in the your application?

The way I structure every page in my app relies heavily on Scaffold, AppBar, and Drawer. These three widgets help me keep every screen consistent and easy to navigate. Scaffold acts as the main layout for the page — it’s where I define the app bar, drawer, and body content. The AppBar stays at the top of every screen, showing the app title “Football Shop,” which helps users recognize they’re still inside the same app. The Drawer gives users a simple way to move between pages like Home and Add Product without breaking the flow. By keeping these elements the same across pages, the whole app feels connected and professional. It’s also much easier to manage or update the layout later since every page follows the same pattern.

## In the context of user interface design, what do you think is the advantages of using layout widget like Padding, SingleChildScrollView, and ListView when displaying form elements? Provide usage examples from your application.

When building the Add Product form, layout widgets like Padding, SingleChildScrollView, and ListView made a huge difference in how clean and user-friendly the page looks. Padding helps create breathing space around each form field, so the UI doesn’t look squished together. ListView allows me to stack multiple form fields vertically while making the whole page scrollable. I also use SingleChildScrollView (or sometimes just rely on ListView) to make sure the page doesn’t overflow when the keyboard pops up or when viewed on smaller devices. Without these layout widgets, the form would feel cramped and possibly break the layout. They basically make the UI more responsive and comfortable for users filling out the form.

## How do you set the color theme so that your Football Shop have a visual identity that is consistent with the shop brand.

To give my Football Shop app a consistent identity, I set up a color theme using Flutter’s ThemeData. I picked blue as the main color because it fits the sporty and energetic vibe of a football store while still looking clean and professional. This color theme automatically affects the app bar, buttons, and highlights across all pages, which keeps everything visually connected. It might seem small, but having the same color tone everywhere really makes the app feel like one complete brand instead of just separate screens. It also helps users recognize the app style instantly, which is something I wanted for a better first impression.