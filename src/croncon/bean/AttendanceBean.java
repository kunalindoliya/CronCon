package croncon.bean;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "attendance")
public class AttendanceBean {
	@Id
	@Column(name = "id")
	private int id;
	@Column(name = "emp_id")
	private String emp_id;
	@Column(name = "name")
	private String name;
	@Column(name = "date")
	private Date date;
	@Column(name = "clock_in_time")
	private String clock_in_time;
	@Column(name = "clock_in_ip")
	private String clock_in_ip;
	@Column(name = "clock_out_time")
	private String clock_out_time;
	@Column(name = "clock_out_ip")
	private String clock_out_ip;
	@Column(name="status")
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getClock_in_time() {
		return clock_in_time;
	}

	public void setClock_in_time(String clock_in_time) {
		this.clock_in_time = clock_in_time;
	}

	public String getClock_in_ip() {
		return clock_in_ip;
	}

	public void setClock_in_ip(String clock_in_ip) {
		this.clock_in_ip = clock_in_ip;
	}

	public String getClock_out_time() {
		return clock_out_time;
	}

	public void setClock_out_time(String clock_out_time) {
		this.clock_out_time = clock_out_time;
	}

	public String getClock_out_ip() {
		return clock_out_ip;
	}

	public void setClock_out_ip(String clock_out_ip) {
		this.clock_out_ip = clock_out_ip;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
