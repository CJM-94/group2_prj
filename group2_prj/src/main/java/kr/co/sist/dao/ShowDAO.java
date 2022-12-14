package kr.co.sist.dao;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.GenreVO;
import kr.co.sist.vo.RatingVO;
import kr.co.sist.vo.ShowVO;

public class ShowDAO { 
	private static ShowDAO showDAO;
	
	private ShowDAO() {
	
	}//ShowDAO
	
	
	//static method, 반환형 method 공부
	public static ShowDAO getInstance() {
		if(showDAO==null) {
			showDAO=new ShowDAO();
		}
		
		return showDAO;
	}//getInstance
	
	
		//설빈쓰 꺼
	   //main검색조회(매개변수 공연명)
	   public List<ShowVO> selectMainShow(String showName) throws SQLException{
	      List<ShowVO> showList = new ArrayList<>();
	      
	      DbConnection dc = DbConnection.getInstance();

	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         con = dc.getConn();
	         StringBuilder selectShowInfo = new StringBuilder();
	         selectShowInfo.append(" select  sho.showId showId, sho.thimg thimg,sho.name showname, sho.startdate || '~' || sho.enddate showdate ,g.genretype genre ")
	                      .append(" from show sho ,genre g  ")
	                      .append(" where (sho.genreid = g.genreid) and replace(sho.name,' ','') like '%'||?||'%' ");
	         
	      pstmt = con.prepareStatement(selectShowInfo.toString());
	      pstmt.setString(1, showName);
	      rs = pstmt.executeQuery();
	      
	      ShowVO sVO = null;
	      //RsrvtInfoVO rsrvtVO = null;
	      
	      while(rs.next()) {
	         sVO = new ShowVO();
	         
	         sVO.setShowId(rs.getString("showId"));
	         sVO.setThImg(rs.getString("thimg"));
	         sVO.setName(rs.getString("showname"));
	         sVO.setTotalDate(rs.getString("showdate"));
	         sVO.setGenreType(rs.getString("genre"));
	         showList.add(sVO);
	         
	      }   
	      }finally {
	         dc.dbClose(rs, pstmt, con);
	      }   
	      
	      return showList;
	   }
	   
	
	
	
	
	//쿼리문 확인완료
	//공연선택, 상세(공연코드)
	//매개변수: 공연코드
	//return: 8개) 썸네일이미지, 작품소개이미지, 공연명, 시작일, 종료일, 관람등급, 금액, 관람시간 
	//return: 장소 고정이므로 html처리, ratingId inner join하기
	public ShowVO selectShow(String showId) throws SQLException {
		ShowVO sVO = null;
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//ratingId ratingType 
			String query=" select s.thImg s_thImg, s.infoImg s_infoImg, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, s.price s_price, s.runningTime s_runningTime, r.ratingId r_ratingId "
					+ " from show s, rating r "
					+ " where (s.ratingId=r.ratingId) and s.showId=? ";
					
			pstmt.setString(1, showId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sVO=new ShowVO();
				sVO.setThImg(rs.getString("s_thImg"));
				sVO.setInfoImg(rs.getString("s_infoImg"));
				sVO.setName(rs.getString("s_name"));
				sVO.setStartDate(rs.getString("s_startDate"));
				sVO.setEndDate(rs.getString("s_endDate"));
				sVO.setRatingId(rs.getString("r_ratingId"));
				sVO.setPrice(rs.getInt("s_price"));
				sVO.setRunningTime(rs.getString("s_runningTime"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con); 
		}
		
		return sVO;	
	}//selectShow
	
	
	//공연검색
	//공연코드 타고 넘어가야해 showid넣기
	//장르아이디, 이름만 넣고는 실행잘됨
	//쿼리문 완성 10/12/11:12
	public List<ShowVO> selectSearch(ShowVO sVO) throws SQLException {
		List<ShowVO> list=new ArrayList<ShowVO>();
		
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=db.getConn();
			
			//ratingId ratingType 
			String query=" select s.showId s_showId, s.thImg s_thImg, s.name s_name, s.startDate s_startDate, s.endDate s_endDate, g.genreId g_genreId, g.genreType g_genreType "
					+ " from show s, genre g "
					+ " where (s.genreId=g.genreId) ";
			
			
			if(sVO.getSdate()!=null&&sVO.getEdate()!=null) {
				
				query+=" and s.startDate<='"+sVO.getEdate()+"' and s.endDate>='"+sVO.getSdate()+"' order by s.startDate "; 
				
			}
			 
			if(sVO.getGenreId()!=null) {
				query+=" and g.genreId='"+sVO.getGenreId()+"' ";
			}
			
			if(sVO.getName()!=null) { 
				query += " and s.name like '%"+sVO.getName().trim()+"%' ";
			}
			
			pstmt = con.prepareStatement(query);
			
			/*
			if(sVO.getSdate()!=null&&sVO.getEdate()!=null) { 
				//위에 바인드 변수가 존재하는 쿼리가 있는 상황에서만 바인드변수에 값을 넣는다.
				pstmt.setString(1, sVO.getSdate());
				pstmt.setString(2, sVO.getEdate());
			} */
			rs = pstmt.executeQuery();
			
			ShowVO sVO2=null;
			
			while(rs.next()) {
				sVO2=new ShowVO();
				sVO2.setThImg(rs.getString("s_thImg"));
				sVO2.setName(rs.getString("s_name"));
				sVO2.setStartDate(rs.getString("s_startDate"));
				sVO2.setEndDate(rs.getString("s_endDate"));
				sVO2.setGenreId(rs.getString("g_genreType"));
				sVO2.setShowId(rs.getString("s_showId")); //쇼아이디!
				list.add(sVO2);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con); 
		}
		
		return list;
	}//검색어 입력
	
	

}//class

