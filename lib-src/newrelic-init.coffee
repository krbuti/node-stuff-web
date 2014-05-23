# Licensed under the Apache License. See footer for details.

utils = require "./utils"

#-------------------------------------------------------------------------------
initNewRelic = () ->

  unless process.env.NEW_RELIC_LICENSE_KEY?
    utils.log "newrelic env var NEW_RELIC_LICENSE_KEY not set; no newrelic for you!"
    return

  try
    newrelic = require "newrelic"
  catch e
    utils.log "newrelic error during initialization; ignoring; error: #{e}"
    return

  try
    dumpNewRelicInfo(newrelic)
  catch e
    utils.log "newrelic error during dumping info; ignoring; error: #{e}"
    return

#-------------------------------------------------------------------------------
dumpNewRelicInfo = (newrelic) ->
  config = newrelic.agent.config

  utils.log "newrelic configured"
  utils.log "newrelic version:  #{JSON.stringify config.version}"
  utils.log "newrelic app name: #{JSON.stringify config.app_name}"

#-------------------------------------------------------------------------------
initNewRelic()

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
