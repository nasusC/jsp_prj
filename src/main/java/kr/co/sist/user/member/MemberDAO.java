package kr.co.sist.user.member;

import day1016.MemberVO;
import kr.co.sist.dao.DbConnection;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author : S.H.CHA
 */
public class MemberDAO {
    private static MemberDAO mDAO;

    private MemberDAO(){

    }

    public static MemberDAO getInstance(){
        if(mDAO == null){
            mDAO = new MemberDAO();
        }
        return mDAO;
    }

    /*
     * myJstar 아이디를 입력받아서 DB에서 검색하여 아이디가 존재하면 true, false 반환
     * @Param id 중복 검사할 id
     * @return
     * @throw SQLExceoption
     */
    public boolean selectId(String id) throws SQLException, NamingException {
        boolean resultFlag = false;
        // 이것이 하나의 트랜잭션............
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //1.JNDI 사용 객체 생성
        //2. DBCP에서 DataSource 얻기
        DbConnection dbConn = DbConnection.getInstance();

        //3. Connection 얻기
        try {
            conn = dbConn.getConnection();

            //4. 퀴리문 생성객체 얻기
            String selectId="select id from web_member where id=?";

            pstmt = conn.prepareStatement(selectId);
            //5. 바인드 변수에 값 설정
            pstmt.setString(1, id);

            //6. 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();

            resultFlag = rs.next();

        } finally {
            //7. 연결 끊기
            dbConn.dbClose(rs, pstmt,conn);
        }
        return resultFlag;
    }

    // 회원 가입
    public void insertWebMember(WebMemberVO webMemberVO) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        DbConnection dbConn = DbConnection.getInstance();
        try{
            conn = dbConn.getConnection();

            StringBuilder insertWebMember = new StringBuilder();
            insertWebMember
                    .append("insert into web_member(id, pass, name, birth, tel, tel_flag, email, gender, location, zipcode, addr, addr2, ip) ")
                    .append("values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pstmt = conn.prepareStatement(insertWebMember.toString());

            // 전화번호 형식 처리 (숫자와 하이픈만 허용)
            String tel = webMemberVO.getCellphone().replaceAll("[^0-9-]", "");
            if(tel.length() > 13) {
                tel = tel.substring(0, 13);
            }

            pstmt.setString(1, webMemberVO.getId());
            pstmt.setString(2, webMemberVO.getPass());
            pstmt.setString(3, webMemberVO.getName());
            pstmt.setString(4, webMemberVO.getBirth());
            pstmt.setString(5, tel);
            pstmt.setString(6, webMemberVO.getSave());
            pstmt.setString(7, webMemberVO.getEmail());
            pstmt.setString(8, webMemberVO.getGender());
            pstmt.setString(9, webMemberVO.getLocation());
            pstmt.setString(10, webMemberVO.getZipcode());
            pstmt.setString(11, webMemberVO.getAddr1());
            pstmt.setString(12, webMemberVO.getAddr2());
            pstmt.setString(13, webMemberVO.getIp());

            pstmt.executeUpdate();

            if(webMemberVO.getLang() != null) {
                insertLang(webMemberVO);
            }
        } finally {
            dbConn.dbClose(null, pstmt, conn);
        }
    }

    // 선택한 언어
    public int insertLang(WebMemberVO webMemberVO) throws SQLException, NamingException {
        int cntLang=0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        //1. JNDI  사용 객체 사용
        //2. DBCP에서 DataSource 얻기
        DbConnection dbConn = DbConnection.getInstance();
        try{
            //3. Connection 얻기
            conn =dbConn.getConnection();

            //4. 쿼리문 생성 객체 얻기
            String insertLang = "insert into web_lang(id,lang) values(?,?)";


            //5. 바인드변수에 값 설정
            pstmt = conn.prepareStatement(insertLang);

            // 반복문 -> lang을 선택한 갯수 만큼 삽입
            for (String lang : webMemberVO.getLang()) {
                pstmt.setString(1, webMemberVO.getId());
                pstmt.setString(2, lang);
//               값이 삽입된 숫자와 lang.length() 크기와 같다면 올바르게 삽인된것. 트랜잭션 처리
                //6. 쿼리문 수행 후 결과 얻기
                cntLang += pstmt.executeUpdate();
            }

        }finally {
            //7. 연결 끊기
            dbConn.dbClose(null, pstmt,conn);
        }

        return cntLang;
    }

} // MemberDAO 끝
