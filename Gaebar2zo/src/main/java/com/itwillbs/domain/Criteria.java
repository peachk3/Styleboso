package com.itwillbs.domain;

/**
 * 페이징 처리를 위해 생성된 객체
 *  -> 페이지 정보, 개수 저장
 *  -> 검색 기능 추가
 */
public class Criteria {
    private int page;
    private int pageSize;
    private String searchType;  // 검색 타입 추가
    private String keyword;     // 검색 키워드 추가

    public Criteria() {
        this.page = 1;
        this.pageSize = 10;
        // 기본 생성자 생성될때 page 1, pageSize 10 으로 초기화 하겠다
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        if (pageSize <= 0 || pageSize > 100) {
            this.pageSize = 10;
            return;
        }
        this.pageSize = pageSize;
    }

    // 페이징 처리에서 필요한 시작위치 계산 ( mapper에서만 사용 )
    public int getPageStart() {
        return (this.page - 1) * this.pageSize;
    }

    // 검색 타입 getter와 setter
    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    // 검색 키워드 getter와 setter
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", pageSize=" + pageSize + 
               ", searchType=" + searchType + ", keyword=" + keyword + "]";
    }
}