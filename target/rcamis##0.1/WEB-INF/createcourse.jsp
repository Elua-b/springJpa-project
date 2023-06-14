<?xml version="1.0" encoding="UTF-8" ?>
<html>
<head>
    <title>Create Course</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<jsp:include page="headeradmin.jsp">
    <jsp:param
            name="title" value="Create Course"/>
</jsp:include>
<div class="bg-white w-full  mt-20 p-2 mt-4 ">

    <h2 class="text-center text-xl font-semibold text-blue-500">
        <b>Enter Course Details</b>
    </h2>
    <c:if test="${message != null}">
        <fieldset>
            <h3>
                <span style="color: red"class="flex items-center justify-center " > ${message}</span>
            </h3>
        </fieldset>
    </c:if>
    <div class="flex items-center justify-center w-full">
        <form action="createcourse.php?page=createcourse" method="post" class="w-2/3 mx-auto h-3/4 bg-white shadow-md shadow-indigo-200 rounded" >
            <div class="flex flex-col space-y-8 p-4 w-2/3 mx-auto" >
                <input type="text" placeholder="Course name" size="25" maxlength="50" name="coursename" id="coursename" class="block border rounded w-full outline-none p-2" />
                <input type="text" size="25" maxlength="50" name="code" id="code" placeholder="Course Code" class="block border rounded w-full outline-none p-2" />
                <input type="text" placeholder="Course Teacher" size="25" maxlength="50" name="courseTeacher" id="courseTeacher" class="block border rounded w-full outline-none p-2" />
                <input type="text" placeholder="max Student" size="25" maxlength="50" name="maxStudent" id="maxStudent" class="block border rounded w-full outline-none p-2"  />
                <input type="text" placeholder="minStudent" size="25" maxlength="50" name="minStudent" id="minStudent" class="block border rounded w-full outline-none p-2" >
                <input type="date" placeholder="Start Date" size="25" maxlength="50" name="startDate" id="startDate" class="block border rounded w-full outline-none p-2" >
                <input type="date" placeholder="End Date" size="25" maxlength="50" name="endDate" id="endDate" class="block border rounded w-full outline-none p-2" >
                <p>Is Cancelled</p>
                <div class="w-full flex">
                    <div class="flex">
                        <p>No</p>
                        <input type="radio" value="NO" name="isCancelled" id="isNo" >
                    </div>
                    <div class="flex">
                        <p>Yes</p>
                        <input type="radio" value="YES" name="isCancelled" id="isYes">
                    </div>
                </div>
                <input type="submit" name="saveDataCourse" value="Create Course" class="block bg-blue-300 w-full p-4 rounded text-white text-center "/>

            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</html>