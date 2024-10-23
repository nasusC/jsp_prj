package kr.co.sist.user.login;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.member.WebMemberVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author : S.H.CHA
 */
public class LoginDAO {
    private static LoginDAO lDAO;
    private LoginDAO(){

    }

    public static LoginDAO getInstance(){
        if(lDAO == null){
            lDAO = new LoginDAO();
        }
        return lDAO;
    }

    /**
     * 자바의 객체는 하나이므로 입력된 객체에 값을 넣으면 저장된 값을 호출한 곳에서
     * getter를 호출하여 사용할 수 잇다.
     * @param wmVO - 입력값과 조회결과를 저장할 VO
     * @throws SQLException
     */
    public WebMemberVO selectLogin(WebMemberVO wmVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConnection();

            // SQL 쿼리 수정 - 필요한 모든 컬럼 조회
            StringBuilder select = new StringBuilder();
            select.append("SELECT id, name, tel, email, gender, location, ")
                    .append("zipcode, addr addr1, addr2 ")
                    .append("FROM web_member ")
                    .append("WHERE id = ? AND pass = ?");

            System.out.println("실행될 쿼리: " + select);
            System.out.println("ID: " + wmVO.getId());
            System.out.println("암호화된 비밀번호: " + wmVO.getPass());

            pstmt = con.prepareStatement(select.toString());
            pstmt.setString(1, wmVO.getId());
            pstmt.setString(2, wmVO.getPass());

            rs = pstmt.executeQuery();

            if(rs.next()) {
                // 모든 필요한 데이터 설정
                wmVO.setId(rs.getString("id"));
                wmVO.setName(rs.getString("name"));
                wmVO.setCellphone(rs.getString("tel"));
                wmVO.setEmail(rs.getString("email"));
                wmVO.setGender(rs.getString("gender"));
                wmVO.setLocation(rs.getString("location"));
                wmVO.setZipcode(rs.getString("zipcode"));
                wmVO.setAddr1(rs.getString("addr1"));
                wmVO.setAddr2(rs.getString("addr2"));

                System.out.println("로그인 성공: " + wmVO.getName());
            } else {
                System.out.println("로그인 실패: 일치하는 사용자 정보 없음");
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return wmVO;
    }
}
