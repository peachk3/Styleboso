package com.itwillbs.domain;

import java.util.List;

import lombok.Data;

@Data
public class StatusUpdateRequest {
    private List<String> tran_nums;
    private String pro_status;
    private List<String> top_tran_nums;
    
}
