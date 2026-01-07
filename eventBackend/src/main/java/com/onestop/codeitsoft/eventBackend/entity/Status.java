package com.onestop.codeitsoft.eventBackend.entity;

public class Status {
	
	private int code;
	
    private String message;

    private Object result;
    
	public Status() {
		
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	public Status(int code, String message, Object result) {
		super();
		this.code = code;
		this.message = message;
		this.result = result;
	}

	@Override
	public String toString() {
		return "Status [code=" + code + ", message=" + message + ", result=" + result + "]";
	}
	

}
