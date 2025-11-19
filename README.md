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

# Assignment 9

## Explain why we need to create a Dart model when fetching/sending JSON data. What are the consequences of directly mapping Map<String, dynamic> without using a model (in terms of type validation, null safety, and maintainability)?

When working with JSON APIs in Flutter, creating a dedicated Dart model is essential for ensuring that data is handled safely, consistently, and predictably. Although Flutter technically allows using Map<String, dynamic> directly, this approach introduces several risks that affect type validation, null safety, and long-term maintainability of the codebase.

### 1. Type Validation

Using a model enforces strong typing, which helps ensure that the data receive from the server matches the expected structure. For example, if a field is supposed to be an integer, the model will immediately complain if the server sends a string or an unexpected type. This makes bugs easier to detect early, instead of causing unexpected runtime errors in random parts of the app.
On the other hand, using a raw Map (String, dynamic) skips this validation entirely. The value i extract may not be the type that is expected, and Dart will not warn. This can lead to runtime crashes when trying to display incorrect data types in the UI or perform operations on them. Essentially, models protect the app from unpredictable data, while Maps silently accept anything

### 2. Null Safety

Dart supports null safety, and models allow to clearly specify which fields are required and which ones can be null. This way, the compiler can help avoid accessing missing values or incorrectly assuming a variable is non-null.
In contrast, when using only Map (String, dynamic), every value is essentially nullable because JSON keys might be missing or null. Since the Map approach does not enforce null safety, theres a chance that might unintentionally pass null values into UI widgets or logic that expects actual data. This often results in hidden bugs or application crashes that are difficult to debug. Models provide a structured and explicit way to manage nullability.

### 3. Maintainability and Code Scalability

As the app grows, the structure of JSON data becomes more complex. Model classes help centralize the logic for parsing (from Json) and serializing (to Json) data, making the code easier to maintain. When the backend changes a field name or adds new attributes, only need to update the model in one place.
Without models, the scatter raw Map lookups (data["name"], data["price"], etc.) throughout the entire codebase. This makes it harder to track changes and introduces a high risk of typos in string keys. When a value changes or a key is renamed in the backend, they must manually modify every lookup in the app, which becomes error-prone and time-consuming. Using models ensures the codebase remains clean, consistent, and scalable.


## What is the purpose of the http and CookieRequest packages in this assignment? Explain the difference between their roles.

The http package is used for simple and stateless HTTP requests. It does not store cookies or maintain session information, making it suitable for accessing public endpoints that do not require authentication. Its role is limited to basic data fetching or sending without involving any user login state.

Meanwhile, CookieRequest is designed to work with Django’s session-based authentication system. This package automatically saves and sends cookies—especially the session ID generated after logging in—allowing the backend to identify the user across multiple requests. It is essential for actions that require authentication, such as creating items or retrieving user-specific data.

Overall, the http package handles general requests, while CookieRequest manages authenticated communication where session persistence is required.

## Explain why the CookieRequest instance needs to be shared across all components in the Flutter application.

A single shared CookieRequest instance is required so that the entire Flutter application consistently maintains the same authentication state. Since Django uses session-based authentication, the session ID is stored inside cookies. If each widget or page created its own separate CookieRequest object, the stored cookies would not be synchronized, causing the backend to treat every request as coming from a different, unauthenticated client.

By sharing one CookieRequest instance through a global provider, the application ensures that all components use the same cookie storage. This allows the login state to persist across pages, enables authenticated operations such as creating or editing items, and prevents inconsistencies where some parts of the app appear logged in while others do not. In essence, sharing the instance guarantees that the session is tracked uniformly throughout the application.

## Explain the connectivity configuration required for Flutter to communicate with Django. Why do we need to add 10.0.2.2 to ALLOWED_HOSTS, enable CORS and SameSite/cookie settings, and add internet access permission in Android? What would happen if these configurations were not set correctly?

Several configurations are required to ensure that a Flutter application can communicate properly with a Django backend. Each setting plays a crucial role in allowing requests, handling cookies, and ensuring compatibility with mobile or emulator environments.

