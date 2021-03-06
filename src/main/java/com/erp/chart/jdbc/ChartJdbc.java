package com.erp.chart.jdbc;

import com.erp.util.JdbcUtil;
import com.erp.util.StringUtil;
import com.erp.util.TableNameConstant;
import org.apache.log4j.Logger;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by wang_ on 2016-06-30.
 */
public class ChartJdbc {
    private static final Logger logger = Logger.getLogger(ChartJdbc.class);

    /**
     * @param wlbm
     * @return
     */
    public static DefaultCategoryDataset getWlCategoryDataset(String wlbm) {
        Connection connection = JdbcUtil.getConnection();
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select a.price,a.shoppingtime,w.wlmc from (select top 3 wlbm,price,shoppingtime " +
                    "from "+TableNameConstant.T_YW+" where (wlbm=? or 0 = ?) and is_del='0' " +
                    "order by shoppingtime desc) a " +
                    "left join "+TableNameConstant.T_WL+" w on a.wlbm=w.wlbm and w.is_del='0' " +
                    "order by a.shoppingtime asc ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, StringUtil.isEmpty(wlbm) ? "erp" : wlbm);
            ps.setInt(2, StringUtil.isEmpty(wlbm) ? 0 : 1);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.addValue(rst.getDouble("price"), rst.getString("wlmc"), rst.getDate("shoppingtime"));
            }
        } catch (SQLException e) {
            logger.error("获取数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

    /**
     * @param wlbm
     * @return
     */
    public static DefaultCategoryDataset getWlCategoryDataset1(String wlbm) {
        Connection connection = JdbcUtil.getConnection();
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select a.price, convert(varchar(5),a.shoppingtime,110) as shoppingtime,w.wlmc " +
                    "from (select top 2 wlbm,price,shoppingtime from "+TableNameConstant.T_YW+" " +
                    "where (wlbm=? or 0 = ?) and is_del='0' order by shoppingtime desc) a " +
                    "left join "+TableNameConstant.T_WL+" w on a.wlbm=w.wlbm and w.is_del='0' " +
                    "order by a.shoppingtime asc ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, StringUtil.isEmpty(wlbm) ? "erp" : wlbm);
            ps.setInt(2, StringUtil.isEmpty(wlbm) ? 0 : 1);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.addValue(rst.getDouble("price"), rst.getString("wlmc"), rst.getString("shoppingtime"));
            }
        } catch (SQLException e) {
            logger.error("获取数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

    /**
     *
     * @return
     */
    public static DefaultCategoryDataset getYjCategoryDataset() {
        Connection connection = JdbcUtil.getConnection();
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select a.yjyf as yjyf, a.yjye as yjye from ( " +
                    "select top 12 yjyf,yjye from "+TableNameConstant.T_YJ+" where is_del='0' order by yjyf desc) a " +
                    "order by a.yjyf asc ";
            ps = connection.prepareStatement(sql);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.addValue(rst.getDouble("yjye"), "月度结算", rst.getString("yjyf"));
            }
        } catch (SQLException e) {
            logger.error("获取数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

    /**
     * @param wlbm
     * @return
     */
    public static DefaultPieDataset getWlPieDataset(String wlbm) {
        Connection connection = JdbcUtil.getConnection();
        DefaultPieDataset dataset = new DefaultPieDataset();
        if (StringUtil.isEmpty(wlbm)) return dataset;
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select price, shoppingtime from "+TableNameConstant.T_YW+" where is_del='0' and wlbm=? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, wlbm);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.setValue(rst.getDate("shoppingtime"), rst.getDouble("price"));
            }
        } catch (SQLException e) {
            logger.error("获取饼状数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

    /**
     * @param wlbm
     * @return
     */
    public static DefaultPieDataset getWlPieDataset1(String wlbm) {
        Connection connection = JdbcUtil.getConnection();
        DefaultPieDataset dataset = new DefaultPieDataset();
        if (StringUtil.isEmpty(wlbm)) return dataset;
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select price, convert(varchar(5),y.shoppingtime,110) as shoppingtime " +
                    "from "+TableNameConstant.T_YW+" where is_del='0' and wlbm=? ";
            ps = connection.prepareStatement(sql);
            ps.setString(1, wlbm);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.setValue(rst.getString("shoppingtime"), rst.getDouble("price"));
            }
        } catch (SQLException e) {
            logger.error("获取饼状数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

    /**
     *
     * @return
     */
    public static DefaultPieDataset getYjPieDataset() {
        Connection connection = JdbcUtil.getConnection();
        DefaultPieDataset dataset = new DefaultPieDataset();
        PreparedStatement ps = null;
        ResultSet rst = null;
        try {
            String sql = "select a.yjyf as yjyf, a.yjye as yjye from ( " +
                    "select top 12 yjyf,yjye from "+TableNameConstant.T_YJ+" where is_del='0' order by yjyf desc) a " +
                    "order by a.yjyf asc ";
            ps = connection.prepareStatement(sql);
            rst = ps.executeQuery();
            while (rst.next()) {
                dataset.setValue(rst.getString("yjyf"), rst.getDouble("yjye"));
            }
        } catch (SQLException e) {
            logger.error("获取饼状数据失败：" + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                JdbcUtil.close();
            }
        }

        return dataset;
    }

}
