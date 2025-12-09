//
//  FakeStoreApiPrompt.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 07/12/25.
//

import Foundation
/*
 Objective:

 Build a reusable and extensible data layer for fetching and caching data from the Fake Store API.
 Your solution should handle products and users endpoints, supporting caching with refresh logic and persistence between app launches.

 API:
 https://fakestoreapi.com

 Requirements:
 – Create a generic data fetching service to handle multiple API endpoints (e.g., /products, /users).
 – Include caching logic with time-based refresh intervals.
 – Ensure cached data persists between app launches

 Data to be displayed:
   – Use a tab view to display list of products and users
   – Products
   – Image, title and description
   – Description should be limited to two lines
   – Users
   – First and last name
   – email

 Functionality:
 – Fetch data for products (/products) and users (/users).
 – Automatically refresh data when cache expires.
 – Pull to refresh functionality that invalidates cache and refreshes data
 – Implement error handling
 – Lists should be searchable
 – This API does not support pagination, but you should add pseudo code with comments or print statements to implement it

 UI Behavior:
 – Show a loading indicator while data is being fetched.
 – Display an error message if the data fetch fails.
 – Update the UI with fetched data or fallback to cached data if available.

 Expectations:
  – Follow SOLID principles to ensure your code is modular and extensible.
  – Use Swift best practices for asynchronous programming (async/await).
  – Write clean, readable, and scalable code

Deliverables:
  – A fully functional app or module demonstrating the above functionality.
  – Example UI displaying products and users.

Extra Credit:
Write unit tests with SwiftTesting for your modules
 */
