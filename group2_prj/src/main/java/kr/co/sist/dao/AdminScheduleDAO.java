package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.AdminScheduleVO;

import kr.co.sist.vo.AdminShowVO;
import kr.co.sist.dao.AdminScheduleDAO;

public class AdminScheduleDAO {

	private static AdminScheduleDAO adminScheduleDAO;

	private AdminScheduleDAO() {

	}// AdminScheduleDAO

	public static AdminScheduleDAO getInstance() {

		if (adminScheduleDAO == null) {
			adminScheduleDAO = new AdminScheduleDAO();
		} // end if
		return adminScheduleDAO;
	}// getInstance

	// 상영일정 조회 [showINGBoard]
	public List<AdminScheduleVO> selectSchedule(String name, String genreId) throws SQLException {
		List<AdminScheduleVO> list = new ArrayList<AdminScheduleVO>();
		AdminScheduleVO aschVO = null; // 조회된 레코도를 저장할 VO

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성객체 얻기
			String query = "select sc.schId sc_schId, s.showId s_showId, s.name s_name, sc.schDate sc_schDate, g.genretype g_genretype, sc.schTime sc_schTime "
					+ "from show s, schedule sc, genre g " + "where (s.showId = sc.showId) and (s.genreId=g.genreId) ";

			if (genreId != null) {
				query += " and g.genretype='" + genreId + "' ";
			} // end if

			if (name != null) {
				query += " and s.name like '%" + name.trim() + "%' ";
			} // end if

			pstmt = con.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) { // 검색된 레코드의 수를 모르지만 모든 레코드를 저장하기 위해 while
				// 생성된 VO에 조회된 값을 설정
				aschVO = new AdminScheduleVO();
				aschVO.setSchId(rs.getString("sc_schId"));
				aschVO.setShowId(rs.getString("s_showId"));
				aschVO.setName(rs.getString("s_name"));
				aschVO.setSchDate(rs.getString("sc_schDate"));
				aschVO.setGenreId(rs.getString("g_genretype"));
				aschVO.setSchTime(rs.getString("sc_schTime"));
				// 생성된 VO를 list에 저장
				list.add(aschVO);
			} // end while

		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return list;

	}// selectSchedule

	// 상영일정 상세보기(일정코드) [schedule_Detail]
	public AdminScheduleVO selectScheduleDetail(String schId) throws SQLException {

		AdminScheduleVO aschVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성객체 얻기

			String query = "select sc.schId sc_schId, s.showId s_showId, s.name s_name, g.genretype g_genretype, sc.schDate sc_schDate, sc.schTime sc_schTime, s.runningTime s_runningTime, "
					+ "r.ratingtype r_ratingtype, s.price s_price, s.mImg s_mImg, s.thImg s_thImg, s.infoImg s_infoImg, s.status s_status "
					+ "from  show s, schedule sc, rating r, genre g "
					+ "where (s.ratingId=r.ratingId and s.genreId=g.genreId) and (s.showId = sc.showId) and sc.schId=? ";

			/*
			 * String
			 * query=" select s.showId s_showId, s.name s_name, s.genreId s_genreId, sc.schDate sc_schDate, sc.schTime sc_schTime, s.runningTime s_runningTime, "
			 * +"s.ratingId s_ratingId, s.price s_price, s.mImg s_mImg, s.thImg s_thImg, s.infoImg s_infoImg, s.status s_status "
			 * +" from show s join schedule sc " +" on s.showId=sc.showId "
			 * +" where s.showId=? ";
			 */

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, schId);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				aschVO = new AdminScheduleVO();
				aschVO.setSchId(rs.getString("sc_schId"));
				aschVO.setShowId(rs.getString("s_showId"));
				aschVO.setName(rs.getString("s_name"));
				aschVO.setGenreId(rs.getString("g_genretype"));
				aschVO.setSchDate(rs.getString("sc_schDate"));
				aschVO.setSchTime(rs.getString("sc_schTime"));
				aschVO.setRunningTime(rs.getString("s_runningTime"));
				aschVO.setRatingId(rs.getString("r_ratingtype"));
				aschVO.setPrice(rs.getInt("s_price"));
				aschVO.setThImg(rs.getString("s_thImg"));
				aschVO.setmImg(rs.getString("s_mImg"));
				aschVO.setInfoImg(rs.getString("s_infoImg"));
				aschVO.setStatus(rs.getString("s_status"));
			} // end if
		} finally {

			db.dbClose(rs, pstmt, con);
		} // end
		return aschVO;

	}// selectSchedule

	// 상영일정 정보변경 [schedule_update]
	public int updateSchedule(AdminScheduleVO aschVO) throws SQLException {

		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection db = DbConnection.getInstance();

		try {
			con = db.getConn();

			String query = "update schedule " + "set schDate=?, schTime=? " + "where schId='" + aschVO.getSchId()
					+ "' ";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, aschVO.getSchDate());
			pstmt.setString(2, aschVO.getSchTime());
			/* pstmt.setString(3, aschVO.getSchId()); */

			cnt = pstmt.executeUpdate();

		} finally {
			db.dbClose(null, pstmt, con);
		}

		return cnt;

	}// updateSchedule

	// 상영일정 리스트 (공연코드,VO) [schedule_Add-1]
	// 상영일정 추가할 공연명받기
	public List<AdminShowVO> selectAdminScheduleAll() throws SQLException {

		List<AdminShowVO> list = new ArrayList<AdminShowVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn();
			// 3. 쿼리문 생성객체 얻기
			StringBuilder selectAdminScheduleAll = new StringBuilder();
			selectAdminScheduleAll.append("select showId, name ").append("from show");

			pstmt = con.prepareStatement(selectAdminScheduleAll.toString());

			rs = pstmt.executeQuery();

			AdminShowVO adshVO = null;

			while (rs.next()) {
				adshVO = new AdminShowVO();
				adshVO.setShowId(rs.getString("showId"));
				adshVO.setName(rs.getString("name"));
				list.add(adshVO);
			} // end while

		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectAdminSchedule

	// 상영일정 추가 전 조회 [schedule_Add-2]
	public AdminScheduleVO selectShow(String showId) throws SQLException {
		AdminScheduleVO asVO=null; 
	

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn();
			// 3. 쿼리문 생성객체 얻기
			String query = " select * from show " + " where showId=? ";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, showId);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				asVO = new AdminScheduleVO();
				asVO.setThImg(rs.getString("thImg"));
				asVO.setName(rs.getString("name"));
				asVO.setStartDate(rs.getString("startDate"));
				asVO.setEndDate(rs.getString("endDate"));
				asVO.setShowId(rs.getString("showId"));

			} // end while

		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return asVO;
	}// selectshow

	//상영일,상영시간 추가 [schedule_insert]
		public int insertSchedule(AdminScheduleVO aschVO) throws SQLException {
			
			int i=0;
			
			Connection con=null;
			PreparedStatement pstmt=null;
		
			
			DbConnection db=DbConnection.getInstance();
			
			try{
			
					con=db.getConn();
				
					String query= "insert into schedule(schId, showId, schDate, schTime) "
										+"values (concat('sch_',lpad(schedule_seq.nextval,6,0)),?,?,? ) ";
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, aschVO.getShowId());
					pstmt.setString(2, aschVO.getSchDate());
					pstmt.setString(3, aschVO.getSchTime());
					
					
					i = pstmt.executeUpdate(" select concat('sch_',lpad(schedule_seq.nextval,6,0)) from dual ");

			}finally {
				
				db.dbClose(null, pstmt, con);
			}//end finally
			
			return i;
		}//insertSchedule

	
	//상영삭제
	public int deleteSchedule(String schId) throws SQLException {
		int i = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db.getConn();

			String query = " delete from schedule where schId=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, schId);

			pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}

		return i;
	}// deleteShow

}// class
