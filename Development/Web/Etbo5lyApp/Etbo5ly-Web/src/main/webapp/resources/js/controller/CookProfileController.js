/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

App.controller('cookProfileController', ['$scope', 'cookProfileService', function ($scope, cookProfileService) {
        var self = this;

        self.cookData = {};
        self.getCookData = function (id) {
//            alert(id);
            cookProfileService.getCookDataForProfile(id)
                    .then(
                            function (d) {
//                                alert("iddddd " + id);
                                self.cookData = d;
//                                alert("name "+JSON.stringify(self.cookData.menuItems[0].categories[0].nameEn));
//                                alert("image "+self.cookData.resourcesURL);
//                                alert(self.cookData.imageURL);
                            },
                            function (errResponse) {
//                                alert("error in controller");
                                console.error('Error while fetching ok data in controller');
                            }
                    );
        }
        ;
    }]);