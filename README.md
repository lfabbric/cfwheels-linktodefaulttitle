# Plugin: LinkToDefaultTitle

## Purpose

LInkToDefaultTitle is feature to overload the linkTo mehtod to automatically display the routes pageTitle, if available, otherwise return the default operation and show the url.

## Setup

Copy LinkToDefaultTitle-1.0.1.zip file to your plugins folder and reload your application.

## Configuration

Within the config/routes.cfm page, added a new parameter to the addRoute method called enabledfor.

```java
config/routes.cfm ---------------------
    addRoute(
        name="about",
        pattern="/about",
        controller="pages",
        action="about",
        linkToText="value1" // new param
    );

    or

    .get(name="about", pattern="/about", to="Pages##about", linkToText="value1")
```

```java
config/settings.cfm
    // you can set defaults for the addRoute
    set(
        functionName="addRoute",
        linkToText="value1"
    );
```

#### Parameters
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
enabledFor | `string` | false |  | Set the default text for the linkTo method.

## Utilities

-----
### $ltdt_getRoute()
Returns the route name based on the action/controller provided.

#### Usage
```java
config/routes.cfm
    addRoute(
        name="terms",
        pattern="/terms",
        controller="pages",
        action="terms",
        linkToText="Terms and Conditions"
    );

    or 

    .get(name="terms", pattern="/terms", to="Pages##terms", linkToText="Terms and Conditions")

//some controller or view
    $ltdt_getRoute(action="terms"); // return terms
    $ltdt_getRoute(action="terms", controller="pages"); // return terms
    $ltdt_getRoute(route="terms"); // return terms
```

#### Parameters
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
route | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
action | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
controller | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
----
### $ltdt_getRequestedRouteParam()
Returns a variable defined within the route or set as a default value for the route.


#### Usage
```java
config/routes.cfm
    addRoute(
        name="terms",
        pattern="/terms",
        controller="pages",
        action="terms",
        linkToText="Terms and Conditions",
        someAbstractVariable=15
    );

//some controller or view
    $ltdt_getRequestedRouteParam("terms", "linkToText"); // will return "Terms and Conditions"
    $ltdt_getRequestedRouteParam("terms", "someAbstractVariable"); // will return 15
```

#### Parameters
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
route | `string` | true |  | Name of a route that you have configured in config/routes.cfm.
paramVariable | `string` | true |  | Name of a variable you have defined within your route
----
