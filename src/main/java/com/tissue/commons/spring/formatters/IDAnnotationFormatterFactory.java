package com.tissue.commons.spring.formatters;

import org.springframework.format.AnnotationFormatterFactory;
import org.springframework.format.Parser;
import org.springframework.format.Printer;
import java.util.Set;
import java.util.HashSet;

public class IDAnnotationFormatterFactory implements AnnotationFormatterFactory<IDFormat> {
    public Set<Class<?>> getFieldTypes() {
        Set<Class<?>> set = new HashSet();
        set.add(String.class);
        return set;
    }

    public Parser<String> getParser(IDFormat arg0, Class<?> arg1) {
        return new IDFormatter();
    }

    public Printer<String> getPrinter(IDFormat annotation, Class<?> fieldType) {
        return new IDFormatter();
    }
}
