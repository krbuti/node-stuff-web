node-stuff
================================================================================

Source for the <https://node-stuff.mybluemix.net> site.


installation
================================================================================

To run the program, you'll need [node.js installed](http://nodejs.org/).  The
source repository is available via `git`, so you may need to
[install `git`](http://git-scm.com/book/en/Getting-Started-Installing-Git).
Mac OS X users can also get `git` via Xcode,
[but beware](http://stackoverflow.com/questions/5364340/does-xcode-4-install-git).

From a command/shell terminal:

* `cd` into the parent directory you want to install the project in
* `git clone` the project into a child directory
* `cd` into that child directory
* `npm install` to install dependencies

For example:

    $ cd Projects
    $ git clone [INSERT GIT REPO HERE]

        ... git output here ...

    $ cd node-stuff-web

    $ npm install

        ... npm output here ...



running locally
================================================================================

To run the app locally, run:

    node server

You should see something similar to the following output written to the console:

    node-stuff-web: server starting: http://localhost:6029
    node-stuff-web: server started


You can use the URL listed on one of the last lines to access the application.



deploying to BlueMix
================================================================================

You will need to ensure the `host` entry in the `manifest.yml` is set to a
unique host name across BlueMix.  If you get an error during deployment
regarding "host is taken", you'll need to edit the `manifest.yml` file and
specify a different `host` value.

To deploy from the command-line, while in the `node-stuff-web`
directory, issue the following command:

    cf push

The progress of the deployment will be displayed on the console,
ultimately indicating your
application has been deployed and what URL it is available at.

Other commands you may want to use

* `cf logs node-stuff`

  shows continuous log information for the app; Ctrl-C to exit

* `cf logs node-stuff --recent`

  shows recent log information for the app

* `cf stop node-stuff`

  stop the app if it's running

* `cf start node-stuff`

  start the app if it's stopped

* `cf app node-stuff`

  show information about the app

* `cf apps`

  show information about all the apps you have

You can of course also do all this through the
[ACE dashboard](https://ace.ng.bluemix.net/) as well.



enabling New Relic
================================================================================

This application can optionally be instrumented to run with
[New Relic](http://newrelic.com/).  To enable newrelic, you should first sign
into New Relic and crete a new **node.js** application.  This will provide you
with an API key.

You will pass the API key to the app via a Cloud Foundry environment variable;
the variable is named `NEW_RELIC_LICENSE_KEY`, and so you should use the
following command to set it:

    cf set-env node-stuff NEW_RELIC_LICENSE_KEY 9081238291092...

Once you do this, and restart the node-stuff application, you can monitor the
app in the New Relic dashboard.

If you don't set the Cloud Foundry environment variable, the New Relic
instrumentation will not be avaiable.

You can enable New Relic when running locally by setting the Cloud Foundry
environment variable in your local shell; eg, on a mac:

    NEW_RELIC_LICENSE_KEY=9081238291092... jbuild watch

This will run `jbuild watch`, with the Cloud Foundry environment variable set.

The New Relic initialization for this app will set the `app_name` for you;
you should set all other configuration parameters as environment variables.
See the `lib-src/newrelic-init.coffee` file for more information.



about the application
================================================================================

This application is written in [CoffeeScript](http://coffeescript.org/) and
compiled into JavaScript.  The CoffeeScript source is available in the
`lib-src` directory, and the compiled JavaScript files are available in the
`lib` directory.

The browser code for this app is also written in CoffeeScript.
The source files are available in the
`www-src` directory, and the compiled JavaScript files are available in the
`www` directory.

Many 3rd party libraries are used in the app; see the following files for
the list of dependencies:

* `bower-config.coffee` - browser code
* `package.json` - server and some browser code



###promises###

This application makes heavy use of Q promises to handle async calls.
Promises are explained in depth on
[Q's project page](https://github.com/kriskowal/q) and
[an introduction to promises](http://www.promisejs.org/intro/) is
available at the <http://promisejs.org> site.



hacking
================================================================================

If you want to modify the source to play with it, you'll also want to have the
`jbuild` program installed.

To install `jbuild` on Windows, use the command

    npm -g install jbuild

To install `jbuild` on Mac or Linux, use the command

    sudo npm -g install jbuild

The `jbuild` command runs tasks defined in the `jbuild.coffee` file.  The
task you will most likely use is `watch`, which you can run with the
command:

    jbuild watch

When you run this command, the application will be built from source, the server
started, and tests run.  When you subsequently edit and then save one of the
source files, the application will be re-built, the server re-started, and the
tests re-run.  For ever.  Use Ctrl-C to exit the `jbuild watch` loop.

You can run those build, server, and test tasks separately.  Run `jbuild`
with no arguments to see what tasks are available, along with a short
description of them.



license
================================================================================

Apache License, Verison 2.0

<http://www.apache.org/licenses/LICENSE-2.0.html>
