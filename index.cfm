<cfsetting enablecfoutputonly="true">

<h1 id="pluginrouteenabledfor">Plugin: LinkTo - Default Title</h1>

<h2 id="purpose">Purpose</h2>

<p>LInkToDefaultTitle is feature to overload the linkTo mehtod to automatically display the routes pageTitle, if available, otherwise return the default operation and show the url.</p>

<h2 id="setup">Setup</h2>

<p>Copy LinkToDefaultTitle-1.0.1.zip file to your plugins folder and reload your application.</p>

<h2 id="configuration">Configuration</h2>

<p>Within the config/routes.cfm page, added a new parameter to the addRoute method called pageTitle.</p>

<pre><code class="java language-java">config/routes.cfm
// pre 2.0
addRoute(
    name="about",
    pattern="/about",
    controller="pages",
    action="about",
    linkToText="value1" // new check
);

// post 2.0
.get(name="about", pattern="/about", to="Pages##about", linkToText="About Us")
</code></pre>

<pre><code class="java language-java">config/settings.cfm
// you can set defaults for the addRoute
set(
    functionName="addRoute",
    linkToText="value1"
);
</code></pre>

<h2 id="parameters">Parameters</h2>
<table border=1>
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Type</th>
            <th>Required</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>linkToText</td>
            <td><strong>string</strong></td>
            <td>false</td>
            <td></td>
            <td>
                Set the default text for the linkTo method.
            </td>
        </tr>
    </tbody>
</table>

<h2>Utilities</h2>
<h3>$ltdt_getRoute()</h3>
<p>Returns the route name based on the action/controller provided.</p>
<pre><code>config/routes.cfm
...
// pre 2.0
addRoute(
    name="terms",
    pattern="/terms",
    controller="pages",
    action="terms",
    linkToText="Terms and Conditions"
);

// post 2.0
.get(name="terms", pattern="/terms", to="Pages##terms", linkToText="Terms and Condiotions")
...
</code></pre>

<pre><code>
$ltdt_getRoute(action="terms"); // return terms
$ltdt_getRoute(action="terms", controller="pages"); // return terms
$ltdt_getRoute(route="terms"); // return terms
</code></pre>

<h4 id="parameters">Parameters</h4>
<table border=1>
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Type</th>
            <th>Required</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>route</td>
            <td><strong>string</strong></td>
            <td>false</td>
            <td></td>
            <td>
                See documentation for <a href="https://guides.cfwheels.org/docs/linkto" ui-sref="docs.show({'doc': 'linkTo'})" class="doc-link" data-sidebar="linkTo" target="_blank">linkTo</a>
            </td>
        </tr>
        <tr>
            <td>action</td>
            <td><strong>string</strong></td>
            <td>false</td>
            <td></td>
            <td>
                See documentation for <a href="https://guides.cfwheels.org/docs/linkto" ui-sref="docs.show({'doc': 'linkTo'})" class="doc-link" data-sidebar="linkTo" target="_blank">linkTo</a>
            </td>
        </tr>
        <tr>
            <td>controller</td>
            <td><strong>string</strong></td>
            <td>false</td>
            <td></td>
            <td>
                See documentation for <a href="https://guides.cfwheels.org/docs/linkto" ui-sref="docs.show({'doc': 'linkTo'})" class="doc-link" data-sidebar="linkTo" target="_blank">linkTo</a>
            </td>
        </tr>
    </tbody>
</table>

<hr>
<h3>$ltdt_getRequestedRouteParam()</h3>
<p>Returns a variable defined within the route or set as a default value for the route.</p>
<pre><code>config/routes.cfm
...
addRoute(
    name="terms",
    pattern="/terms",
    controller="pages",
    action="terms",
    linkToText="Terms and Conditions",
    someAbstractVariable=15
);
...
</code></pre>

<pre><code>
$ltdt_getRequestedRouteParam("terms", "linkToText"); // will return "Terms and Conditions"
$ltdt_getRequestedRouteParam("terms", "someAbstractVariable"); // will return 15
</code></pre>

<h4 id="parameters">Parameters</h4>
<table border=1>
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Type</th>
            <th>Required</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>route</td>
            <td><strong>string</strong></td>
            <td>true</td>
            <td></td>
            <td>
                Name of a route that you have configured in config/routes.cfm.
            </td>
        </tr>
        <tr>
            <td>paramVariable</td>
            <td><strong>string</strong></td>
            <td>true</td>
            <td></td>
            <td>
                Name of a variable you have defined within your route
            </td>
        </tr>
    </tbody>
</table>

<cfsetting enablecfoutputonly="false">
