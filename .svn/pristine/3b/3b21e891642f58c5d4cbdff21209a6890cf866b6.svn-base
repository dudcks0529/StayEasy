package model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="bb_inq_tbl")
public class Inquire {
	
	@Id
	private Integer inquire_id;
	@ManyToOne
	@JoinColumn(name="reservation_id")
	private Reservation reservation;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@NotEmpty(message="내용을 입력하세요")
	private String content;
	@NotEmpty(message="현재 상태를 입력하세요")
	private String status="대기";
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date i_date;
	private Integer group_id;
	private Integer parent_id;
	private Integer order_no;
	@NotEmpty(message="제목을 입력하세요")
	private String title;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getInquire_id() {
		return inquire_id;
	}
	public void setInquire_id(Integer inquire_id) {
		this.inquire_id = inquire_id;
	}
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getI_date() {
		return i_date;
	}
	public void setI_date(Date i_date) {
		this.i_date = i_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
        if (status == null || status.isEmpty()) {
            this.status = "대기"; // 🔥 기본값 설정
        } else {
            this.status = status;
        }
	}
	
}