package com.tissue.commons.security;

public class Viewer {
    private final String username;
    private final String displayName;

    public Viewer(String username, String displayName) {
        this.username = username;
        this.displayName = displayName;
    }

    public String getUsername() {
        return username;
    }

    public String getDisplayName() {
        return displayName;
    }
}
