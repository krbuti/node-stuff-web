<!-- Licensed under the Apache License. See footer for details. -->

<!-- ======================================================================= -->

### getting help

You can post questions on the BlueMix Developers Community forum, here:
<https://www.ibmdw.net/answers/?community=bluemix>

If your question is
specific to node.js, please add a tag (below the editor) of "node.js".

<!-- ======================================================================= -->

### installing pre-reqs

To use node.js on BlueMix, you will need to have done the following items:

* registered for BlueMix

  To get access to BlueMix, you'll have to sign up with an IBM id.  If you don't
  already have an IBM id, you will be prompted to create one during registration.

  Start here - <https://ace.ng.bluemix.net/> - click the "LOGIN" link at the top.
  You can create an IBM id on this page, or if you already have one, just use
  the "Sign in" form.

  Creating an IBM id should take just a few minutes.

* installed node.js on your development machine

  You can install the community build of node.js here:
  <http://nodejs.org/download/>

  You can alternatively install the IBM SDK for Node.js, here:
  <http://www.ibm.com/developerworks/web/nodesdk/>

* installed the Cloud Foundry `cf` command-line tool

  The `cf` command-line tool is used to manage your applications running
  on BlueMix.  Information about installing and using `cf` is available here:
  <http://docs.cloudfoundry.org/devguide/installcf/>

<!-- ======================================================================= -->

### hello world for node.js on BlueMix

<https://hub.jazz.net/project/pmuellr/bluemix-hello-node/overview>

This is a small project that implements a web server that you can deploy on
BlueMix; it’s about as small as you can get, and so, of course, doesn’t do much.
It displays “Hello World” on every single one of it’s pages.

So, not useful by itself, but it's heavily documented, so you
can at least see the nuts and bolts of deploying a node.js web server on BlueMix.

The README.md file, which is displayed on that overview page, contains the
directions on how to build and deploy this application.

<!-- ======================================================================= -->

### using the `cf-env` package to parse VCAP_SERVICES

<https://www.ibmdw.net/bluemix/2014/03/12/cf-env-package-node-js/>

Blog post describing the `cf-env` package
[available on npm](https://www.npmjs.org/package/cf-env),
which will handle your `VCAP_*` environment variable parsing duties.

<!-- ======================================================================= -->

### errors during `npm rebuild` for native modules

We are seeing errors building some native modules during staging.

If you see the following error in your console during a `cf push`:

    npm ERR! <some module>@<some version> install: `node-gyp rebuild`

you can work around this by using an older version of node 0.10.x.  You can
specify a version with the `engines` property in your `package.json` file, as
follows:

    {
        "name":             "my-app-name",
        "engines" :         { "node" : "=0.10.15" },
        "dependencies":
        ...
    }

Specifically, this problem can occur with node versions > 0.10.15, and is
expected to be resoved in node version 0.10.27.

Also see the
[same issue on Pivotal's support page](http://support.run.pivotal.io/entries/45576443-NodeJS-App-Push-Failing).

<!-- ======================================================================= -->

### using an alternate node buildpack

By default, BlueMix will use the [IBM SDK for node](/ibm-node) as the node.js
runtime for the application running in the cloud.  If you'd like to use an
alternate buildpack, to use an alternate runtime, we suggest you use the
open source Cloud Foundry node buildpack, at:
<https://github.com/cloudfoundry/heroku-buildpack-nodejs>

To use this buildpack, you can invoke push your application with the `-b` option:

    cf push -b https://github.com/cloudfoundry/heroku-buildpack-nodejs

or
[add a `buildpack` entry to your manifest.yml file](http://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html).

<!--
#===============================================================================
# Copyright IBM Corp. 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#===============================================================================
-->