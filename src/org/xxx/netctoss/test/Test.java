package org.xxx.netctoss.test;

/**
 * Created by JEWELZ on 15/6/15.
 */
public class Test {
    public static void main(String[] args) {

    }

    @org.junit.Test
    public void replaceSpace() {
        String str = "hello world";
        if (str == null)
            return;
        char[] arr = str.toString().toCharArray();
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == ' ')
                res.append("%20");
            else
                res.append(arr[i]);
        }
        System.out.println(res.toString());
    }

    @org.junit.Test
    public void Test() {
        System.out.println(111);
    }

}
