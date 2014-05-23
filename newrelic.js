// Licensed under the Apache License. See footer for details.

//------------------------------------------------------------------------------
// this module is required when you do a `require("newrelic") in your code;
// the module is treated as configuration; only the `config` property needs
// to be exported.
//------------------------------------------------------------------------------

// get the application name from `cfenv`

var cfenv   = require("cfenv")
var appEnv  = cfenv.getAppEnv()
var AppName = appEnv.name

// append "-local" to the app name if running locally

if (appEnv.isLocal) AppName += "-local"

//------------------------------------------------------------------------------
// expecting all other newrelic node configuration to come from env vars
// see: https://docs.newrelic.com/docs/nodejs/configuring-nodejs-with-environment-variables
//------------------------------------------------------------------------------

exports.config = {
  app_name: [AppName]
}

//------------------------------------------------------------------------------
// Copyright IBM Corp. 2014
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//------------------------------------------------------------------------------