1. Adding 10.0.2.2 to ALLOWED_HOSTS

When using the Android emulator, the address 10.0.2.2 acts as a special proxy that maps to the host machine’s localhost. Since Django blocks all unknown hosts for security reasons, this address must be explicitly added to ALLOWED_HOSTS. Without it, Django would reject every incoming request from the emulator with a “DisallowedHost” error, preventing any communication between the app and the server.

2. Enabling CORS

CORS (Cross-Origin Resource Sharing) must be enabled because Flutter and Django run on different origins. Django normally blocks cross-origin requests to prevent unauthorized access. By enabling CORS and allowing credentials, the backend becomes accessible to the Flutter application, especially when sending authenticated requests. If CORS is not configured, Django will reject requests with a CORS policy violation, and the app will not be able to fetch or send data.

3. Configuring SameSite and Cookie Settings

Django session authentication requires cookies to be sent back and forth between the app and the server. Modern browsers and frameworks impose strict SameSite rules for security, which can block cookies in cross-origin requests. Setting cookies to SameSite=None, enabling them to be sent over cross-site contexts, and allowing credentials ensures that login status and sessions work correctly. If these settings are missing, the app may always appear logged out, because cookies would never reach the server.

4. Adding Internet Permission in Android

The Android emulator blocks network access by default for security purposes. The application must explicitly request permission to access the internet using the (uses-permission android:name="android.permission.INTERNET") declaration. Without this permission, all network calls—regardless of correctness—will silently fail, making the app unable to connect to Django at all.

## Describe the data transmission mechanism—from user input to being displayed in Flutter.

1. User Inputs Data in Flutter

The process begins when the user fills out a form in Flutter. Flutter’s UI widgets (such as TextFormField, DropdownButtonFormField, and switches) collect the user’s input and store it in local variables. Form validation ensures that required fields are properly filled and follow expected formats before sending any data to the server.

2. Flutter Sends Data to Django via CookieRequest

Once validated, the data is serialized into JSON using jsonEncode. This JSON payload is sent to Django using the CookieRequest.postJson() method. CookieRequest automatically includes authentication cookies (if the user is logged in) to ensure the request is recognized as coming from an authenticated session. The request is sent to a specific Django endpoint designed to receive and process JSON data.

3. Django Processes Input and Saves to the Database

On the Django side, the specified view reads the JSON payload using json.loads(request.body). Django then validates and sanitizes this data (e.g., strip_tags() for security). After validation, Django creates a new model instance and saves it to the database. If the operation is successful, the server responds with a JSON message indicating success.

4. Flutter Receives Django’s Response

When Flutter receives the response, CookieRequest parses it back into a Dart structure. Flutter checks the status returned by Django. If successful, the app may show a success snackbar, clear the form, or navigate to another page such as the home page or the item list page.

5. Flutter Fetches Updated Data

To display updated information, Flutter performs a GET request (request.get()) to Django’s JSON endpoint. Django retrieves the latest data from the database, serializes it into JSON, and returns it to Flutter.

6. JSON Response Converted Into Dart Models

Flutter receives the JSON data and converts each object into a Dart model (e.g., ProductEntry.fromJson(d)). This model provides strong typing and ensures the data fits the expected structure, improving reliability when rendering UI components.

7. UI Updates Based on Retrieved Data

Finally, Flutter rebuilds widgets such as list views (ListView.builder) and detail pages, using the data now stored in Dart models. The user sees the newly added item or updated information rendered visually in the app’s interface.

## Explain the authentication mechanism for login, registration, and logout—from entering account data in Flutter to Django’s authentication process and displaying the menu in Flutter.

The authentication workflow between Flutter and Django involves several coordinated steps that manage user identity, session cookies, and page navigation. The following explanation covers the full process—from the moment the user submits their credentials in Flutter until Django authenticates them and the app displays the proper UI.

1. User Enters Credentials in Flutter

 For both login and registration, authentication begins when the user fills in a form in Flutter.

- For registration, the form collects a username and two password fields.

