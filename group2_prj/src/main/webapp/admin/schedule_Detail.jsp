<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.sist.dao.AdminScheduleDAO"%>
<%@page import="kr.co.sist.vo.AdminScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="상영일정 상세내역"%>
  
    
 <%
 
request.setCharacterEncoding("UTF-8");

 String schId=request.getParameter("schId");
 String schDate=request.getParameter("schDate");

 AdminScheduleVO aschVO = new AdminScheduleVO();
 AdminScheduleDAO aschDAO = AdminScheduleDAO.getInstance();
 AdminScheduleVO schData= aschDAO.selectScheduleDetail(schId);

System.out.println(  aschDAO.selectScheduleDetail(schId) );

%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상영관리-상영상세내역</title>
        <link href="css/styles.css" rel="stylesheet" />
        <style type="text/css">
        
        body{background-color : #fff;}
        
        </style>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
           <!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
        
      
      //삭제	
        $(function() {
		
        	$("#removeBtn").click(function() {
        		
        		var del=confirm("상영일정을 삭제하시겠습니까?");
        		
    			if(del){
    				alert("상영일정이 삭제되었습니다");
    				$("#deleteFrm").submit();	
				
    			}else{
    				return;
    			}
        	});//remove

        
      //변경      
        	$("#modifyBtn").click(function() {
        		if(confirm("상영일정을 변경하시겠습니까?")){
        		alert("상영일정을 변경 완료하였습니다.");
        			$("#frm").submit();
        		
        		}
        			return;
        		
        		
    		 });//modify
      }); 
      
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
                                    <div class="card-header navy bg-dark"><h3 class="text-start text-white font-weight-light my-4 " style="font-weight: bold;">상영 상세내역</h3></div>
                                    <div class="card-body">
                                    
                                       <!-- **update form 태그 위치**  -->
                                       
                                       <form action="schedule_update.jsp" method="post" id="frm"  name="frm">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-4"><img id="thImgPreview" src="img/<%=schData.getThImg() %>" class="img-thumbnail" alt="썸네일이미지"></div>
                                        </div> 
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                       		 <input type="hidden" name="zschId" id="zschId" value=<%=schData.getSchId()%>>
                                            <div class="col-2"><b>공연코드</b></div> <div class="col-6"><input type="text" id="showId" name="showId" class="dataTable-input" 
                                            value="<%=schData.getShowId() %>" readonly="readonly"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연명</b></div> <div class="col-6"><input type="text" id="name" name="name"  class="dataTable-input" value="<%=schData.getName() %> " placeholder="공연명을 입력해주세요" disabled></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row" >
                                            <div class="col-2"><b>장르</b></div> 
                                            <div class="col-4">
                                                <select name="genreId" class="dataTable-dropdown dataTable-selector" disabled >
                                                <%String[] genreArr={"국악","연극","오페라","뮤지컬","클래식","무용"}; %>
                                                <%for(int i=0; i<genreArr.length; i++){ %>
                                                    <option <%=genreArr[i].equals(schData.getGenreId())?" selected='selected'":"" %>><%=genreArr[i] %></option>
													<%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>상영일정</b></div> <div class="col-4"><input type="date" class="dataTable-input"  name="schDate"  value="<%=schData.getSchDate()%>"></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>시작시간</b></div>
                                            <div class="col-4">
                                            
                                            
                                            <%
                                            	String schTime = schData.getSchTime();
                                            	String schTime1 = schTime.substring(0, schTime.indexOf(":"));
                                            	String schTime2 = schTime.substring(schTime.indexOf(":")+1, schTime.length());
                                            %>
                                            
                                            
                                            
                 
                                                <select name="schTime1" class="dataTable-dropdown dataTable-selector">
                                            <%String[] schTimeArr1={"10","11","12","13","14","15","16","17","18","19","20","21","22"}; %>
                                                <%for(int i=0; i<schTimeArr1.length; i++){ %>
                                                    <option<%=schTimeArr1[i].equals(schTime1)?" selected='selected'":"" %>><%=schTimeArr1[i] %></option>
                                           <%} %> 
                                         
                                                </select>
                                                <label> 시</label>
            
                                                <select name="schTime2" class="dataTable-dropdown dataTable-selector">
                              			  		<%String[] schTimeArr2={"00","30"}; %>
                              			  		<%for(int i=0; i<schTimeArr2.length; i++){ %>
                                                    <option<%=schTimeArr2[i].equals(schTime2)?" selected='selected'":"" %> ><%=schTimeArr2[i] %></option>
                                             <%} %>
                                                 
                                                </select>
                                                <label> 분</label>
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>관람시간</b></div> 
                                            <div class="col-4">
                                                <select name="runningTime" class="dataTable-dropdown dataTable-selector" disabled>
                                                     <%String[] runningtimeArr={"60분","70분","80분","90분","100분","110분","120분","130분","140분","150분","160분","170분","180분"}; %>
												  <%for(int i=0; i<runningtimeArr.length; i++){ %>
							 				 <option<%=runningtimeArr[i].equals(schData.getRunningTime())?" selected='selected'":"" %>><%=runningtimeArr[i] %></option>
												  <%} %>
                                                </select>
                                              
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>관람등급</b></div> 
                                            <div class="col-4">
                                                <select name="ratingId" class="dataTable-dropdown dataTable-selector" disabled>
                                                  <%String[] ratingArr={"00세 이상","12세 이상","14세 이상","만 18세 이상"}; %>
												  <%for(int i=0; i<ratingArr.length; i++){ %>
												  <option<%=ratingArr[i].equals(schData.getRatingId())?" selected='selected'":"" %>><%=ratingArr[i] %></option>
												  <%} %> 
                                                </select>
                                                <!--  -->
                                            </div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>금액</b></div> <div class="col-6"><input type="text" name="price" class="dataTable-input" value="<%=schData.getPrice() %>" placeholder="숫자만 입력해주세요(한글,특수문자 제외)" disabled></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>썸네일이미지</b></div> <div class="col-4"><input type="file" name="thImg"  value="파일선택" disabled></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=schData.getThImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>메인이미지</b></div> <div class="col-4"><input type="file" name="mImg" value="파일선택" disabled></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=schData.getmImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>소개이미지</b></div> <div class="col-4"><input type="file" name="infoImg" value="파일선택" disabled></div>
                                            <div class="col-2 my-1"><b>원본파일</b></div><div class="col-4 my-1"><%=schData.getInfoImg() %></div>
                                        </div>
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                           <div class="col-2"><b>공연상태</b></div> 
                                            <div class="col-4">
                                                <select name="status" class="dataTable-dropdown dataTable-selector" disabled>
                                                <%String[] statusArr={"공연예정","공연중","공연취소","공연종료"}; %>
                                                <%for(int i=0; i<statusArr.length; i++){ %>
                                                     <option<%=statusArr[i].equals(schData.getStatus())?" selected='selected'":"" %>><%=statusArr[i] %></option>
												 <%} %>
                                                </select>
                                            </div>
                                        </div>
                                    </form>  
                                       
                                    <!-- 10/17 하지윤: 링크 및 id 등등 수정하시면 됩니다 -->   
                                    <form id="deleteFrm" action="schedule_delete.jsp">
                                        <div class="dataTable-top"></div>
                                        <div class="row">
                                            <div class="col-2"><b>공연삭제</b></div> <div class="col-4">
                                            <input type="button" id="removeBtn" value="삭제하기"></div>
                                            <input type="hidden" id="schId" name="schId" value="<%=schData.getSchId()%>">
                                        </div>
                                   	</form>
                                        
                                            
                                                <div class="mt-4 mb-0">
                                                    <div class="col text-center">
                                                         <a class="btn btn-secondary btn-sm" id="modifyBtn" >변경</a>
                                                        <input type="button" class="btn btn-default btn-sm" id="cancelBtn" value="취소" onclick="history.back()">
                                                    </div>
                                                </div>
                                            </div>

                                                
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













