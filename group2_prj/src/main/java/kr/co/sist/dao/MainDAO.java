package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.common.dao.DbConnection;
import kr.co.sist.vo.ShowVO;

public class MainDAO {
	private static MainDAO mDAO;

	private MainDAO() {
	}

	public static MainDAO getInstance() {

		if (mDAO == null) {
			mDAO = new MainDAO();
		}
		return mDAO;
	}

	// 공연중인목록 조회해서 반환
	public List<ShowVO> selectThImg() throws SQLException {
		List<ShowVO> listShow = new ArrayList<ShowVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dc.getConn();
			StringBuilder selectImgs = new StringBuilder();

			selectImgs.append(" select showId, thImg, mImg ").append(" from show ")
					.append(" where status = '공연중' ");

			pstmt = con.prepareStatement(selectImgs.toString());

			rs = pstmt.executeQuery();
			ShowVO showVO = null;
			while (rs.next()) {
				 showVO = new ShowVO();
				showVO.setShowId(rs.getString("showId"));
				showVO.setThImg(rs.getString("thImg"));
				showVO.setmImg(rs.getString("mImg"));
				listShow.add(showVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return listShow;
	}
	
	// test
	public ShowVO selectShowMain(String showId) throws SQLException {
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShowVO showVO = null;
		try {
			con = dc.getConn();
			StringBuilder selectImgs = new StringBuilder();
			
			// 10-18 장르, 연령 id말고 type 으로 변경 쿼리문 수정
			selectImgs.append(" select s.showid,s.name,g.genretype,r.ratingtype,startdate,enddate,runningtime,price,mimg,thimg,infoimg,status,inputdate ")
			.append(" from show s,genre g,rating r ")
			.append(" where s.genreid = g.genreid ")
			.append(" and s.ratingid = r.ratingid ")
			.append(" and showid = ? ");
			
			pstmt = con.prepareStatement(selectImgs.toString());
			pstmt.setString(1, showId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) { 
				showVO = new ShowVO();
				showVO.setShowId(rs.getString("showId"));
				showVO.setName(rs.getString("name"));
				showVO.setGenreId(rs.getString("genretype"));
				showVO.setRatingId(rs.getString("ratingtype"));
				showVO.setStartDate(rs.getString("startdate"));
				showVO.setEndDate(rs.getString("enddate"));
				showVO.setRunningTime(rs.getString("runningtime"));
				showVO.setmImg(rs.getString("mimg"));
				showVO.setThImg(rs.getString("thimg"));
				showVO.setInfoImg(rs.getString("infoimg"));
				showVO.setStatus(rs.getString("status"));
				showVO.setPrice(rs.getInt("price"));
			}
			
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return showVO;
	}

}
