package Model;

import java.sql.Timestamp;

import Model.Account;

public class Invoice {
	private String ID_Invoice;
	private Account Tai_Khoan;
	private String Shipping_Address;
	private String Payment_Methods;
	private Timestamp Purchase_Date;
	private int Status_Order;
	private int Total_Invoice;
	private String ID_Employee;
	private String Time_Limit;
	private String Note;

	public Invoice() {
		super();

	}

	public Invoice(String iD_Invoice, Account tai_Khoan, String shipping_Address, String payment_Methods,
			Timestamp purchase_Date, int status_Order, int total_Invoice) {
		super();
		ID_Invoice = iD_Invoice;
		Tai_Khoan = tai_Khoan;
		Shipping_Address = shipping_Address;
		Payment_Methods = payment_Methods;
		Purchase_Date = purchase_Date;
		Status_Order = status_Order;
		Total_Invoice = total_Invoice;
	}

	public Invoice(String iD_Invoice, Account tai_Khoan, String shipping_Address, String payment_Methods,
			Timestamp purchase_Date, int status_Order, int total_Invoice, String iD_Employee, String time_Limit,
			String note) {
		super();
		ID_Invoice = iD_Invoice;
		Tai_Khoan = tai_Khoan;
		Shipping_Address = shipping_Address;
		Payment_Methods = payment_Methods;
		Purchase_Date = purchase_Date;
		Status_Order = status_Order;
		Total_Invoice = total_Invoice;
		ID_Employee = iD_Employee;
		Time_Limit = time_Limit;
		Note = note;
	}

	public String getID_Invoice() {
		return ID_Invoice;
	}

	public void setID_Invoice(String iD_Invoice) {
		ID_Invoice = iD_Invoice;
	}

	public Account getTai_Khoan() {
		return Tai_Khoan;
	}

	public void setTai_Khoan(Account tai_Khoan) {
		Tai_Khoan = tai_Khoan;
	}

	public String getShipping_Address() {
		return Shipping_Address;
	}

	public void setShipping_Address(String shipping_Address) {
		Shipping_Address = shipping_Address;
	}

	public String getPayment_Methods() {
		return Payment_Methods;
	}

	public void setPayment_Methods(String payment_Methods) {
		Payment_Methods = payment_Methods;
	}

	public Timestamp getPurchase_Date() {
		return Purchase_Date;
	}

	public void setPurchase_Date(Timestamp purchase_Date) {
		Purchase_Date = purchase_Date;
	}

	public int getStatus_Order() {
		return Status_Order;
	}

	public void setStatus_Order(int status_Order) {
		Status_Order = status_Order;
	}

	public int getTotal_Invoice() {
		return Total_Invoice;
	}

	public void setTotal_Invoice(int total_Invoice) {
		Total_Invoice = total_Invoice;
	}

	public String getID_Employee() {
		return ID_Employee;
	}

	public void setID_Employee(String iD_Employee) {
		ID_Employee = iD_Employee;
	}

	public String getTime_Limit() {
		return Time_Limit;
	}

	public void setTime_Limit(String time_Limit) {
		Time_Limit = time_Limit;
	}

	public String getNote() {
		return Note;
	}

	public void setNote(String note) {
		Note = note;
	}

}