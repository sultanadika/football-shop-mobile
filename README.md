# Assignment 7

## Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.

A widget tree is a hierarchical structure that represents how widgets are organized in a Flutter application. Every widget exists inside this tree and has a parent-child relationship.

Parent widget: wraps and controls layout or behavior of its children.

Child widget: exists inside a parent and follows the structure defined by the parent.

Example in this project:

Scaffold → parent of AppBar and body

Column → parent of Row, Text, and GridView

Flutter builds UI based on this hierarchical widget tree structure.

## Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