- For login, the form collects a username and password.

Flutter validates the input before sending it to the backend to prevent empty or invalid fields.

2. Flutter Sends Data to Django Through CookieRequest

Once validated, the app serializes the input into JSON and sends it using:

- request.postJson() for registration

- request.login() for login

CookieRequest automatically handles cookies and session information, ensuring that future requests can identify the user once logged in.

3. Django Processes Login or Registration Request

**Registration**:

Django receives the JSON data, validates the password match, checks username availability, and creates a new user using User.objects.create_user().
If successful, the server returns a JSON response indicating that the account has been created.

**Login**:

- Django receives login credentials via request.POST. The authentication flow is:

- authenticate(username, password) checks for valid credentials.

- If valid, Django calls auth_login(request, user) to create a session.

- Django sends a JSON response containing login status and the username.

- The session ID is stored in cookies, and CookieRequest saves these cookies automatically.


4. Flutter Stores the Session via CookieRequest

After a successful login, the cookies from Django—especially the session cookie—are stored inside the global CookieRequest instance.
This allows future requests (such as fetching user-specific products) to be recognized as authenticated.

5. Flutter Navigates to the Menu (Home Page)

Once authentication succeeds:

Flutter displays a success message via Snackbar. The app navigates to the menu (MyHomePage).

Since the CookieRequest instance now contains valid authentication cookies, the app can access pages that require login.

6. Logout Mechanism

For logout:

- Flutter calls request.logout("http://localhost:8000/logout/").

- Django’s logout view removes the session server-side via logout(request).

- Django returns a response, and CookieRequest clears all stored cookies.

- Flutter navigates back to the login screen, leaving the app in an unauthenticated state.

Without valid cookies, any protected Django views requiring @login_required will reject requests, ensuring proper security.

## Explain how you implemented the checklist above step-by-step (not just following a tutorial).

In this project, I implemented several key features to connect the Flutter application with the Django backend and ensure that product data could be created, fetched, displayed, and filtered correctly.

1. Creating the Product Model

I implemented a Dart model (ProductEntry) to match the JSON returned from Django. This model handles JSON conversion using fromJson and toJson, which ensures type safety and avoids inconsistencies when sending or receiving data.

2. Fetching Data from Django

I added a function in Flutter that uses request.get() to call Django’s /json/ endpoint. The JSON response is parsed into a list of ProductEntry objects and passed to a FutureBuilder for rendering.

3. Displaying the Product List

I implemented a dedicated ProductEntryListPage to show all products from Django. Each item is displayed using a custom ProductEntryCard widget that includes image, name, price, and other attributes.

4. Creating the Detail Page

I added a ProductDetailPage to show full product information when a card is tapped. This page receives a ProductEntry object and displays all its fields clearly.

5. Filtering “My Products”

To show only products created by the logged-in user, I modified the Django /json/ endpoint to support a filter=my parameter. I then updated Flutter so that when “My Products” is selected, it requests only user-specific items.

6. Sharing CookieRequest Across the App

I integrated CookieRequest using Provider at the root widget so the entire application shares one authenticated session. This makes Django’s login system work smoothly across all screens.

7. Implementing Authentication

I implemented login and register pages in Flutter using request.login() and request.postJson(). Django validates the credentials, returns session cookies, and Flutter navigates to the main menu after successful authentication. Logout clears the session and returns to the login page.

8. Adding the Product Creation Form

I created a Flutter form to add new products and connected it to Django’s /product/create-flutter/ endpoint. When the form is submitted, the app sends product data as JSON, Django saves it, and Flutter navigates back to the homepage with a confirmation message.

9. Configuring Django–Flutter Connectivity

I configured the backend with 10.0.2.2 in ALLOWED_HOSTS, enabled CORS and cookie settings, and added Internet permission in Android. These settings ensure Flutter can access Django, maintain sessions, and load images without being blocked.

10. Updating Navigation

I updated the drawer (LeftDrawer) and homepage menu so the user can easily navigate to Add Product, All Products, and My Products pages.
