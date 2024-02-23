package org.rainbow.domain;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.rainbow.ProductManagement.domain.prdInputVO;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;

/** 엑셀 파일 읽어서 리스트로 리턴해주는 클래스 VO만 갈아끼면 재사용 용이함. */
public class ExcelListener
{
    public List<prdInputVO> handleExcel(InputStream inputStream) throws IOException 
    {
        final List<prdInputVO> dataList = new ArrayList<>();

        EasyExcel.read(inputStream, prdInputVO.class, new AnalysisEventListener<prdInputVO>() 
        {
        	/** 여기서 data 객체를 검증하거나 가공할 수 있음  */
            @Override
            public void invoke(prdInputVO data, AnalysisContext context) 
            {
                // 
                if (isValid(data))
                {
                    dataList.add(data);
                }
                else 
                {
                    // 유효하지 않은 데이터 처리 
                	
                }
            }
            
            @Override
            public void doAfterAllAnalysed(AnalysisContext context) 
            {
            	// Excel 파일의 모든 데이터를 읽고 처리한 후에 호출되는 메소드
                // 여기서 후속 작업을 수행할 수 있음

            }
            
        }).sheet().doRead();

        return dataList;
    }
    
    /** 데이터 유효성 검사 로직  필요한 필드가 비어있지 않은지 등을 체크 사용시 자기 데이터 타입과 맞추거나 제거하고 사용하셔도 괜찮습니다.*/
    private boolean isValid(prdInputVO data) 
    {	
    	// 엑셀 첫 컬럼 공급처명 이 비었는지 체크..
        return data != null && data.getPrdName() != null && !data.getPrdName().isEmpty();
    }
    
    
 
    
    
    
}

