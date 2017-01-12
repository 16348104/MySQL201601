package model;

/**
 * Created by mingfei.net@gmail.com
 * 1/12/17 16:02
 */
public class Emp {
    private int empno;
    private String ename;
    private String job;

    public Emp() {
    }

    public Emp(int empno, String ename, String job) {

        this.empno = empno;
        this.ename = ename;
        this.job = job;
    }

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empno=" + empno +
                ", ename='" + ename + '\'' +
                ", job='" + job + '\'' +
                '}';
    }
}
