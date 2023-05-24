# Dessert Tour App

Dessert Tour is an iOS app I created that allows users to navigate and explore delicious dessert recipes from around the world. With an integration of API responses, users can browse desserts, and access detailed information about each dessert.

## Features

- Landing Page: Upon launching the app, users are greeted with an appealing landing page that showcases the app logo I created, a tasty cupcake atop the iconic Eiffel Tower!

- List of Desserts: Users will then browse through a list of desserts sorted alphabetically, making it easy to find their favorite treats. Each dessert entry on the list provides the dessert name as well as an image preview.

- Dessert Details: When users select a specific meal from the list, they are presented with a detailed view. This view fetches essential information from the MealDB API to be displayed, including the dessert name, ingredients with measurements, and step-by-step instructions on how to prepare the dessert.

- MVC Architecture: The app follows the Model-View-Controller (MVC) architectural pattern, promoting separation of concerns and maintainability of code.

- UI/UX Design: This app also incorporates some UI/UX basic design principles, creating a visually pleasing interface that enhances usability and improves the user experience.

## Technologies Used

- API Integration: This app demonstrates my ability to interact with APIs by making calls and handling responses. The integration of the MealDB API endpoints ensures that users have access to up-to-date and accurate dessert recipes sorted alphabetically, with any null and empty values being filtered out.
The endpoints used were:
- https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the
Dessert category.
- https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its
ID.
- Swift
- iOS SDK
- SwiftUI
- Latest version of Xcode

# Screen Recording
   https://github.com/BryllieBrinkley/DessrtTour-iOS/assets/49615544/9543e1bd-b88a-4ecb-9d5a-9e71d20b0273


# Installation & How to Run this project

To install this project, make sure you have Xcode installed on your machine and follow these steps:

1. Clone the repository to your local machine.

2. Open the project file in Xcode and click the "play" button in the Xcode toolbar or you can use the keyboard shortcut Command-R.

3. Wait for build to succeed and the app will run in the Xcode simulator or on a connected device!

Thank you for taking the time to check out my app Dessert Tour! :) - Written by: Jibryll Brinkley
