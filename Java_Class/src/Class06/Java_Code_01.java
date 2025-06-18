package Class06;

class Box<T> {
	private T item;

	public void setItem(T item) {
		this.item = item;
	}

	public T getItem() {
		return item;
	}
}

public class Java_Code_01 {
	public static void main(String[] args) {
		Box<String> StringBox = new Box<>();
		StringBox.setItem("Hello");
		System.out.println("문자열 상자 : " + StringBox.getItem());

		Box<Integer> intBox = new Box<>();
		intBox.setItem(123);
		System.out.println("정수 상자 : " + intBox.getItem());
	}
}