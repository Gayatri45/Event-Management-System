package com.onestop.codeitsoft.eventBackend.entity;

public class Response {

	int code;
	String message;
	Object result;
	
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

	@Override
	public String toString() {
		return "Response [code=" + code + ", message=" + message + ", result=" + result + "]";
	}

	public Response(int code, String message, Object result) {
		super();
		this.code = code;
		this.message = message;
		this.result = result;
	}

	public Response() {
		super();
		// TODO Auto-generated constructor stub
	}
}
