/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.config(function($routeProvider, $locationProvider) {
    $routeProvider.when('cookProfile.htm?id', {
        controller: 'cookProfileController'
    });

    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});

App.controller('cookProfileController', ['$scope', 'cookProfileService', 'PageService', '$location', function($scope, cookProfileService, PageService, $location) {
        var self = this;
        self.cookData = {};
        self.review = [];
        $scope.selectedId;

        if ($location.search().hasOwnProperty('id')) {
            $scope.selectedId = $location.search()['id'];

        }
        self.getCookData = function() {

            cookProfileService.getCookDataForProfile($scope.selectedId)
                    .then(
                            function(d) {

                                self.cookData = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching ok data in controller');
                            }
                    );
        };


        self.getReview = function()
        {
            cookProfileService.getAllReviews($scope.selectedId)
                    .then(
                            function(d) {

                                self.review = d;
                            },
                            function(errResponse) {
                                console.error('Error while fetching ok data in controller');
                            }
                    );
        };


        self.getCookData();
        self.getReview();



        $scope.starRating1 = 4;
        $scope.starRating2 = 5;
        $scope.starRating3 = 2;
        $scope.hoverRating1 = $scope.hoverRating2 = $scope.hoverRating3 = 0;

        $scope.click1 = function(param) {
            console.log('Click(' + param + ')');
        };

        $scope.mouseHover1 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating1 = param;
        };

        $scope.mouseLeave1 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating1 = param + '*';
        };

        $scope.click2 = function(param) {
            console.log('Click');
        };

        $scope.mouseHover2 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating1 = param;
        };

        $scope.mouseLeave2 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating2 = param + '*';
        };

        $scope.click3 = function(param) {
            console.log('Click');
        };

        $scope.mouseHover3 = function(param) {
            console.log('mouseHover(' + param + ')');
            $scope.hoverRating3 = param;
        };

        $scope.mouseLeave3 = function(param) {
            console.log('mouseLeave(' + param + ')');
            $scope.hoverRating3 = param + '*';
        };



    }]);


