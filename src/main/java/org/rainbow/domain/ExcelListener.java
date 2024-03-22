package org.rainbow.domain;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.rainbow.company.ProductManagement.domain.prdInputVO;
import org.rainbow.company.ProductManagement.domain.suppliersVO;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;

/** 엑셀 파일 읽어서 리스트로 리턴해주는 클래스 VO만 갈아끼면 재사용 용이함. */
public class ExcelListener {
	// 동적으로 받으면 더귀찮아져서 나중에 손볼생각. 일단 매서드를 늘려가는 방향으로 진행
//	public List<Object> handleExcel(InputStream inputStream, Class<?> clazz) throws IOException 
//    {
//        final List<Object> dataList = new ArrayList<>();
//
//        EasyExcel.read(inputStream, clazz, new AnalysisEventListener<Object>()
//        {
//            @Override
//            public void invoke(Object data, AnalysisContext context) 
//            {
//                dataList.add(data);
//            }
//
//            @Override
//            public void doAfterAllAnalysed(AnalysisContext context)
//            {
//                // Excel 파일의 모든 데이터를 읽고 처리한 후에 호출되는 메소드
//                // 여기서 후속 작업을 수행할 수 있음
//            }
//
//        }).sheet().doRead();
//
//        return dataList;
//    }

	public List<prdInputVO> handleExcel(InputStream inputStream) throws IOException {
		final List<prdInputVO> dataList = new ArrayList<>();

		EasyExcel.read(inputStream, prdInputVO.class, new AnalysisEventListener<prdInputVO>() {
			/** 여기서 data 객체를 검증하거나 가공할 수 있음 */
			@Override
			public void invoke(prdInputVO data, AnalysisContext context) {
				dataList.add(data);
			}

			@Override
			public void doAfterAllAnalysed(AnalysisContext context) {
				// Excel 파일의 모든 데이터를 읽고 처리한 후에 호출되는 메소드
				// 여기서 후속 작업을 수행할 수 있음

			}

		}).sheet().doRead();

		return dataList;
	}

	/** 공급처 엑셀로 인풋 메서드 */
	public List<suppliersVO> supsExcelListner(InputStream inputStream) throws IOException {
		final List<suppliersVO> dataList = new ArrayList<>();

		EasyExcel.read(inputStream, suppliersVO.class, new AnalysisEventListener<suppliersVO>() {
			/** 여기서 data 객체를 검증하거나 가공할 수 있음 */
			@Override
			public void invoke(suppliersVO data, AnalysisContext context) {
				dataList.add(data);
			}

			@Override
			public void doAfterAllAnalysed(AnalysisContext context) {
				// Excel 파일의 모든 데이터를 읽고 처리한 후에 호출되는 메소드
				// 여기서 후속 작업을 수행할 수 있음

			}

		}).sheet().doRead();

		return dataList;
	}// supsExcelListner 끝

	
	
	public List<HashMap<String, Object>> cMemberExcelListner(InputStream inputStream) throws IOException {
	    final List<HashMap<String, Object>> dataList = new ArrayList<>();

	    EasyExcel.read(inputStream, new AnalysisEventListener<Map<Integer, String>>() {
	        @Override
	        public void invoke(Map<Integer, String> rowData, AnalysisContext context) {
	            // HashMap 객체 생성
	            HashMap<String, Object> dataMap = new HashMap<>();

	            // Excel 열 데이터를 HashMap에 저장합니다.
	            dataMap.put("cEmpName", rowData.get(0)); // 첫 번째 열 데이터를 cEmpName 키에 저장
	            dataMap.put("cEmpTel", rowData.get(1)); // 두 번째 열 데이터를 cEmpTel 키에 저장
	            dataMap.put("cEmpEmail", rowData.get(2)); // 세 번째 열 데이터를 cEmpEmail 키에 저장
	            dataMap.put("cEmpPosition", rowData.get(3)); // 네 번째 열 데이터를 cEmpPosition 키에 저장
	            dataMap.put("cEmpBirth", rowData.get(4)); // 다섯 번째 열 데이터를 cEmpBirth 키에 저장

	            // HashMap을 dataList에 추가합니다.
	            dataList.add(dataMap);
	        }

	        @Override
	        public void doAfterAllAnalysed(AnalysisContext context) {
	            // Excel 파일의 모든 데이터를 읽고 처리한 후에 호출되는 메서드
	            // 여기서 후속 작업을 수행할 수 있음
	        }
	    }).sheet().doRead();

	    return dataList;
	}

}
