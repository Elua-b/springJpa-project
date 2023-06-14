package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.CourseDAO;
import rw.ac.rca.webapp.dao.impl.CourseDAOImpl;
import rw.ac.rca.webapp.orm.Course;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateCourse
 */
public class CreateCourse extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDao = CourseDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageInfo = request.getParameter("page");
        HttpSession session = request.getSession();
        if (pageInfo != null) {
            if (pageInfo.equals("createcourse")) {
                if (request.getParameter("saveDataCourse") != null) {
                    Course course = new Course();
                    String courseName = request.getParameter("coursename");
                    int minStudent = Integer.parseInt(request.getParameter("minStudent"));
                    int maxStudent = Integer.parseInt(request.getParameter("maxStudent"));
                    String dateIn = request.getParameter("startDate");
                    String dateEnd = request.getParameter("endDate");
                    String courseCode = request.getParameter("code");
                    String isCancelled = request.getParameter("isCancelled");
                    try {
                        course.setMinStudent(minStudent);
                        course.setMaxStudent(maxStudent);
                        course.setName(courseName);
                        course.setCode(courseCode);
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            Date date1 = dateFormat.parse(dateIn);
                            Date date2 = dateFormat.parse(dateEnd);
                            course.setStart(date1);
                            course.setEnd(date2);
                        } catch (ParseException e) {
                            e.printStackTrace();

                        }
                        course.setCancelled(isCancelled.equals(("NO")));
                        courseDao.saveOrUpdateCourse(course);
                        session.setAttribute("message", "Course created successfully");
                    } catch (Exception e) {
                        session.setAttribute("message", "Can't create");
                    }

                }
                request.getRequestDispatcher("WEB-INF/createcourse.jsp").forward(
                        request, response);

            }
        }

    }
        /**
         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
         */
        protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            // TODO Auto-generated method stub
            doGet(request, response);
        }

    }
