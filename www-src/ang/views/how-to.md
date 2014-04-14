<!-- Licensed under the Apache License. See footer for details. -->

<!-- ======================================================================= -->

### Getting help

You can post questions on the BlueMix Developers Community forum, here:
<https://www.ibmdw.net/answers/?community=bluemix>

If your question is
specific to node.js, please add a tag (below the editor) of "node.js".

<!-- ======================================================================= -->

### Installing pre-reqs

To use node.js on BlueMix, you will need to have done the following items:

* register for BlueMix

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

* install the Cloud Foundry `cf` command-line tool

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