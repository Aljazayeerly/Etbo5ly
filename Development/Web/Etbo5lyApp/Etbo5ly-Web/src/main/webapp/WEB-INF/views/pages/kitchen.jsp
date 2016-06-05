<%-- 
    Document   : kitchen
    Created on : May 21, 2016, 12:37:35 PM
    Author     : salma
--%>


<div ng-controller="MenuController as ctrl">
    <div class="col-md-3" style="width: 20%">
        <!-- *** MENUS AND FILTERS ***
    _________________________________________________________ -->
        <div class="panel panel-default sidebar-menu">

            <div class="panel-heading">
                <h3 class="panel-title"><font color="#f0ad4e"><b>Cooks</b></font></h3>
            </div>
            <!--//ng-controller="MenuController as ctrl"-->
            <div  class="panel-body">

                <ul ng-repeat="i in ctrl.cooks" class="nav nav-pills nav-stacked category-menu">
                    <li>
                        <a href="cook.htm" ng-bind="i.name + '&rsquo;' + 's Menu'"></a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="panel panel-default sidebar-menu">

            <div class="panel-heading">
                <h3 class="panel-title"><font color="#f0ad4e"><b>Categories</b></font></h3>
            </div>
            <!--ng-controller="MenuController as ctrl"-->
            <div  class="panel-body">

                <form>
                    <div class="form-group">
                        <div ng-repeat="c in ctrl.categories"class="checkbox">
                            <label>
                                <input type="checkbox" ng-model="$scope.checked" ng-change="ctrl.isSelected(c.categoryId, $scope.checked, $index)">{{c.nameEn}}

                            </label>
                        </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary" ng-click="ctrl.getSelected()"> Apply</button>
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
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Nasr City
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 6th October
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Maadi
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Sheraton
                            </label>
                        </div>

                    </div>

                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>

                </form>

            </div>
        </div>
    </div>




    <div class="col-md-6">
        <div>
            <section>
                <div >

                    <!--de div bta3t kol menu ites--> 
                    <div ng-show="showAllMeals" ng-repeat="i in ctrl.items" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px ;" ng-bind="i.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="i.cookName"></label>
                                <br>
                                <div >
                                    <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="left:20px; width: 160px">

                                    <label style="color: gray; font-size: 13px" ng-bind="i.cookId"></label>

                                </div>

                                <div>
                                    <label style="color: black;  font-size: 10px" ng-bind="i.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="i.price + ' L.E'"></label>
                            </div>
                            <div>
                                <button ng-click="addItem(i.itemId)">Add To Cart</button>
                            </div>

                        </div>
                    </div> 


                    <!--
                                        de div bta3t checked categories
                    -->                    

                    <div ng-show="showCheckedMeal"   ng-repeat="k in ctrl.checkedItems" style="margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                        <div>

                            <div>
                                <label style="color: #E18728;font-size: 15px" ng-bind="k.nameEn"></label>
                                <br>
                                <label style="color: gray;font-size: 13px" ng-bind="k.cookName"></label>
                                <br>
                                <div >
                                    <img src="{{i.resourcesURL}}/{{i.imageUrl}}" style="left:20px; width: 160px">

                                    <label style="color: gray; font-size: 13px" ng-bind="k.cookId"></label>

                                </div>

                                <div>
                                    <label style="color: black;  font-size: 10px" ng-bind="k.descriptionEn"></label>
                                </div>
                                <label style="color: #E18728;  font-size: 13px" ng-bind="k.price + ' L.E'"></label>
                            </div>
                            <div>
                                <button ng-click="addItem(k.itemId)">Add To Cart</button>
                            </div>
                        </div>
                    </div>

                    <!--de div bta3t search--> 

                    <!--                    <div ng-repeat="m in ctrl.items" style="left: 390px;width: 600px;height: 200px;margin: 2em 0;border: 3px solid #E18728;border-radius: 10px;background-color: white;padding-left: 55px;position: relative;">
                                                                    <div>
                                                                        <div style="margin-left: 340px;">
                                                                            <label style="color: #E18728; margin-left: -220px; font-size: 15px" ng-bind="m.nameEn"></label>
                                                                            <br>
                                                                            <label style="color: gray; margin-left: -220px; font-size: 13px" ng-bind="m.cookName"></label>
                                                                            <div>
                                                                                <label style="color: black; margin-left: -220px; font-size: 10px" ng-bind="m.descriptionEn"></label>
                                                                            </div>
                                                                            <label style="color: #E18728; margin-left: -220px; font-size: 13px" ng-bind="m.price + ' L.E'"></label>
                                                                        </div>
                                                                        <div style="margin-left: 340px; margin-top: -110px;">
                                                                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/652/ada-small.jpeg" style="float: left; margin-left: -380px; margin-top: -8px;">
                                                                        </div>
                                                                    </div>
                                            {{ctrl.searchMeals.length}}
                                        </div>-->
                </div>
            </section>
        </div>
    </div>



    <div class="col-md-3 box" style="top:50px" style="margin-left: 10%">
        <div class="box-header">
            <h3>Your Cart</h3>
        </div>
        <table id="cart" class="table table-hover table-condensed" >
            <thead>    
                <tr>   
                    <th style="width:50%">Product</th>
                    <th style="width:10%">Price</th>
                    <th style="width:8%">Quantity</th>
                    <th style="width:22%" class="text-center">Subtotal</th>
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
                        <input type="number" min="1" max="30" class="form-control text-center" value="1" value="i.quantity" ng-model="i.quantity">
                    </td>
                    <td data-th="Subtotal" class="text-center"><p ng-bind="i.totalPrice"</p></td>
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
                    <td colspan="2" class="hidden-xs"></td>
                    <td class="hidden-xs text-center"><strong> <label id="total"></label></strong></td>
                    <!--<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>-->
                    <td><button type="submit" class="btn btn-success btn-block"  ng-click="checkOut()" >CheckOut</button></td>
                </tr>
            </tfoot>
        </table>
    </div>



</div>