package croncon.bean;



import javax.persistence.*;

@Entity
@Table(name="employee_detail")
public class ProfileBean {
 @Id
 private int id;
 @Column
 private String emp_id;
 @Column
 private String first_name;
 @Column
 private String last_name;
 @Column
 private String email;
 @Column
 private String gender;
 @Column
 private String birthday;
 @Column
 private String martial_status;
 @Column
 private String status;
 @Column
 private String department;
 @Column
 private String designation;
 @Column
 private String location;
 @Column
 private String manager;
 @Column
 private String reports_to;
 @Column
 private String joining_date;
 @Column
 private String mobile_phone;
 @Column
 private String emergency_contact;
 @Column
 private String emergency_person;
 @Column
 private String address;
 @Column
 private String image;
 @Column
 private String driving_license_number;
 @Column
 private String pan_number;
 @Column
 private String aadhar_number;
 @Column
 private String voter_id_number;
 @Column
 private String driving_license_file;
 @Column
 private String pan_file;
 @Column
 private String aadhar_file;
 @Column
 private String voter_id_file;
 @Column
 private String offer_letter;
 @Column
 private String joining_letter;
 @Column
 private String contract;
 @Column
 private String resume;
 @Column
 private String primary_bank_account;
 @Column
 private String account_type_1;
 @Column
 private String account_holder_1;
 @Column
 private String account_number_1;
 @Column
 private String ifsc_1;
 @Column
 private String account_type_2;
 @Column
 private String account_holder_2;
 @Column
 private String account_number_2;
 @Column
 private String ifsc_2;
 @Column
 private String graduation_school;
 @Column
 private String graduation_start_date;
 @Column
 private String graduation_end_date;
 @Column
 private String graduation_detail;
 @Column
 private String pg_school;
 @Column
 private String pg_start_date;
 @Column
 private String pg_end_date;
 @Column
 private String pg_detail;
 @Column
 private String doctorate_school;
 @Column
 private String doctorate_start_date;
 @Column
 private String doctorate_end_date;
 @Column
 private String doctorate_detail;
 @Column
 private String certification;
 @Column
 private String company_work_1;
 @Column
 private String designation_work_1;
 @Column
 private String from_work_1;
 @Column
 private String to_work_1;
 @Column
 private String detail_work_1;
 @Column
 private String company_work_2;
 @Column
 private String designation_work_2;
 @Column
 private String from_work_2;
 @Column
 private String to_work_2;
 @Column
 private String detail_work_2;
 @Column
 private String other_work;
 @Column
 private String passport_number;
 @Column
 private String passport_issue_date;
 @Column
 private String passport_expiry_date;
 @Column
 private String passport_file;
 @Column
 private String visa_number;
 @Column
 private String visa_issue_date;
 @Column
 private String visa_expiry_date;
 @Column
 private String visa_file;
 @Column
 private String linkedin_username;
 @Column
 private String facebook_username;
 @Column
 private String twitter_username;
 @Column
 private String instagram_username;

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
public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getBirthday() {
	return birthday;
}
public void setBirthday(String string) {
	this.birthday = string;
}
public String getMartial_status() {
	return martial_status;
}
public void setMartial_status(String martial_status) {
	this.martial_status = martial_status;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getManager() {
	return manager;
}
public void setManager(String manager) {
	this.manager = manager;
}
public String getReports_to() {
	return reports_to;
}
public void setReports_to(String reports_to) {
	this.reports_to = reports_to;
}
public String getJoining_date() {
	return joining_date;
}
public void setJoining_date(String joining_date) {
	this.joining_date = joining_date;
}
public String getMobile_phone() {
	return mobile_phone;
}
public void setMobile_phone(String mobile_phone) {
	this.mobile_phone = mobile_phone;
}
public String getEmergency_contact() {
	return emergency_contact;
}
public void setEmergency_contact(String emergency_contact) {
	this.emergency_contact = emergency_contact;
}
public String getEmergency_person() {
	return emergency_person;
}
public void setEmergency_person(String emergency_person) {
	this.emergency_person = emergency_person;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getDriving_license_number() {
	return driving_license_number;
}
public void setDriving_license_number(String driving_license_number) {
	this.driving_license_number = driving_license_number;
}
public String getPan_number() {
	return pan_number;
}
public void setPan_number(String pan_number) {
	this.pan_number = pan_number;
}
public String getAadhar_number() {
	return aadhar_number;
}
public void setAadhar_number(String aadhar_number) {
	this.aadhar_number = aadhar_number;
}
public String getVoter_id_number() {
	return voter_id_number;
}
public void setVoter_id_number(String voter_id_number) {
	this.voter_id_number = voter_id_number;
}
public String getDriving_license_file() {
	return driving_license_file;
}
public void setDriving_license_file(String driving_license_file) {
	this.driving_license_file = driving_license_file;
}
public String getPan_file() {
	return pan_file;
}
public void setPan_file(String pan_file) {
	this.pan_file = pan_file;
}
public String getAadhar_file() {
	return aadhar_file;
}
public void setAadhar_file(String aadhar_file) {
	this.aadhar_file = aadhar_file;
}
public String getVoter_id_file() {
	return voter_id_file;
}
public void setVoter_id_file(String voter_id_file) {
	this.voter_id_file = voter_id_file;
}
public String getOffer_letter() {
	return offer_letter;
}
public void setOffer_letter(String offer_letter) {
	this.offer_letter = offer_letter;
}
public String getJoining_letter() {
	return joining_letter;
}
public void setJoining_letter(String joining_letter) {
	this.joining_letter = joining_letter;
}
public String getContract() {
	return contract;
}
public void setContract(String contract) {
	this.contract = contract;
}
public String getResume() {
	return resume;
}
public void setResume(String resume) {
	this.resume = resume;
}
public String getPrimary_bank_account() {
	return primary_bank_account;
}
public void setPrimary_bank_account(String primary_bank_account) {
	this.primary_bank_account = primary_bank_account;
}
public String getAccount_type_1() {
	return account_type_1;
}
public void setAccount_type_1(String account_type_1) {
	this.account_type_1 = account_type_1;
}
public String getAccount_holder_1() {
	return account_holder_1;
}
public void setAccount_holder_1(String account_holder_1) {
	this.account_holder_1 = account_holder_1;
}
public String getAccount_number_1() {
	return account_number_1;
}
public void setAccount_number_1(String account_number_1) {
	this.account_number_1 = account_number_1;
}
public String getIfsc_1() {
	return ifsc_1;
}
public void setIfsc_1(String ifsc_1) {
	this.ifsc_1 = ifsc_1;
}
public String getAccount_type_2() {
	return account_type_2;
}
public void setAccount_type_2(String account_type_2) {
	this.account_type_2 = account_type_2;
}
public String getAccount_holder_2() {
	return account_holder_2;
}
public void setAccount_holder_2(String account_holder_2) {
	this.account_holder_2 = account_holder_2;
}
public String getAccount_number_2() {
	return account_number_2;
}
public void setAccount_number_2(String account_number_2) {
	this.account_number_2 = account_number_2;
}
public String getIfsc_2() {
	return ifsc_2;
}
public void setIfsc_2(String ifsc_2) {
	this.ifsc_2 = ifsc_2;
}
public String getGraduation_school() {
	return graduation_school;
}
public void setGraduation_school(String graduation_school) {
	this.graduation_school = graduation_school;
}
public String getGraduation_start_date() {
	return graduation_start_date;
}
public void setGraduation_start_date(String graduation_start_date) {
	this.graduation_start_date = graduation_start_date;
}
public String getGraduation_end_date() {
	return graduation_end_date;
}
public void setGraduation_end_date(String graduation_end_date) {
	this.graduation_end_date = graduation_end_date;
}
public String getGraduation_detail() {
	return graduation_detail;
}
public void setGraduation_detail(String graduation_detail) {
	this.graduation_detail = graduation_detail;
}
public String getPg_school() {
	return pg_school;
}
public void setPg_school(String pg_school) {
	this.pg_school = pg_school;
}
public String getPg_start_date() {
	return pg_start_date;
}
public void setPg_start_date(String pg_start_date) {
	this.pg_start_date = pg_start_date;
}
public String getPg_end_date() {
	return pg_end_date;
}
public void setPg_end_date(String pg_end_date) {
	this.pg_end_date = pg_end_date;
}
public String getPg_detail() {
	return pg_detail;
}
public void setPg_detail(String pg_detail) {
	this.pg_detail = pg_detail;
}
public String getDoctorate_school() {
	return doctorate_school;
}
public void setDoctorate_school(String doctorate_school) {
	this.doctorate_school = doctorate_school;
}
public String getDoctorate_start_date() {
	return doctorate_start_date;
}
public void setDoctorate_start_date(String doctorate_start_date) {
	this.doctorate_start_date = doctorate_start_date;
}
public String getDoctorate_end_date() {
	return doctorate_end_date;
}
public void setDoctorate_end_date(String doctorate_end_date) {
	this.doctorate_end_date = doctorate_end_date;
}
public String getDoctorate_detail() {
	return doctorate_detail;
}
public void setDoctorate_detail(String doctorate_detail) {
	this.doctorate_detail = doctorate_detail;
}
public String getCertification() {
	return certification;
}
public void setCertification(String certification) {
	this.certification = certification;
}
public String getCompany_work_1() {
	return company_work_1;
}
public void setCompany_work_1(String company_work_1) {
	this.company_work_1 = company_work_1;
}
public String getDesignation_work_1() {
	return designation_work_1;
}
public void setDesignation_work_1(String designation_work_1) {
	this.designation_work_1 = designation_work_1;
}
public String getFrom_work_1() {
	return from_work_1;
}
public void setFrom_work_1(String from_work_1) {
	this.from_work_1 = from_work_1;
}
public String getTo_work_1() {
	return to_work_1;
}
public void setTo_work_1(String to_work_1) {
	this.to_work_1 = to_work_1;
}
public String getDetail_work_1() {
	return detail_work_1;
}
public void setDetail_work_1(String detail_work_1) {
	this.detail_work_1 = detail_work_1;
}
public String getCompany_work_2() {
	return company_work_2;
}
public void setCompany_work_2(String company_work_2) {
	this.company_work_2 = company_work_2;
}
public String getDesignation_work_2() {
	return designation_work_2;
}
public void setDesignation_work_2(String designation_work_2) {
	this.designation_work_2 = designation_work_2;
}
public String getFrom_work_2() {
	return from_work_2;
}
public void setFrom_work_2(String from_work_2) {
	this.from_work_2 = from_work_2;
}
public String getTo_work_2() {
	return to_work_2;
}
public void setTo_work_2(String to_work_2) {
	this.to_work_2 = to_work_2;
}
public String getDetail_work_2() {
	return detail_work_2;
}
public void setDetail_work_2(String detail_work_2) {
	this.detail_work_2 = detail_work_2;
}
public String getOther_work() {
	return other_work;
}
public void setOther_work(String other_work) {
	this.other_work = other_work;
}
public String getPassport_number() {
	return passport_number;
}
public void setPassport_number(String passport_number) {
	this.passport_number = passport_number;
}
public String getPassport_issue_date() {
	return passport_issue_date;
}
public void setPassport_issue_date(String passport_issue_date) {
	this.passport_issue_date = passport_issue_date;
}
public String getPassport_expiry_date() {
	return passport_expiry_date;
}
public void setPassport_expiry_date(String passport_expiry_date) {
	this.passport_expiry_date = passport_expiry_date;
}
public String getPassport_file() {
	return passport_file;
}
public void setPassport_file(String passport_file) {
	this.passport_file = passport_file;
}
public String getVisa_number() {
	return visa_number;
}
public void setVisa_number(String visa_number) {
	this.visa_number = visa_number;
}
public String getVisa_issue_date() {
	return visa_issue_date;
}
public void setVisa_issue_date(String visa_issue_date) {
	this.visa_issue_date = visa_issue_date;
}
public String getVisa_expiry_date() {
	return visa_expiry_date;
}
public void setVisa_expiry_date(String visa_expiry_date) {
	this.visa_expiry_date = visa_expiry_date;
}
public String getVisa_file() {
	return visa_file;
}
public void setVisa_file(String visa_file) {
	this.visa_file = visa_file;
}
public String getLinkedin_username() {
	return linkedin_username;
}
public void setLinkedin_username(String linkedin_username) {
	this.linkedin_username = linkedin_username;
}
public String getFacebook_username() {
	return facebook_username;
}
public void setFacebook_username(String facebook_username) {
	this.facebook_username = facebook_username;
}
public String getTwitter_username() {
	return twitter_username;
}
public void setTwitter_username(String twitter_username) {
	this.twitter_username = twitter_username;
}
public String getInstagram_username() {
	return instagram_username;
}
public void setInstagram_username(String instagram_username) {
	this.instagram_username = instagram_username;
}
 
 
}
