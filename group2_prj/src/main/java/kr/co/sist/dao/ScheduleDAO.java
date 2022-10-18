package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.vo.ScheduleShowVO;
import kr.co.sist.common.dao.DbConnection;



public class ScheduleDAO {
	
	private static ScheduleDAO scheduleDAO;

	private ScheduleDAO() {
	
	}//ScheduleDAO
	
	public static ScheduleDAO getInstance() {
		if(scheduleDAO == null) {
			scheduleDAO = new ScheduleDAO();
		}//end if
		
		return scheduleDAO;
	}
	
	//캘린더
	
	public List<ScheduleShowVO> selectSchedule() throws SQLException{
		List<ScheduleShowVO> list = new ArrayList<ScheduleShowVO>();
	
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			StringBuilder selectShow = new StringBuilder();
			
			selectShow.append(" select showId, name, startDate, endDate ").append(" from show ")
							.append(" where name is not null");
			
			/*
			 * String query="select showId, name, startDate, endDate " +"from show "
			 * +"where name is not null "
			 * +"and startDate = to_date(startDate, 'YYYY-MM-DD')";
			 */
			
		
			pstmt = con.prepareStatement(selectShow.toString());
			
			rs = pstmt.executeQuery();
			
		
			ScheduleShowVO ssVO = null;
			while(rs.next()) {
				ssVO = new ScheduleShowVO();
				ssVO.setName(rs.getString("name"));
				ssVO.setStartDate(rs.getString("startDate"));
				ssVO.setEndDate(rs.getString("endDate"));
				list.add(ssVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
	
		return list;

	}
	
	
	
	
	
	
	
	

}//class

