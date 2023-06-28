<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책마루도서관</title>
<style>
	#main{max-width: 1200px; min-height: 682px;}
	#mid{min-width: 1800px;}
	#locationTable {
 		margin: 0 auto;
 		padding: 10px;
	}
	#locationMap{
		margin: 0 auto;
		width: 1200px;
	 	height: 800px;
	}
	#locationTable th, td {
		padding: 10px;
	}
</style>
</head>
<body>


	<!-- top.jsp -->
	<%@ include file="../../../WEB-INF/views/common/top3.jsp" %>
	
	  <div class="row" id="mid">
	  
	    <!-- 화면 중앙 왼쪽 -->
	    <div class="col-2">
	      <%@ include file="../../../WEB-INF/views/common/sideGui.jsp" %>
	    </div>
	    
	    <!-- 중앙 영역 -->
	    <div class="col-8" id="main">
	    <br>
	       <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	        <h1 class="h1">책마루 위치</h1>
	      </div>
	      <br>
			  <div>
			    <table class="text-center table-bordered table-striped" id="locationTable">
			      <tbody>
			        <tr>
			         	<th class="bg-light">주소</th>
			            <td>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F (T: 1544-9970 / F: 02-722-0858)</td>
			        </tr>
			        <tr>
			            <th class="bg-light">버스</th>
			            <td>우리은행 종로지점 정류장<br>
							지선 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62<br>
							마을 7017 / 7021 / 7022<br>         
							간선 8110</td>
			        </tr>
			        <tr>
			            <th class="bg-light">지하철</th>
			            <td>지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M</td>
			        </tr>
			      </tbody>
			    </table>
			  </div>
			  <br>
			  <div>
			  	<div class="text-center">
				  	<a href="https://map.kakao.com/?urlX=496259&urlY=1130042&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false" target="_blank">
				  		<img width="504" height="310" src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=0.625&MX=496259&MY=1130042&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border:1px solid #ccc">
				  	</a>
			  	</div>
			  	<div class="hide" style="overflow:hidden;padding:7px 11px;border:1px solid #dfdfdf;border-color:rgba(0,0,0,.1);border-radius:0 0 2px 2px;background-color:#f9f9f9;width:482px;margin: 0 auto;">
			  		<strong style="float: left;">
			  			<img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵">
			  		</strong>
				  	<div style="float: right;position:relative">
				  		<a style="font-size:12px;text-decoration:none;float:left;height:15px;padding-top:1px;line-height:15px;color:#000" target="_blank" href="https://map.kakao.com/?urlX=496259&urlY=1130042&urlLevel=1&map_type=TYPE_MAP&map_hybrid=false">
				  			지도 크게 보기
				  		</a>
				  	</div>
			  	</div>
			  </div>
			  <br>
<!-- 			  <iframe src="http://kko.to/u-CjuuzW_4" width="1200" height="900"></iframe> -->
	    </div>
	    
	    <!-- 화면 중앙 오른쪽 여백 생성 -->
	    <div class="col-2">
	    </div>
	    
	  </div>
	  
	<!-- bottom.jsp -->
	<%@ include file="../../../WEB-INF/views/common/bottom.jsp" %>

</body>
</html>