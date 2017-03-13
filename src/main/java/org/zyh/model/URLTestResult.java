package org.zyh.model;

import lombok.Getter;
import lombok.Setter;

/**
 * @author zouyonghao
 */
@Getter
@Setter
public class URLTestResult {

    private boolean result;

    private URLTest urlTest;

    private String realValue;
}
