package jdbc;

/**
 * Created by mingfei.net@gmail.com
 * 1/9/17 16:39
 */
public class StaticBlockTest {
    static {
        System.out.println("static1...");
    }
    static {
        System.out.println("static2...");
    }

    {
        System.out.println("constructor block...");
    }

    public StaticBlockTest() {
        System.out.println("constructor...");
    }

    public static void main(String[] args) {
        System.out.println("main...");
        StaticBlockTest staticBlockTest = new StaticBlockTest();
    }
}
