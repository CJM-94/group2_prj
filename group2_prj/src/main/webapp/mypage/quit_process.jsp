<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="kr.co.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원탈퇴"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    


<jsp:useBean id="mbVO" class="kr.co.sist.vo.MemberVO" scope="page"/>
<jsp:useBean id="qmVO" class="kr.co.sist.vo.QuitMemberVO" scope="page"/>
<jsp:setProperty property="*" name="mbVO"/>




 <%
String id=(String)session.getAttribute("memberId");
String pw=request.getParameter("pwd");
String reason=request.getParameter("reason");

//key가져오기
ServletContext sc = getServletContext();
String plainText = sc.getInitParameter("keyU"); 


DataEncrypt de= new DataEncrypt(plainText);
String pwd=DataEncrypt.messageDigest("SHA-1", pw);





%>




<jsp:setProperty property="memberId" name="mbVO" value="<%=id %>"/>
<jsp:setProperty property="pwd" name="mbVO" value="<%=pwd %>"/>
<jsp:setProperty property="memberId" name="qmVO" value="<%=id %>"/>
<jsp:setProperty property="pwd" name="qmVO" value="<%=pwd %>"/>
<jsp:setProperty property="reason" name="qmVO" value="<%=reason%>"/>
<jsp:setProperty property="mdate" name="qmVO" />



 <%
 System.out.println(mbVO);
 System.out.println(qmVO);

 
MemberDAO mbrDAO =MemberDAO.getInstance();

 int updateMbsCnt = mbrDAO.updateMemberStatus(mbVO.getMemberId(), mbVO.getPwd());


%>



 <% if(updateMbsCnt==0){/* 회원정보수정 실패 */	%>
					<script>
						alert("비밀번호를 다시 확인해주세요");
						location.href="http://localhost/group2_prj/mypage/quitmember.jsp";
					</script>
				<%}else{ 
					 int qmCnt=mbrDAO.insertQuitMember(qmVO);%>
					<% if(qmCnt==1&&updateMbsCnt==1){%>						
								<script>
							
								alert("회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
								location.href="http://localhost/group2_prj/main/index.jsp";
								</script>
						<%}
								session.invalidate();
					 System.out.println(updateMbsCnt);
					 System.out.println(qmCnt);
					 
				}//endif
						%>
			



