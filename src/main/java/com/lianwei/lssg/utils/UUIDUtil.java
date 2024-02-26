/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/4/14
  Time: 9:33
*/
package com.lianwei.lssg.utils;

import java.util.UUID;

/**
 * UUID工具类
 *
 * @author Mr.Ding
 * @time 2019年6月13日上午9:09:25
 */
public class UUIDUtil {
    /**
     * 带-的UUID
     *
     * @return 36位的字符串
     */
    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * 去掉-的UUID
     *
     * @return 32位的字符串
     */
    public static String getUUID2() {
        return UUID.randomUUID().toString().replace("-", "");
    }

}

