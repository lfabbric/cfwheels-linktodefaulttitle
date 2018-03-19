# Plugin: LinkTo() Show Default Title

## Purpose

This helper plugin will automatically display the page title when using the linkTo() function.

## Usage

```html
#linkTo(route = "terms")#

// results
<a href="/terms">Terms and Conditions</a>
```

## Configuration

Within the config/routes.cfm page, added a new parameter to the addRoute method called linkToText.

```java
config/routes.cfm ---------------------
    addRoute(
        name="about",
        pattern="/about",
        controller="pages",
        action="about",
        linkToText="value1" // new param
    );

    // or

    .get(name="about", pattern="/about", to="Pages##about", linkToText="value1")
```

** Parameters **
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
enabledFor | `string` | false |  | Set the default text for the linkTo method.

## Included Functions

-----
### $ltdt_getRoute()
Returns the route name based on the action/controller provided.

**Usage**
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

**Parameters**
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
route | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
action | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
controller | `string` | false |  | See documentation for [linkTo]("https://guides.cfwheels.org/docs/linkto")
----

### $ltdt_getRequestedRouteParam()
Returns a variable defined for a specific route.

**Usage**
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

**Parameters**
Parameter | Type | Required | Default | Description
--- | --- | --- | --- | ---
route | `string` | true |  | Name of a route that you have configured in config/routes.cfm.
paramVariable | `string` | true |  | Name of a variable you have defined within your route
