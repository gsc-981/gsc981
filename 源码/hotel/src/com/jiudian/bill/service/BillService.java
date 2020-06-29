package com.jiudian.bill.service;

import com.jiudian.bill.entity.Bill;
import com.jiudian.core.base.BaseService;

public interface BillService extends BaseService<Bill> {
    public String billsPagination(int page, int limit);

    public String paybill(String checkinid);
}
