package day1016;

/**
 * @author : S.H.CHA
 */
public class TestVO {
    private String name;
    private int myAge;

    public TestVO(){
        System.out.println("기본 생성자");
    }
    public TestVO(String name, int myAge) {
        this.name = name;
        this.myAge = myAge;
        System.out.println("매개변수 있는 생성자");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMyAge() {
        return myAge;
    }

    public void setMyAge(int myAge) {
        this.myAge = myAge;
    }

    @Override
    public String toString() {
        return "TestVO{" +
                "name='" + name + '\'' +
                ", myAge=" + myAge +
                '}';
    }
}
