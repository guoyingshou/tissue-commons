package com.tissue.commons.util;

public class Pager {
    private long total;
    private int current;
    private int size;

    public Pager(long total, int current, int size) {
        this.total = total;
        this.current = current;
        this.size = size;
    }

    public long getTotal() {
        return total;
    }

    public int getCurrent() {
        return current;
    }

    public int getSize() {
        return size;
    }
}
