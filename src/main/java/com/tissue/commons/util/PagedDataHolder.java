package com.tissue.commons.util;

import java.util.List;
import java.util.ArrayList;

public class PagedDataHolder<E> {
    private long currentPage;
    private long pageSize;

    private long totalItems;
    private List<E> pagedItems;
    
    private long startPage;
    private long endPage;
    private long totalPages;


    public PagedDataHolder(long currentPage, long pageSize, long totalItems) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalItems = totalItems;
        init();
    }

    public void setPagedItems(List<E> pagedItems) {
        this.pagedItems = pagedItems;
    }

    public List<E> getPagedItems() {
        if(pagedItems == null) {
            pagedItems = new ArrayList();
        }
        return pagedItems;
    }

    public long getTotalItems() {
        return totalItems;
    }

    public long getCurrentPage() {
        return currentPage;
    }

    public long getPageSize() {
        return pageSize;
    }

    public long getStartPage() {
        return startPage;
    }

    public long getEndPage() {
        return endPage;
    }

    public long getTotalPages() {
        return totalPages;
    }

    public List<Long> getPagesList() {
        List<Long> pagesList = new ArrayList();
        for(long i= startPage; i<= endPage; i++) {
            pagesList.add(i);
        }
        return pagesList;
    }

    private void init() {
        calcTotalPages();
        setupPagesList();
    }

    private void calcTotalPages() {
        int patch = (totalItems % pageSize) > 0 ? 1 : 0;
        long pages = totalItems / pageSize;
        this.totalPages = pages + patch;
    }

    private void setupPagesList() {
        if(totalPages <= 6) {
            startPage = 1;
            endPage = totalPages;
        }
        else {
            if(currentPage <= 4) {
                startPage = 1;
                endPage = 5;
            }
            else {
                startPage = currentPage - 2;
                endPage = currentPage + 2;
                if((endPage + 2) > totalPages) {
                    endPage = totalPages;
                    startPage = endPage - 4;
                }
            }
        }
    }
}
