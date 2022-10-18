package kr.co.sist.vo;

public class ScheduleShowVO {
	private String showId, name, startDate, endDate, schId, schTime, schDate;

	public ScheduleShowVO() {
		
	}

	public ScheduleShowVO(String showId, String name, String startDate, String endDate, String schId, String schTime,
			String schDate) {
		super();
		this.showId = showId;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.schId = schId;
		this.schTime = schTime;
		this.schDate = schDate;
	}

	public String getShowId() {
		return showId;
	}

	public void setShowId(String showId) {
		this.showId = showId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSchId() {
		return schId;
	}

	public void setSchId(String schId) {
		this.schId = schId;
	}

	public String getSchTime() {
		return schTime;
	}

	public void setSchTime(String schTime) {
		this.schTime = schTime;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}
	
	
	
	
	
}//class
	
