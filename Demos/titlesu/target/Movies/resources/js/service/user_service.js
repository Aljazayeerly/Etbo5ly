'use strict';

App.factory('UserService', ['$http', '$q', function($http, $q){

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
                        signup: function(user) {
					return $http.post('../../spring/user/',user)
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
                        comment: function(user,title,comment) {
					return $http.post('../../spring/rating/'+user+'/'+title+'?comment='+comment)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while making comment');
										return $q.reject(errResponse);
									}
							);
			},
                        rate: function(user,title,rate) {
					return $http.post('../../spring/rating/'+user+'/'+title+'?rate='+rate)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while rating');
										return $q.reject(errResponse);
									}
							);
			}
		
		    
		  
		    
			
		
	};

}]);
