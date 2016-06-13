/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.config(function ($routeProvider, $locationProvider) {
    // alert("inside the config ");
    $routeProvider.when('cookProfile.htm?id', {
        controller: 'cookProfileController'
    });

    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});

App.controller('cookProfileController', ['$scope', 'cookProfileService', 'PageService', '$location', function ($scope, cookProfileService, PageService, $location) {
        var self = this;
        self.cookData = {};
        self.review = [];
        $scope.selectedId;
        
        if ($location.search().hasOwnProperty('id')) {
            $scope.selectedId = $location.search()['id'];

        }
        self.getCookData = function () {
//            alert("iddddd2 " + $scope.selectedId);

            cookProfileService.getCookDataForProfile($scope.selectedId)
                    .then(
                            function (d) {
                                alert("iddddd " + $scope.selectedId);
                                self.cookData = d;
                                alert("data"+JSON.stringify(self.cookData));
                                alert("resource "+JSON.stringify(self.cookData.resourcesURL));
                                alert("url "+JSON.stringify(self.cookData.imageURL));
                                alert("working hours "+JSON.stringify(self.cookData.startWorkingHours));
                            },
                            function (errResponse) {
//                                alert("error in controller");
                                console.error('Error while fetching ok data in controller');
                            }
                    );
        };


        self.getReview = function ()
        {
//            alert("iddddd rev " + $scope.selectedId);
            cookProfileService.getAllReviews($scope.selectedId)
                    .then(
                            function (d) {
                                alert("iddddd rev " + $scope.selectedId);
                                self.review = d;
                                alert(JSON.stringify(self.review));
                            },
                            function (errResponse) {
                                alert("error rev  in controller");
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

    $scope.click1 = function (param) {
        console.log('Click(' + param + ')');
    };

    $scope.mouseHover1 = function (param) {
        console.log('mouseHover(' + param + ')');
        $scope.hoverRating1 = param;
    };

    $scope.mouseLeave1 = function (param) {
        console.log('mouseLeave(' + param + ')');
        $scope.hoverRating1 = param + '*';
    };

    $scope.click2 = function (param) {
        console.log('Click');
    };

    $scope.mouseHover2 = function (param) {
        console.log('mouseHover(' + param + ')');
        $scope.hoverRating1 = param;
    };

    $scope.mouseLeave2 = function (param) {
        console.log('mouseLeave(' + param + ')');
        $scope.hoverRating2 = param + '*';
    };

    $scope.click3 = function (param) {
        console.log('Click');
    };

    $scope.mouseHover3 = function (param) {
        console.log('mouseHover(' + param + ')');
        $scope.hoverRating3 = param;
    };

    $scope.mouseLeave3 = function (param) {
        console.log('mouseLeave(' + param + ')');
        $scope.hoverRating3 = param + '*';
    };
    
     }]);
//       
// App.directive('starRating2', function () {
//    return {
//        scope: {
//            rating: '=',
//            maxRating: '@',
//            readOnly: '@',
//            click: "&",
//            mouseHover: "&",
//            mouseLeave: "&"
//        },
//        restrict: 'EA',
//        template:
//            "<div style='display: inline-block; margin: 0px; padding: 0px; cursor:pointer;' ng-repeat='idx in maxRatings track by $index'> \
//                    <img ng-src='{{((hoverValue + _rating) <= $index) && \"http://www.codeproject.com/script/ratings/images/star-empty-lg.png\" || \"http://www.codeproject.com/script/ratings/images/star-fill-lg.png\"}}' \
//                    ng-Click='isolatedClick($index + 1)' \
//                    ng-mouseenter='isolatedMouseHover($index + 1)' \
//                    ng-mouseleave='isolatedMouseLeave($index + 1)'></img> \
//            </div>",
//        compile: function (element, attrs) {
//            if (!attrs.maxRating || (Number(attrs.maxRating) <= 0)) {
//                attrs.maxRating = '5';
//            };
//        },
//        controller: function ($scope, $element, $attrs) {
//            $scope.maxRatings = [];
//
//            for (var i = 1; i <= $scope.maxRating; i++) {
//                $scope.maxRatings.push({});
//            };
//
//            $scope._rating = $scope.rating;
//			
//			$scope.isolatedClick = function (param) {
//				if ($scope.readOnly == 'true') return;
//
//				$scope.rating = $scope._rating = param;
//				$scope.hoverValue = 0;
//				$scope.click({
//					param: param
//				});
//			};
//
//			$scope.isolatedMouseHover = function (param) {
//				if ($scope.readOnly == 'true') return;
//
//				$scope._rating = 0;
//				$scope.hoverValue = param;
//				$scope.mouseHover({
//					param: param
//				});
//			};
//
//			$scope.isolatedMouseLeave = function (param) {
//				if ($scope.readOnly == 'true') return;
//
//				$scope._rating = $scope.rating;
//				$scope.hoverValue = 0;
//				$scope.mouseLeave({
//					param: param
//				});
//			};
//        }
//    };
//      
//    });