/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

App.service('cookService', function() {
  var cookID = {};

  var setID = function(id) {
      cookID=id;
  };

  var getID = function(){
      return cookID;
  };

  return {
    setID: setID,
    getID: getID
    
  };

});