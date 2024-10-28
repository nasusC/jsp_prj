package kr.co.sist.user.board;

/**
 * @author : S.H.CHA
 */

import java.sql.SQLException;

/**
 * 현재페이지, 시작번호, 끝 번호, 검색 컬럼, 검색 값, 검색URL
 */
public class SearchVO {
    // 검색하려고 하는 시작번호, 끝번호, 현재페이지번호, 총페이지 수, 총게시물의 수
    private int startNum, endNum, currentPage, totalPage, totalCount;


    // field = 검색할 필드에 대응되는 숫자 컬럼명(제목0, 내용1, 작성자2)
    // keyword = 검색할 내용(값)
    // url = 이동할 URL
    private String field="0", keyword, url;

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getEndNum() {
        return endNum;
    }

    public void setEndNum(int endNum) {
        this.endNum = endNum;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public String toString() {
        return "SearchVO{" +
                "startNum=" + startNum +
                ", endNum=" + endNum +
                ", currentPage=" + currentPage +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", field='" + field + '\'' +
                ", keyword='" + keyword + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
