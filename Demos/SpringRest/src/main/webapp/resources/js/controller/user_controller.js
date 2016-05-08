'use strict';

App.controller('UserController', ['$scope', '$filter', 'UserService', function($scope, $filter, UserService) {
        var self = this;
        self.title = {};
        self.titles = [];
        self.currentPage = 1;
        self.pageSize = 10;
        self.userComment = "";
        self.rateValue = "";
        self.user = {};
        self.searchString = "";
        self.titles = [];
        self.searchTitles = [];

        self.fetchAllTitles = function() {
            UserService.fetchAllTitles()
                    .then(
                            function(d) {
                                self.titles = d;
                                self.searchTitles = angular.copy(self.titles);
                            },
                            function(errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };


        self.order = function(order) {
            if (order == '0') {
                self.searchTitles = $filter('orderBy')(self.searchTitles, 'year');
            } else if (order == '1') {
                self.searchTitles = $filter('orderBy')(self.searchTitles, 'imdbvotes');
            } else if (order == '2') {

                self.searchTitles = $filter('orderBy')(self.searchTitles, 'imdbrating');

            }
        };

        self.filterByName = function() {


            self.searchTitles = $filter('filter')(self.titles, {title: self.searchString}, undefined)
            if (self.searchString == "") {
                self.titles = self.fetchAllTitles();
            }
            self.title={};
        };



        self.fetchAllTitles();

        /*self.submit = function() {
         alert("succeed");
         if (self.title.id == null) {
         console.log('Saving New Title', self.title);
         self.createTitle(self.title);
         } else {
         self.updateTitle(self.title, self.title.id);
         console.log('title updated with id ', self.title.id);
         }
         self.reset();
         };*/

        self.showTitle = function(id) {
            console.log('id to be edited', id);
            for (var i = 0; i < self.titles.length; i++) {
                if (self.titles[i].id == id) {
                    self.title = angular.copy(self.titles[i]);
                    break;
                }
            }

        };

        self.comment = function(user, title, comment) {
            console.log('commenting ', comment);
            if (comment != "") {
                UserService.comment(user, title, comment).then(
                        self.fetchAllTitles,
                        function(errResponse) {
                            console.error('Error while deleting Title.');
                        }
                );
                for (var i = 0; i < self.titles.length; i++) {
                    if (self.titles[i].id == title) {
                        self.title = angular.copy(self.titles[i]);
                        break;
                    }
                }
                self.userComment = "";
            }

        };

        self.signup = function() {
            console.log('user signing up', self.user.email);

            UserService.signup(self.user).then(
                    function(Response) {
                        console.log('User created: ' + Response);
                    }
            );
            self.reset();
            window.location = "Signin.html";


        };



        self.rate = function(userId, titleId) {
            console.log("rate value changed to " + self.rateValue);
            UserService.rate(userId, titleId, self.rateValue);
        };

        self.reset = function() {
            self.user = {};
            $scope.myForm.$setPristine(); //reset Form
        };




    }]);
