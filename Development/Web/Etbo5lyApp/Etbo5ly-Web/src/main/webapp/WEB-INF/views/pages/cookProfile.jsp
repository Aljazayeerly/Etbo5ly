<%-- 
    Document   : cookProfile
    Created on : Jun 5, 2016, 7:56:01 PM
    Author     : salma
--%>

<div ng-controller="cookProfileController as rl">
    <div class='card'>
        <header>
            <h1>Profile</h1>
        </header>
        <article>
            <!--<button ng-click="rl.getCookData($scope.Id)">click</button>-->
            <img src="{{rl.cookData.resourcesURL}}/{{rl.cookData.imageURL}}">
            <!--<img  src="http://127.0.0.1:8089/Etbo5ly-Web/resources/images/cooks/nada.jpg">-->
            <h2>{{rl.cookData.name}}</h2>

            <div class='area'>
                <h3>start from:{{rl.cookData.startWorkingHours}}</h3>
                <h4>to:{{rl.cookData.endWorkingHours}}</h4>
                <ul>
                    <li>
                        Cook Rating 
                        <span class='bar percent-70'></span>
                    </li>

                </ul>
                <h3>Categories:</h3>
                <ul ng-repeat="m in rl.cookData.menuItems" >
                    <ul ng-repeat="c in m.categories">
                        <li>
                            {{c.nameEn}}
                        </li>
                    </ul>
                </ul>

            </div>
        </article>



        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
       


        <div class="row user-infos cyruxx">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong class="panel-title">Cook's Orders</strong>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                <!--                                <strong>Cyruxx</strong><br>-->
                                <table class="table table-user-information">
                                    <tbody>

                                        <tr>
                                            <td><strong>Customer Name</strong></td>
                                            <td><strong>Customer Comment</strong></td>
                                            <td><strong>Customer Rating</strong></td>
                                        </tr>

                                        <tr ng-repeat="order in rl.review">
                                            <td ng-bind="order.customerName"></td>
                                            <td ng-bind="order.orderComment"></td>
                                            <!--<td><span class="rating" data-rating="4" disabled></span></td>-->
                                            <td><div star-rating rating="order.customerRating" read-only="true"></div></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
    </div>
</div>

<script src='http://codepen.io/assets/libs/fullpage/none.js'></script>
<link href="resources/Style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/style.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/SimpleStarRating.css" rel="stylesheet" type="text/css"/>
