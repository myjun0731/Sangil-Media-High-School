package Class05;

abstract class Shape {
	abstract double getArea();
}

class Circle extends Shape {
	double radius = 2.0;

	@Override
	double getArea() {
		// TODO Auto-generated method stub
		return 3.14 * radius * radius;
	}
}

class Rectangle extends Shape {
	int width = 3, height = 4;

	@Override
	double getArea() {
		// TODO Auto-generated method stub
		return width * height;
	}

}

public class Java_Code_01 {
	public static void main(String[] args) {
		Shape[] Shapes = { new Circle(), new Rectangle() };
		for (Shape s : Shapes) {
			System.out.println("넓이 :" + s.getArea());
		}
	}
}