package io.uicp.tincat.mantou.exception;

public class ThreadException extends Exception {

	/**
	 * 串相关异常
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void printStackTrace() {
		// TODO Auto-generated method stub
		super.printStackTrace();
	}

	public ThreadException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThreadException(String arg0, Throwable arg1, boolean arg2,
			boolean arg3) {
		super(arg0, arg1, arg2, arg3);
		// TODO Auto-generated constructor stub
	}

	public ThreadException(String arg0, Throwable arg1) {
		super(arg0, arg1);
		// TODO Auto-generated constructor stub
	}

	public ThreadException(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public ThreadException(Throwable arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	

}
