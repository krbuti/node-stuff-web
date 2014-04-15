# Licensed under the Apache License. See footer for details.

titlePrefix = "node stuff @ bluemix"

AngTangle.controller ($scope,  $document, data) ->

  domReady = false

  $ ->
    domReady = true

  $scope.pkg = data.package

  subTitle = ""

  $scope.getSubtitle = ->
    return "" if subTitle is ""
    return ": #{subTitle}"

  $scope.setSubtitle = (subtitle) ->
    subTitle = subtitle

    title = titlePrefix
    title = "#{title}: #{subtitle}" unless subtitle is ""

    $document[0].title = title

  $scope.$on "$routeChangeSuccess", (next, current) ->
    $(".navbar-collapse").collapse("hide") if domReady

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
