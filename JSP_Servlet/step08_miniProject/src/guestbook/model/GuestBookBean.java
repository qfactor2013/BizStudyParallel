package guestbook.model;

import java.io.*;

public class GuestBookBean implements Serializable{
	private int num;						// �� ��ȣ
	private String title;					// �� ����
	private String author;				// �� �ۼ���
	private String email;				// �� �ۼ��� ���ڸ���
	private String content;				// �� ����
	private String password;			// �� ��й�ȣ
	private String writeday;			// �� �ۼ���
	private int readnum;				// �� ��ȸ��
    
	public GuestBookBean(){	}
	public GuestBookBean(int num){
		this.num=num;
	}
	public GuestBookBean(int num,String title, String author, String email, String content,String password) {
		this.num=num;
		this.title = title;
		this.author = author;
		this.email = email;
		this.content = content;
	   this.password=password;	
		
	}
	public GuestBookBean(int num,String title, String author, String email, String content) {
		this.num=num;
		this.title = title;
		this.author = author;
		this.email = email;
		this.content = content;
		
		
	}
	public GuestBookBean(String title, String author, String email, String content, String password) {
		this.title = title;
		this.author = author;
		this.email = email;
		this.content = content;
		this.password = password;
		
	}
	public GuestBookBean(int num, String title, String author, String email, String content, String password, String writeday, int readnum) {
		this.num = num;
		this.title = title;
		this.author = author;
		this.email = email;
		this.content = content;
		this.password = password;
		this.writeday = writeday;
		this.readnum = readnum;
	}
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}