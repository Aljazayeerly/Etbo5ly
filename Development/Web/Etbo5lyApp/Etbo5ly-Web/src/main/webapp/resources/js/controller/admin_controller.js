'use strict';

App.controller('AdminController', ['$scope', 'AdminService', function($scope, AdminService) {
        var self = this;
        self.title = {};
        self.titles = [];

        self.fetchAllTitles = function() {
            AdminService.fetchAllTitles()
                    .then(
                            function(d) {
                                self.titles = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };

        self.createTitle = function(title) {
            AdminService.createTitle(title)
                    .then(
                            self.fetchAllTitles,
                            function(errResponse) {
                                console.error('Error while creating Titles.');
                            }
                    );
        };

        self.updateTitle = function(title, id){
         AdminService.updateTitle(title, id)
         .then(
         self.fetchAllTitles, 
         function(errResponse){
         console.error('Error while updating Title.');
         }	
         );
         };

        self.deleteTitle = function(id) {
            AdminService.deleteTitle(id)
                    .then(
                            self.fetchAllTitles,
                            function(errResponse) {
                                console.error('Error while deleting Title.');
                            }
                    );
        };

        self.fetchAllTitles();

        self.submit = function() {
            if (self.title.id == null) {
                console.log('Saving New Title', self.title);
                self.createTitle(self.title);
            } else {
                self.updateTitle(self.title, self.title.id);
                console.log('title updated with id ', self.title.id);
            }
            self.reset();
        };

        self.edit = function(id){
         console.log('id to be edited', id);
         for(var i = 0; i < self.titles.length; i++){
         if(self.titles[i].id == id) {
         self.title = angular.copy(self.titles[i]);
         break;
         }
         }
         };

        self.remove = function(id) {
            console.log('id to be deleted', id);

            
            if(self.title.id === id) {
                 self.reset();
              }
              self.deleteTitle(id);

        };


        self.reset = function() {
            self.title = {};
            $scope.myForm.$setPristine(); //reset Form
        };

    }]);
