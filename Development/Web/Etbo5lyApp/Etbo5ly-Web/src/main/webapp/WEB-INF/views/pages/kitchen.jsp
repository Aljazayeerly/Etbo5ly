<%-- 
    Document   : kitchen
    Created on : May 21, 2016, 12:37:35 PM
    Author     : salma
--%>


<div ng-controller="MenuController as ctrl" >
    <div class="col-md-3" style="width: 20%">
        <!-- *** MENUS AND FILTERS ***
    _________________________________________________________ -->
        <div class="panel panel-default sidebar-menu">


            <div class="panel-heading">
                <h3 class="panel-title"><font color="#f0ad4e"><b>Cooks</b></font></h3>
            </div>
            <div  class="panel-body">

                <ul ng-repeat="i in cooks" class="nav nav-pills nav-stacked category-menu">
                    <li>
                        <a ng-bind="i.name + '&rsquo;' + 's Profile'" ng-click="callToSetCookID(i.id)"></a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="panel panel-default sidebar-menu">

            <div class="panel-heading">
                <h3 class="panel-title"><font color="#f0ad4e"><b>Categories</b></font></h3>
            </div>
            <div  class="panel-body">

                <form>
                    <div class="form-group">
                        <div ng-repeat="c in ctrl.categories"class="checkbox">
                            <label>
                                <input type="checkbox" ng-model="$scope.checked" ng-change="ctrl.isSelected(c.categoryId, $scope.checked, $index)">{{c.nameEn}}

                            </label>
                        </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary" style="background-color: #f0ad4e;border-color:#f0ad4e; " ng-click="ctrl.getSelected()"> Apply</button>
                </form>

            </div>
        </div>

        <div class="panel panel-default sidebar-menu">

            <div class="panel-heading">
                <h3 class="panel-title"><font color="#f0ad4e"><b>Locations</b></font></h3>
            </div>

            <div class="panel-body">

                <form>
                    <div class="form-group">
                        <div ng-repeat="lo in ctrl.locations" class="checkbox">
                            <label>
                                <input type="checkbox" ng-model="$scope.checked2" ng-change="ctrl.isSelectedLocation(lo.regionId, $scope.checked2, $index)"> {{lo.regionName}}
                            </label>
                        </div>
                    </div>

                    <button class="btn btn-default btn-sm btn-primary" style="background-color: #f0ad4e;border-color:#f0ad4e;" ng-click="ctrl.getSelectedLocation()"> Apply</button>

                </form>

            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div>
            <section>
                <div >

                    <!--de div bta3t kol menu ites--> 
                    <div ng-show="showAllMeals" ng-repeat="i in ctrl.items" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 40px;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px ;" ng-bind="i.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="i.cookName"></label>
                                <br>
                            </div>
                            <div style="height: 130px;width: 130px;">
                                <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="left:20px; width: 100%;height: 100%;">

                            </div>
                            <div style="margin-left: 150px;  padding-top: -100px; margin-top: -95px;">
                                <label style="color: #554230;  font-size: 15px" ng-bind="i.descriptionEn"></label>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="i.price + ' L.E'"></label>
                            </div>
                            <div style="margin-left: 510px;">
                                <button class="btn btn-default btn-sm btn-primary" style="background-color: #f0ad4e;border-color: #f0ad4e;"ng-click="addItem(i.itemId)">Add To Cart</button>
                            </div>
                        </div>
                    </div> 


                    <!--
                                        de div bta3t checked categories
                    -->                    

                    <div ng-show="showCheckedMeal"   ng-repeat="j in ctrl.checkedItems" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px" ng-bind="j.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="j.cookName"></label>
                                <br>
                                <div style="height: 130px;width: 130px;" >
                                    <img src="{{j.resourcesURL}}/{{j.imageUrl}}" style="left:20px; width: 100%;height: 100%">
                                </div>

                                <div>
                                    <label style="color: black;  font-size: 10px" ng-bind="j.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="j.price + ' L.E'"></label>
                            </div>
                            <div>
                                <button class="btn btn-default btn-sm btn-primary" style="background-color: #f0ad4e;border-color:#f0ad4e; "ng-click="addItem(j.itemId)">Add To Cart</button>
                            </div>
                        </div>
                    </div>

                    <!--de div bta3t search--> 



                    <div ng-show="showSearchMeals"   ng-repeat="k in ctrl.searchMeals" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px" ng-bind="k.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="k.cookName"></label>
                                <br>
                                <div style="height: 130px;width: 130px;" >
                                    <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="left:20px; width: 100%;height: 100%">

                                    <!--<label style="color: gray; font-size: 13px" ng-bind="k.cookId"></label>-->

                                </div>

                                <div>
                                    <label style="color: black;  font-size: 10px" ng-bind="k.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="k.price + ' L.E'"></label>
                            </div>
                            <div>
                                <button class="btn btn-default btn-sm btn-primary"  style="background-color: #f0ad4e;border-color:#f0ad4e;" ng-click="addItem(k.itemId)">Add To Cart</button>
                            </div>
                        </div>
                    </div>





                    <!--de div bta3t location--> 
                    <div ng-show="showLocationMeals" ng-repeat="address in ctrl.checkedAddress" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px ;" ng-bind="address.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="address.cookName"></label>
                                <br>
                                <div style="height: 130px;width: 130px;" >
                                    <img src="{{address.resourcesURL}}/{{address.imageUrl}}" style="left:20px; width: 100%;height: 100%">

                                    <!--                                    <label style="color: gray; font-size: 13px" ng-bind="address.cookId"></label>-->

                                </div>

                                <div>
                                    <label style="color: black;  font-size: 10px" ng-bind="address.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="address.price + ' L.E'"></label>
                            </div>
                            <div>
                                <button class="btn btn-default btn-sm btn-primary" style="background-color: #f0ad4e;border-color:#f0ad4e;" ng-click="addItem(address.itemId)">Add To Cart</button>
                            </div>

                        </div>
                    </div> 


                </div>
            </section>
        </div>
    </div>



    <div class="col-md-3 box" style="top:50px;margin-left: 3%;">
        <div class="box-header">
            <h3 style="color: #f0ad4e">Your Cart</h3>
        </div>
        <div  ng-show="emptyCart" ng-hide="false">
            <h2>Empty Cart</h2>
        </div>
        <div  ng-show="cartHasItems"ng-hide="true">
            <table id="cart" class="table table-hover table-condensed" >
                <thead>    
                    <tr>   
                        <th style="width:50%">Product</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:10%">Subtotal</th>
                        <th style="width:10%"></th>
                    </tr>   
                </thead>        
                <tbody>   
                    <tr ng-repeat="i in ctrl.addedItems">   
                        <td data-th="Product">
                            <!--<div class="row">-->
                            <div class="col-sm-10">
                                <label style="color: #E18728; font-size: 15px" ng-bind="i.menuItemsNameEn"></label>
                            </div>

                        </td>
                        <td data-th="Price"><label ng-bind="i.menuItemsPrice"></label></td>
                        <td data-th="Quantity">
                            <input type="number" min="1" max="30" class="form-control text-center" ng-click="IncDecValue(i.menuItemsItemId)" value="1" ng-model="i.quantity">
                        </td>
                        <td>
                            <label ng-bind="i.price"></label>
                        </td>
                        <td class="actions" data-th="">

                            <button class="btn btn-danger btn-sm" ng-click="deleteItem(i.menuItemsItemId)"><i class="fa fa-trash-o"></i></button>								
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="visible-xs">
                        <td class="text-center"><strong><label id="totalPrices" value="ooo"></label></strong></td>

                    </tr>
                    <tr>
                        <td colspan="2" class="hidden-xs">Total</td>
                        <td class="hidden-xs text-center"><strong> <label id="total"></label></strong></td>
                        <td><button type="submit" class="btn btn-success btn-block"  ng-click="checkOut()" >CheckOut</button></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <!--</div>-->

</div>




