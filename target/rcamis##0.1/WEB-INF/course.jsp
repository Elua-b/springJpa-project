
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="cssfile.css" type="text/css" />

    <title>Course List</title>
</head>
<body>
<div id="layout">
    <div id="banner">
        <div class="bannerlogo"></div>
        <div class="text_header">RCA Management Information System</div>
        <div class="right" style="text-align: right;">
            <c:if test="${authenticatedUser !=null}">
                <b> <a
                        href="listuser.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
                </button></a> | <img src="icons/user.png" /> <font color="#ffffff">${authenticatedUser.userRole}:
                        ${authenticatedUser.username}</font> | <a href="login.ap?page=logout"><font
                        color="#ffffff">Logout</font></a>
                </b>
            </c:if>
            <c:if test="${authenticatedUser ==null}">
                <div class="menu" align="left">
                    | <a href="login.php?">Login</a> |
                </div>
            </c:if>
        </div>
    </div>
    <div>
        <%@ include file="menu.jsp"%>
    </div>
    <div id="middle">
        <c:if test="${authenticatedUser !=null}">
            <div class="options">

                <a href="createcourse.php?page=createcourse"><button>
                    <img src="icons/user_add.png" /> New Course Registration
                </button></a>
            </div>
            <div class="search">
                <form action="listcourses.php" method="get">
                    <table>
                        <tr>
                            <td style="color: #000000;">Enter Course ID</td>
                            <td><input type="text" name="id" id="id" /></td>
                            <td><input type='submit' name="userregistrationsearch"
                                       value='search' /></td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr />
            <form action="listcourses.php?page=statusapproval" method="post">
                <fieldset>
                    <legend> Course Registration Approval Status </legend>

                    <table style="border: 0;">
                        <tr>
                            <td align="left"><input type="text" size="15"
                                                    maxlength="50" readonly="readonly" name="savedBy" id="savedBy"
                                                    hidden="hidden" value="${authenticatedUser.id}" /></td>

                            <td><select name="userRole" id="userRole">
                                <option selected="selected" value="NONE">Select Role</option>
                                <c:forEach items="${userRoles}" var="usrRole"
                                           varStatus="usrRolestatus">
                                    <option value="${usrRole}">
                                        <c:out value="${usrRole.getRoleDescription()}" />
                                    </option>
                                </c:forEach>
                            </select></td>
                            <td align="right"><input type="submit"
                                                     name="saveDataUserStatus" value="Save Status" /></td>
                        </tr>
                    </table>
                    <p>${message}</p>
                    <table>
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>Name</td>
                            <td>Code</td>
                            <td>Max Students</td>
                            <td>Min Students</td>
                            <td>Date IN</td>
                            <td>Date End</td>
                            <td>Is Cancelled </td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courses}" var="course" varStatus="usrstatus">
                        <tr>
                            <td>${course.id}</td>
                            <td>${course.name}</td>
                            <td>${course.code}</td>
                            <td>${course.maxStudent}</td>
                            <td>${course.minStudent}</td>
                            <td>${course.start}</td>
                            <td>${course.end}</td>
                            <td>${course.isCancelled()}</td>
                            <td><a href="updatecourse.php?page=updatecourse&&id=${course.id}">Update</a></td>
                            <td><a href="deletecourse.php?page=deletecourse&&id=${course.id}">Delete</a></td>
                            </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </c:if>
    </div>
<%@ include file="footer.jsp"%>