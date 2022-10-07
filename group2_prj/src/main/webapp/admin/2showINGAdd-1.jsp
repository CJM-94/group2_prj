<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@page import="project.dao.AdminScheduleDAO"%>
<%@page import="project.vo.AdminScheduleVO"%>
<%@page import="project.vo.AdminShowVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<!--  -->
<%
AdminScheduleVO aschVO=new AdminScheduleVO();
AdminScheduleDAO aschDAO= AdminScheduleDAO.getInstance();
List<AdminShowVO> list=aschDAO.selectAdminShowAll();

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상영관리-상영일정추가(1/2)</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       <script type="text/javascript">
 
        
        </script>
    
    </head>
    <body>
       
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- col lg 5 - 크기 조정 -->
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header navy bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">리스트</h3></div>
                                    <div class="card-body">
                                       
                                    <form>
                                        <div class="dataTable-top"></div>
                                        <table class="table">
                                            <thead>
                                              <tr>
                                                <th scope="col" class="col-7">공연명</th>
                                                <th scope="col" class="col-2">공연추가</th>
                                              </tr>
                                            </thead>
                                      
                                            <tbody>
                                            <%for(int i=0; i<list.size(); i++){ %>
                                              <tr>
                                                <td><%=list.get(i).getName()%></td>
                                                <td><a href="showINGAdd-2.html"><input type="button" value="선택"></a></td>
                                              </tr>
                                              <%} %>
                                       
                                            </tbody>
                                          </table>
                                        
                                        
                                        
                                            
                                            
                                                <div class="mt-4 mb-0">
                                                    <div class="col text-center">
                                                        <a class="btn btn-secondary btn-sm" href="showINGBoard.html">닫기</a>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                    </form>  

                                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                           
                           
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>