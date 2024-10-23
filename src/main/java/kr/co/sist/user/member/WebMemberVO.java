package kr.co.sist.user.member;

import java.util.Arrays;

/**
 * @author : S.H.CHA
 */

public class WebMemberVO {
    private String id;             // 아이디
    private String pass;           // 비밀번호
    private String name;           // 이름
    private String birth;          // 생년월일
    private String cellphone;      // 전화번호
    private String save;           // 전화번호 저장 플래그
    private String email;          // 이메일
    private String gender;         // 성별
    private String location;       // 지역
    private String zipcode;        // 우편번호
    private String addr1;          // 기본주소
    private String addr2;          // 상세주소
    private String ip;             // IP 주소
    private String[] lang;         // 관심 언어 (배열)

    public WebMemberVO() {
    }

    // 필수 필드만을 위한 생성자 추가
    public WebMemberVO(String id, String pass) {
        this.id = id;
        this.pass = pass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getSave() {
        return save;
    }

    public void setSave(String save) {
        this.save = save;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String[] getLang() {
        return lang;
    }

    public void setLang(String[] lang) {
        this.lang = lang;
    }

    @Override
    public String toString() {
        return "WebMemberVO{" +
                "id='" + id + '\'' +
                ", pass='" + pass + '\'' +
                ", name='" + name + '\'' +
                ", birth='" + birth + '\'' +
                ", cellphone='" + cellphone + '\'' +
                ", save='" + save + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", location='" + location + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", ip='" + ip + '\'' +
                ", lang=" + Arrays.toString(lang) +
                '}';
    }
} // web_memberVO 끝

