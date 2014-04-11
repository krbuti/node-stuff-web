# Licensed under the Apache License. See footer for details.

fs = require "fs"

#-------------------------------------------------------------------------------
URL  = require "url"
http = require "http"

Q       = require "q"
_       = require "underscore"
express = require "express"
cfEnv   = require "cf-env"

utils   = require "./utils"

# get core data from Cloud Foundry environment

cfCore = cfEnv.getCore
    name: utils.PROGRAM

#-------------------------------------------------------------------------------
# start the server, returning a promise of the server;
# the promise is resolved when the server starts
#-------------------------------------------------------------------------------
exports.start = (options) ->
    utils.verbose true if options.verbose

    # sometimes you need to dump your ENV vars
    # utils.vlog "process.env #{utils.JL process.env}"

    server = new Server options
    server.start()

#-------------------------------------------------------------------------------
# class that manages the server
#-------------------------------------------------------------------------------
class Server

    #---------------------------------------------------------------------------
    constructor: (options={}) ->
        options.port    ?= cfCore.port
        options.verbose ?= false

        {@port, @verbose, @customerDB} = options

    #---------------------------------------------------------------------------
    # start the server, returning a promise to itself when started
    #---------------------------------------------------------------------------
    start: ->
        deferred = Q.defer()

        app = express()

        # serve up our html/css/js for the browser
        app.use express.static "www"

        # start the server, resolving the promise when started
        utils.log "server starting: #{cfCore.url}"
        app.listen @port, cfCore.bind, =>
            utils.log "server started"

            deferred.resolve @

        return deferred.promise

#-------------------------------------------------------------------------------
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
#-------------------------------------------------------------------------------
