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
            application.wheels.namedRoutePositions["page1"] = 1;
        }
    }

    function teardown(){
        lock timeout="60" scope="application" type="exclusive" {
            application.wheels.routes = previousRoutes;
            application.wheels.namedRoutePositions = previousRoutePositions;
        }
    }

    function test_validate_default_page_text() {
        linkText = "Page 1 Title";
        linkToHtml = c.linkTo(route="page1");
        assert("linkToHtml.contains(linkText)");
    }
}