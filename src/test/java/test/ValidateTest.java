package test;

public class ValidateTest {
	
	public static void main(String[] args) {
		String string = ValidateTest.class.getResource("/").getFile().toString();
		System.out.println(string);
	}
	
}
