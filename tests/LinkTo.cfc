component extends="wheels.Test"  hint="Unit Tests" {
    property array previousRoutes;
    property struct previousRoutePositions;

    function setup(){
        c=controller("Pages", {});
        previousRoutes = application.wheels.routes;
        previousRoutePositions = application.wheels.namedRoutePositions;
        lock timeout="60" scope="application" type="exclusive" {
            application.wheels.routes = [];
            application.wheels.namedRoutePositions = {};
            application.wheels.routes.append({
                "ACTION" = "page1",
                "CONSTRAINTS" = {},
                "CONTROLLER" = "Pages",
                "METHODS"= "get",
                "NAME"= "page1",
                "ON"= "",
                "PACKAGE" = "",
                "PATTERN" = "/page1",
                "REGEX" = "^page1\/?$",
                "VARIABLES" = "",
                "LINKTOTEXT" = "Page 1 Title"
            });
            application.wheels.routes.append({
                "ACTION" = "page2",
                "CONSTRAINTS" = {},
                "CONTROLLER" = "Pages",
                "METHODS"= "get",
                "NAME"= "page2",
                "ON"= "",
                "PACKAGE" = "",
                "PATTERN" = "/page2",
                "REGEX" = "^page2\/?$",
                "VARIABLES" = "",
                "LINKTOTEXT" = "Page 2 Title",
                "AUTHOR" = "Joe Blow from Idaho"
            });
            application.wheels.routes.append({
                "ACTION" = "authenticate",
                "CONSTRAINTS" = {},
                "CONTROLLER" = "utilities",
                "METHODS"= "get",
                "NAME"= "AuthenticateUser",
                "ON"= "",
                "PACKAGE" = "",
                "PATTERN" = "/login",
                "REGEX" = "^login\/?$",
                "VARIABLES" = "",
                "LINKTOTEXT" = "LOGIN"
            });
            application.wheels.namedRoutePositions["page1"] = 1;
            application.wheels.namedRoutePositions["page2"] = 2;
            application.wheels.namedRoutePositions["AuthenticateUser"] = 3;
        }
    }

    function teardown(){
        lock timeout="60" scope="application" type="exclusive" {
            application.wheels.routes = previousRoutes;
            application.wheels.namedRoutePositions = previousRoutePositions;
        }
    }

    function test_validate_default_route_title() {
        linkText = "Page 1 Title";
        linkToHtml = c.linkTo(route="page1");
        assert("linkToHtml.contains(linkText)");
    }

    function test_validate_default_route_title_second_position() {
        linkText = "Page 2 Title";
        linkToHtml = c.linkTo(route="page2");
        assert("linkToHtml.contains(linkText)");
    }

    function test_validate_default_route_title_third_position() {
        linkText = "LOGIN";
        linkToHtml = c.linkTo(route="AuthenticateUser");
        assert("linkToHtml.contains(linkText)");
    }

    function test_validate_default_route_case() {
        linkText = "login";
        linkToHtml = c.linkTo(route="AUTHENTICATEUSER");
        assert("linkToHtml.contains(linkText)");
    }

    function test_get_route_by_action_and_controller() {
        routeName = "AuthenticateUser";
        returnedRouteName = c.$ltdt_getRoute(action="authenticate", controller="utilities");
        assert("returnedRouteName.contains(routeName)");
    }

    function test_get_route_by_action_from_non_pages_controller() {
        routeName = "AuthenticateUser";
        returnedRouteName = c.$ltdt_getRoute(action="authenticate");
        assert("!returnedRouteName.contains(routeName)");
    }

    function test_get_additional_variable() {
        authorsName = "Joe Blow from Idaho";
        fetchedAuthorsName = c.$ltdt_getRequestedRouteParam(route = "pages", paramVariable = "author");
        assert("authorsName.contains(fetchedAuthorsName)");
    }

}