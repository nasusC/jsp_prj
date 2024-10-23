package day1018;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author : S.H.CHA
 */
public class DataDAO {

    public List<DataVO> selectData(){
        List<DataVO> list = new ArrayList<>();
        if(new Random().nextBoolean()){
        list.add(new DataVO("img.png","3조 조원 이인혁","모든일에 최선을 다하는 조원입니다",1));
        list.add(new DataVO("img2.jpg","페페","이게 뭐에여???",2));
        list.add(new DataVO("img3.jpg","침흘리는 페페","침흘리는중.",3));
        list.add(new DataVO("img4.jpg","햄스터","방가방가 햄토리",4));
        }

        return list;
    }
}
