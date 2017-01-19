package ip;

import java.io.*;

/**
 * Created by mingfei.net@gmail.com
 * 1/19/17 09:37
 */
public class FormatData {
    public static void main(String[] args) {
        // 1.2.3.4      5.6.7.8      some location...
        // 1.2.3.4|5.6.7.8       some location...
        // 1.2.3.4|5.6.7.8|some location...
        try (
                BufferedReader reader = new BufferedReader(new FileReader("day7/new_ip.txt"));
                BufferedWriter writer = new BufferedWriter(new FileWriter("day7/ip.txt"))
        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.replaceFirst("\\s+", "|").replaceFirst("\\s+", "|");
                writer.write(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
