package ip;

/**
 * Created by mingfei.net@gmail.com
 * 1/13/17 17:00
 */
public class Test {
    public static void main(String[] args) {
        String s = "abcd           1234 中国 北京";
        String [] strings = s.split("\\s+");
        System.out.println(strings.length);
        System.out.println(strings[0]);
        System.out.println(strings[1]);
        System.out.println(strings[2]);

        System.out.println(s.replace(strings[0], "").replace(strings[1], "").trim());
    }
}
