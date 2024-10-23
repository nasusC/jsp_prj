package day1016;

/**
 * @author : S.H.CHA
 */
public class CounterVO {
    private int cnt;
    public CounterVO(){
        System.out.println("카운트VO 객체 생성");
    }

    @Override
    public String toString() {
        return "CounterVO{" +
                "cnt=" + cnt +
                '}';
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt += cnt;
    }
}
