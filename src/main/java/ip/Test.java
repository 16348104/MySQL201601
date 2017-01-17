package ip;

/**
 * Created by mingfei.net@gmail.com
 * 1/13/17 17:00
 */
public class Test {
    public static void main(String[] args) {
        String s = "1.1.1.2         1.1.1.255       澳大利亚 谷歌公司AS55698-APNIC-LABS印尼网络(Research prefix for APNIC Labs专用)";
        String [] strings = s.split("\\s+");
//        System.out.println(strings.length);
        System.out.println(strings[0]);
        System.out.println(strings[1]);
//        System.out.println(strings[2]);

        System.out.println(s.replaceFirst(strings[0], "").replaceFirst(strings[1], "").trim());
    }
}
