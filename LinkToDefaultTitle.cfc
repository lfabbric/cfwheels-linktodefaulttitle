component hint="cfWheels linkTo Overload Plugin" output="false" mixin="controller" {

    public function init() {
        this.version = "2.0";
        this.keyAttribute = "linkToText";
        return this;
    }

    public function linkTo() {
        var loc = {};
        loc.route = $ltdt_getRoute(argumentCollection=arguments);
        if (!arguments.keyExists("text") && len(loc.route)) {
            arguments.text = $ltdt_getRequestedRouteParam(loc.route, application.wheels.plugins.linktodefaulttitle.keyAttribute);
            if (!len(arguments.text)) {
                arguments.delete("text");
            }
        }
        return core.linkTo(argumentCollection=arguments);
    }

    /**
     * @hint private
     */
    public string function $ltdt_getRequestedRouteParam(required string route, required string paramVariable) {
        var loc = {};
        loc.requestedRouteName = arguments.route;
        if (application.wheels.namedRoutePositions.keyExists(loc.requestedRouteName)) {
            loc.pos = application.wheels.namedRoutePositions[loc.requestedRouteName];
            loc.route = duplicate(application.wheels.routes[listFirst(loc.pos)]);
            if (loc.route.keyExists(arguments.paramVariable)) {
                return loc.route[arguments.paramVariable];
            } else {
                try {
                    return get(functionName = "addRoute", name = arguments.paramVariable);
                } catch (any e) {}
            }
        }
        return "";
    }

    /**
     * @hint private
     */
    public string function $ltdt_getRoute() {
        var loc = duplicate(arguments);
        if (loc.keyExists("route")) {
            return loc.route;
        }
        loc.controller = (loc.keyExists("controller") && len(loc.controller)) ? loc.controller : request.wheels.params.controller;
        if (!loc.keyExists("action")) {
            return "";
        }
        argArray = arrayFind(application.wheels.routes, function(item) {
            return item.controller == loc.controller && item.action == loc.action;
        });
        if (argArray) {
            return application.wheels.routes[argArray].name;
        }
        return "";
    }
}
