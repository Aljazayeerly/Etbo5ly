<%-- 
    Document   : uploadDocuments
    Created on : Jun 11, 2016, 12:10:15 PM
    Author     : Nada
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="generic-container" ng-controller="JoinUsController">
    <div>
        <h3 class="text-muted"> please upload your Birth certificate and medical documents and your identity card</h3>
    </div>

    <div>
        <p style="color: maroon">${invalid}</p>
        <p style="color:green">${success}</p>
        <p style="color: maroon">${invalidImage}</p>
        <p style="color: maroon">${notImage}</p>
        <p style="color:green">${imageDone}</p>
    </div>
    <br>
    <br>
    <!--    <div class="panel panel-default">
             Default panel contents 
            <div class="panel-heading"><span class="lead">List of Documents </span></div>
            <div class="tablecontainer">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>File Name</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th width="100"></th>
                            <th width="100"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:out value="2"/>
                    <c:forEach items="${documents}" var="doc" >
                        <tr>
    ${documents.size()}
    ${doc.documentType.type}
    ${doc.description}
<cout value="${doc}"></cout>
<cout value="${doc} + test"></cout>

<td>${counter.index + 1}</td>
<td></td>
<td>${doc.documentType.type}</td>
<td>${doc.description}</td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>-->
    <div class="panel panel-default">

        <div class="panel-heading"><span class="lead">Upload New Document</span></div>
        <div class="uploadcontainer">
            <br>
            <form:form method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="file">Upload a document</label>
                        <div class="col-md-7">
                            <form:input type="file" path="file" id="file" class="form-control input-sm" required="true"/>
                            <div class="has-error">
                                <form:errors path="file" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="description">Description</label>
                        <div class="col-md-7">
                            <form:input type="text" path="description" id="description" class="form-control input-sm" required="true"/>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="file"><fmt:message key="uploadProfile"/></label>
                        <div class="col-md-7">
                            <form:input type="file" path="image" id="file" class="form-control input-sm" required="true"/>
                            <div class="has-error">
                                <form:errors path="image" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <!--              <div class="row">-->
                <div class="form-actions  custom-width" >
                    <input type="submit" value="Upload" class="btn btn-primary btn-sm" style="background-color: #f0ad4e;border-color: #f0ad4e;"/>
                    <input type="button" value="Done" class="btn btn-primary btn-sm" style="background-color: #f0ad4e;border-color: #f0ad4e;" ng-click="goToLogin()"/>

                </div>
                <!--</div>-->

            </form:form>
        </div>
    </div>
</div>