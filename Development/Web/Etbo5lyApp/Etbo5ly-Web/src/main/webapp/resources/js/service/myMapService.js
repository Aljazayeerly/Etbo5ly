/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
//var App = angular.module('aa', ['ngMaterial']);
App.factory('MapService',['$http', '$q', function($http, $q){
        
        	return {
			getnearbyCooks: function(latitude,longitude) {
					return $http.get("/Etbo5ly-Web/rest/cook/nearbyCooks?long=" + longitude + "&latit=" + latitude+ "")
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching near by cooks');
										return $q.reject(errResponse);
									}
							);
			}	
	};
        
        
        
        
        
        
}]);