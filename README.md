# StarWarsSense

## The app

### What is it?

This is a simple app that fetches informations from the Star Wars universe, using the SWAPI endpoint.
It then displays 3 of the various categories provided:
  - People
  - Planets
  - Vehicles
  
### How does it work?

Those 3 categories are accessible through tabs, each tab displays a table view with the name / title of the items.
Clicking a row of the table view prompts a new view that displays the details of the selected item.
Fields can vary depending on their releveance, so the details view for one item could display a field 'x' and not
display that field for another item of the same category because that item doesn't have any data for that field.

## Design

### What was used?

The app was built following a MVVM-C architecture, heavily relying on abstraction and inheritance.

### What is to be found?

Basically:
  - View controllers
  - View models
  - Coordinators
  - Models
  - Protocols
  - Generic classes
  
### Why?

The MVVM-C architecture might be overkill for a simple app like that one. A simple MVC could suffice here.
So why use that architecture?

Several reasons there, to keep it simple, the idea was to conform as much as possible to the SOLID principle,
make the app as scalable and modular as possible, and as readable as possible by shortening heavy-components' code.

### How does it work?

Most if not all components of the app rely on inheritance and protocol conformity.
As an example, the `PeopleViewController` inherits from `ItemViewController`, allowing all the globally shared
UI (used also by `PlanetViewController` and `VehiclesViewController`) to only be set once. Allowing the `PeopleViewController`
to only integrate the UI logic bound to that category.
The `ItemViewController` inherits from `ViewController` which is a sub-class of `UIViewController` conforming to `Stylable`
protocol and implementing all the methods to re-style each components and subview.
The idea here is to normalize the UI across the entire app and avoid magic-values. So changing a font for basic labels
on one view controller can easily be applied to all the view controllers of the app without having to refactor each and
single one of them.

This is the basic overview of the `PeopleViewController`:

<pre>
*--------------------*        *--------------------*        *--------------------* -----> PeopleViewController + Category UI & ViewModels
|                    |        |                    |        |                    |
|  UIViewController  | -----> |  ViewController    | -----> | ItemViewController | -----> PlanetsViewController + Category UI & ViewModels
|                    |        |                    |        |                    |
*--------------------*        *--------------------*        *--------------------* -----> VehiclesViewController + Category UI & ViewModels
                                 + Style protocols             + Shared UI setup
</pre>

Adding a new category would be as simple as inheriting from `ItemViewController`, create the `ViewModel` and the `Model`
and add the case for that category in the `APIHandler` and `TabBar`.

### What else?

Fonts, colors, dimensions are set up in a protocol `Stylable` applied to different components accross the app.
The stylable protocol allows custom `Style` to be applied, but are defined with a default `Style`, allowing access to fonts, colors and
dimensions accross the different components.

i.e: `cachedStyle.colors.common.background` would allow to normalize the background color across the app and just change it once in
order to ensure that all components using this variables would be correctly updated, during runtime as well, and correctly applied to
all sub-components.

Events are handled through the `TriggeredEvent`, adding observables to events in order to trigger said events. Home-made react framework.
It basically works by `.addObserver(self) { scene, arg }` and `.trigger(arg)`. It is to note that the target of the observer is set to weak
in order to avoid retention cycles. Allowing to avoid declaration of `weak [target]` each time.

### Frameworks?

Decision was made to not use any framework for this app, and keep it as native as possible.
Frameworks that would probably be used:
  - CocoaLumberjack for logging
  - RxSwift to replace the homemade react framework
  - SwiftLint to keep syntax normalized (though I believe that code syntax is at the moment ok)

## Known Issues

  - The app works perfectly on simulator, but there's a minor UI issue on some devices where the table views are darker than expected.

## Improvements

  - The table view could use a generic register design pattern for cells and allocation depending on the category, instead of registering
  each one.
  - The reload for the table view could be refactored to be more precise with just inserting sections each time we add a page instead of
  reloading the entire table view.
  - The triggered event handler could use a releasing pool and additional control over not adding same observers over and over.
  - Some minor improvements on code repeat.
  - Add a circular referencing across all categories to allow user to circle through the categories from one reference to the other
  (i.e: tap and move to `Luke` -> tap and move to `Human` -> tap and move to `Princess Leia` -> tap and move to `Tatooine`...etc)
  - More unit tests coverage and UI tests.
