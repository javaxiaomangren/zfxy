package com.windy.zfxy.utils;

public class DaoException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public DaoException() {
	}

	public DaoException(String arg0) {
		super(arg0);
	}

	public DaoException(Throwable arg0) {
		super(arg0);
	}

	public DaoException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

}
