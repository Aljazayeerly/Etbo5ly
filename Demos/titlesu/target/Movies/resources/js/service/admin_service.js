'use strict';

App.factory('AdminService', ['$http', '$q', function($http, $q){

	return {
		
			fetchAllTitles: function() {
					return $http.get('../../spring/title')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching titles');
										return $q.reject(errResponse);
									}
							);
			},
		    
		    createTitle: function(title){
					return $http.post('../../spring/admin/create/title', title)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while creating title');
										return $q.reject(errResponse);
									}
							);
		    },
		    
		    updateTitle: function(title, id){
					return $http.post('../../spring/admin/title/update/'+id, title)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating title');
										return $q.reject(errResponse);
									}
							);
			},
		    
			deleteTitle: function(id){
					return $http.post('../../spring/admin/title/delete/'+id)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while deleting title');
										return $q.reject(errResponse);
									}
							);
			}
		
	};

}]);
