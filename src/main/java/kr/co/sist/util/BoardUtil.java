package kr.co.sist.util;

import kr.co.sist.user.board.SearchVO;

/**
 * @author : S.H.CHA
 * 필드에서 받아온 값(1,2,3)을 제목,내용,작성자로 변경하는 일을 하는 Util Class
 */
public class BoardUtil {
    private static String[] columnName = {"subject", "content", "writer"};

    public static String numToField(String fieldNum) {
        return columnName[Integer.parseInt(fieldNum)];
    }


    /**
     * 페이지네이션을 사용하면 매개변수로 입력되는 객체의
     * currentPage 번호, totalPage 수, totalCOunt 수
     * 검색을 수행하면 field='0', keyword, url이 반드시 입력되어야 한다.
     * @param sVO
     * @return
     */
    public String pagination(SearchVO sVO) {
        StringBuilder pagination = new StringBuilder();

        if (sVO.getTotalCount() != 0) {


            // 1. 한 화면에 보여줄 페이지네이션의 수 [1][2][3]
            int pageNumber = 3;

            // 2. 화면에 보여줄 시작페이지 번호(1,2,3 이면 1시작 4,5,6이면 4시작, 7,8,9면 7시작)
            int startPage = ((sVO.getCurrentPage() - 1) / pageNumber) * pageNumber + 1;

            // 3. 화면에 보여줄 마지막 페이지 번호
            int endPage = startPage + pageNumber - 1;

            // 4. 총 페이지 수가 연산된 마지막 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정됨.
            if (sVO.getTotalPage() <= endPage) {
                endPage = sVO.getTotalPage();
            }

            // 5. 첫 페이지가 인덱스 화면이 아닐때 ( 3보다 큰 경우)
            int movePage = 0;
            StringBuilder prevMark = new StringBuilder();
            prevMark.append("");

            if (sVO.getCurrentPage() > pageNumber) {
                prevMark.delete(0, prevMark.length());
                // 이전으로 가기 링크를 활성화 시켜준다.
                movePage = startPage - 1; // 4,5,6 -> 2  7,8,9 -> 3
                prevMark
                        .append("[ <a href=\"")
                        .append(sVO.getUrl())
                        .append("?currentPage=")
                        .append(movePage);
                // 검색 키워드가 존재할 때.
                if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                    prevMark.append("&field=").append(sVO.getField()).append("&keyword=").append(sVO.getKeyword());
                }
                prevMark.append("\">&lt;&lt;</a> ]");
            }
            prevMark.append(" ... ");

            pagination.append(prevMark);

            movePage = startPage;

            StringBuilder pageLink = new StringBuilder();

            while (movePage <= endPage) {

                if (movePage == sVO.getCurrentPage()) {
                    pageLink.append("[ ").append(movePage).append(" ]");
                } else {
                    // 현재페이지가 아니라면 링크를 설정한다.
                    pageLink.append("[ <a href='")
                            .append(sVO.getUrl())
                            .append("?currentPage=")
                            .append(movePage);

                    // 검색 키워드가 존재할 때.
                    if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                        pageLink.append("&field=").append(sVO.getField()).append("&keyword=").append(sVO.getKeyword());
                    }

                    pageLink.append("'>").append(movePage).append("</a> ]");

                }
                movePage++;
            }
            pagination.append(pageLink);
            pagination.append(" ... ");

            // 7. 뒤에 페이지가 더 있는 경우
            StringBuilder nextMark = new StringBuilder();
            nextMark.append("[ &gt;&gt; ]");

            if (sVO.getTotalPage() >= endPage) {
                nextMark.delete(0, nextMark.length());
                movePage = endPage + 1;

                nextMark.append("[<a href='").append(sVO.getUrl()).append("?currentPage=").append(movePage);
                // 검색 키워드가 존재할 때.
                if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
                    nextMark.append("&field=").append(sVO.getField()).append("&keyword=").append(sVO.getKeyword());
                }
                nextMark.append("'>").append(" &gt;&gt;</a> ]");
            }
            pagination.append(nextMark);
        }
        return pagination.toString();

    }
}
