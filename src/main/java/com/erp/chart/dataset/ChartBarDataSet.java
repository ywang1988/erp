package com.erp.chart.dataset;

import com.erp.chart.jdbc.ChartJdbc;
import org.jfree.data.general.Dataset;

/**
 * Created by wang_ on 2016-08-13.
 */
public class ChartBarDataSet extends BaseDataSet {

    public Dataset createDataSet() {
        return ChartJdbc.getWlCategoryDataset(this.getBaseBean().getWlbm());
    }
}
