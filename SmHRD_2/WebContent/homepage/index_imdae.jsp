<%@page import="com.model.ImdaeSearchDTO"%>
<%@page import="com.model.Rent_searchDTO"%>
<%@page import="com.model.Apt_name_searchDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Main_filterDAO"%>
<%@page import="com.model.Main_filterDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>���־���Ʈ���ݿ���</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
</head>
<style type="text/css">
.navbar-brand{
      font-size : 30px;
      font-weight : bold;
   }
   .my-4{
      font-weight : bold;
   }
   .green_window {
      display: inline-block;
      width: 500px; height: 40px;
      border: 3px solid #1b5ac2;
      background: white;
   }
   .input_text {
      width: 480; height: 20px;
      margin: 6px 0 0 9px;
      border: 0;
      line-height: 20px;
      font-size: 14px;
      outline: none;
      float : left;
   }
   .sch_smit {
      width: 100px; height: 40px;
      margin: 0; border: 0;
      vertical-align: top;
      background: #1b5ac2;
      color: white;
      font-weight: bold;
      border-radius: 1px;
      cursor: pointer;
   }
   .SelectSearch{
      width: 120px; height: 40px;
      border: 3px solid #1b5ac2;
      background: white;
      vertical-align: top;
   }
   .unit{
      text-align: right;
      font-size : 12px;
   }
   
   table {
     border-collapse: separate;
     border-spacing: 1px;
     text-align: left;
     line-height: 1.5;
     border-top: 1px solid #ccc;
     margin : 20px 10px;
     white-space: nowrap;
   }
   th {
     width: 150px;
     padding: 10px;
     font-weight: bold;
     vertical-align: top;
     border-bottom: 1px solid #ccc;
     white-space: nowrap;
   }
   td {
     width: 350px;
     padding: 10px;
     vertical-align: top;
     border-bottom: 1px solid #ccc;
     white-space: nowrap;
   }
   #basic, #junwall, #mat {
      display: none;
}
</style>

<body>

   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="index_main.jsp">100�ٹ�</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active">
                  <%
                  //���� ���� ������ֱ�.
                  MemberDTO info = (MemberDTO) session.getAttribute("info");
                  Main_filterDAO dao = new Main_filterDAO();
                  ArrayList<Main_filterDTO> AptSearchList = null;
                  ArrayList<Main_filterDTO> DongSearchList = null;
                  ArrayList<Rent_searchDTO> RentSearchList = null;
                  ArrayList<Main_filterDTO> MatSearchList = null;
                  ArrayList<ImdaeSearchDTO> ImdaeSearchList = null;
                  String mat_select = null;

                  if (info != null) {
                     /*���� �⺻���Ͱ� �ƴ� �������� �ÿ� �ʿ��� �κ� */
                  }%> 
                  <%if (info != null) {%>
               
               <li class="nav-item">
                  <%if (info.getId().equals("admin")) {%> 
                  <a class="nav-link" href="select.jsp">ȸ������ ����</a> 
                  <%}%>
               </li>
               <li class="nav-item"><a class="nav-link" href="favorite.jsp">���ã��</a></li>
               <li class="nav-item"><a class="nav-link" href="mypage.jsp">����������</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="LogoutService.do">�α׾ƿ�</a></li>

               <%} else {%>
               <li class="nav-item"><a class="nav-link" href="join.jsp">ȸ������</a></li>
               <li class="nav-item"><a class="nav-link" href="login.jsp">�α���</a></li>
               <%}%>
               </li>
            </ul>
         </div>
      </div>
   </nav>


   <!--���̵�޴�-->
   <div class="container">
      <div class="row">
         <div class="col-lg-3">
             <h4 class="my-4">�Ź�</h4>
            <div class="list-group">
               <a href="index_maemae.jsp" class="list-group-item" id="check1">�Ÿ�</a> 
               <a href="index_rent.jsp" class="list-group-item" id="check2">������</a>
            </div>
            <h4 class="my-4">����</h4>
            <div class="list-group">
               <a href="index_mat.jsp" class="list-group-item" id="check3">����</a>
               <%if(info != null){%>
               <a href="index_imdae.jsp" class="list-group-item" ">�Ӵ�</a>
               <%}else {%>
               <a href="" class="list-group-item" id="fake1">�Ӵ�</a>
               <%} %>               
            </div>
            <h4 class="my-4">����</h4>
            <div class="list-group">
               <%if(info != null){%>
               <a href="price.jsp" class="list-group-item">���� ����</a>
               <%}else {%>
                  <a href="" class="list-group-item" id="fake2">���� ����</a>
                  <%}%>
            </div>
         </div>

         <!-- /.col-lg-3 -->

         <!-- �Ÿ� -->
         <div class="col-lg-9">
            <div id="basic" class="raw">
               <h1>�Ź�</h1>
               <form action="SearchService.do" method="post">
                  <!-- radio�� �� -->
                  ����Ʈ<input type="radio" name="table" value="apt_name" > 
                  ��<input   type="radio" name="table" value="dong"> 
                  �˻� : <input type="text" name="search"> 
                  <input type="submit" value="�˻�">
               </form>

               <%DongSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("DongSearchList");
               if (DongSearchList != null) {
                  System.out.print("�� ����!!");
                  System.out.print(DongSearchList.size());%>
               <table>
                  <tr>
                     <td>���ã��</td>
                     <td>��ȣ</td>
                     <td>�Ÿ� ��ȣ</td>
                     <td>����Ʈ �̸�</td>
                     <td>�� �̸�</td>
                     <td>����</td>
                     <td>���� �⵵</td>
                     <td>�ŷ� �⵵</td>
                     <td>��</td>
                     <td>��</td>
                     <td>���</td>
                     <td>��</td>
                  </tr>

                  <%for (int i = 0; i < DongSearchList.size(); i++) {%>
                  <tr>
                     <td><input type="checkbox" value=""></td>
                     <td><%=i + 1%></td>
                     <td><%=DongSearchList.get(i).getMaemae_num()%></td>
                     <td><%=DongSearchList.get(i).getApt_name()%></td>
                     <td><%=DongSearchList.get(i).getDong()%></td>
                     <td><%=DongSearchList.get(i).getPrice()%></td>
                     <td><%=DongSearchList.get(i).getBuild_year()%></td>
                     <td><%=DongSearchList.get(i).getYear()%></td>
                     <td><%=DongSearchList.get(i).getMonth()%></td>
                     <td><%=DongSearchList.get(i).getDay()%></td>
                     <td><%=DongSearchList.get(i).getApt_size()%></td>
                     <td><%=DongSearchList.get(i).getFloor()%></td>
                  </tr>

                  <%}%>
               </table>
               <%}%>

               <%AptSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("AptSearchList");
               if (AptSearchList != null) {
                  System.out.print("����Ʈ ����!");%>
               <table>
                  <tr>
                     <td>���ã��</td>
                     <td>��ȣ</td>
                     <td>�Ÿ� ��ȣ</td>
                     <td>����Ʈ �̸�</td>
                     <td>�� �̸�</td>
                     <td>����</td>
                     <td>���� �⵵</td>
                     <td>�ŷ� �⵵</td>
                     <td>��</td>
                     <td>��</td>
                     <td>���</td>
                     <td>��</td>
                  </tr>

                  <%for (int i = 0; i < AptSearchList.size(); i++) {%>
                  <tr>
                     <td><input type="checkbox" value="1"></td>
                     <td><%=i + 1%></td>
                     <td><%=AptSearchList.get(i).getMaemae_num()%></td>
                     <td><%=AptSearchList.get(i).getApt_name()%></td>
                     <td><%=AptSearchList.get(i).getDong()%></td>
                     <td><%=AptSearchList.get(i).getPrice()%></td>
                     <td><%=AptSearchList.get(i).getBuild_year()%></td>
                     <td><%=AptSearchList.get(i).getYear()%></td>
                     <td><%=AptSearchList.get(i).getMonth()%></td>
                     <td><%=AptSearchList.get(i).getDay()%></td>
                     <td><%=AptSearchList.get(i).getApt_size()%></td>
                     <td><%=AptSearchList.get(i).getFloor()%></td>
                  </tr>

                  <%}%>
               </table>
               <%}%>
            </div>

            <!-- �� ���� -->
            <div id="junwall">
               <h1>�� ����</h1>
               <form action="RentSearchService.do" method="post">
                  <!-- radio�� �� -->
                  ����Ʈ<input type="radio" name="table" value="apt_name"> 
                  ��<input type="radio" name="table" value="dong"> 
                     �˻� : <input type="text" name="rent_search"> 
                     <input type="submit" value="�˻�">
               </form>

               <!--  <img class="d-block img-fluid" src="./img/white-img.jpg" alt="First slide"> �̹��� ���� �ִ� ��-->


               <div id="row">
                  <%RentSearchList = (ArrayList<Rent_searchDTO>) session.getAttribute("RentSearchList");
                  if (RentSearchList != null) {%>
                  <table>
                     <tr>
                        <td>���ã��</td>
                        <td>��ȣ</td>
                        <td>��</td>
                        <td>���� ��ȣ</td>
                        <td>������</td>
                        <td>����</td>
                        <td>����Ʈ �̸�</td>
                        <td>���� �⵵</td>
                        <td>�ŷ� �⵵</td>
                        <td>��</td>
                        <td>��</td>
                        <td>�� ��</td>
                        <td>��</td>
                     </tr>
                     <%for (int i = 0; i < RentSearchList.size(); i++) {%>
                     <tr>
                        <td><input type="checkbox" value=""></td>
                        <td><%=i + 1%></td>
                        <td><%=RentSearchList.get(i).getDong()%></td>
                        <td><%=RentSearchList.get(i).getBuild_year()%></td>
                        <td><%=RentSearchList.get(i).getDeposit()%></td>
                        <td><%=RentSearchList.get(i).getLoyer()%></td>
                        <td><%=RentSearchList.get(i).getApt_name()%></td>
                        <td><%=RentSearchList.get(i).getBuild_year()%></td>
                        <td><%=RentSearchList.get(i).getYear()%></td>
                        <td><%=RentSearchList.get(i).getMonth()%></td>
                        <td><%=RentSearchList.get(i).getDate()%></td>
                        <td><%=RentSearchList.get(i).getApt_size()%></td>
                        <td><%=RentSearchList.get(i).getFloor()%></td>
                     </tr>

                     <%}%>
                  </table>
                  <%}%>

               </div>
            </div>

            <!-- ���� -->

            <div id="mat">
               <h1>����</h1>
               <form action="MatSearchService.do" method="post">
                  <select name="mat_select">
                     <option value="crime">������ ��</option>
                     <option value="charge">������ ������</option>
                     <option value="subway">����ö</option>
                     <option value="coffee">��Ÿ����</option>
                     <option value="movie">��ȭ��</option>
                  </select> ������ �˻� : <input type="text" name="mat_search"> 
                     <%if(info != null){%>
                  <input type="submit" value="�˻�">
                  <%}else{%>
                     �α����Ͽ� �˻���� �������.
                  <%}%>
                  
               </form>

               <!--  <img class="d-block img-fluid" src="./img/white-img.jpg" alt="First slide"> �̹��� ���� �ִ� ��-->

               <%mat_select = (String) session.getAttribute("mat_select");
               System.out.print("mat_select"+mat_select);
               MatSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("mat_search");
               if (MatSearchList != null) {%>
               <table>
                  <tr>
                     <td>���ã��</td>
                     <td>��ȣ</td>
                     <%if (mat_select.equals("crime")) {%>
                     <td>������ ��</td>
                     <%}%>
                     <%if (mat_select.equals("charge")) {%>
                     <td>������ ������</td>
                     <%}%>
                     <%if (mat_select.equals("subway")) {%>
                     <td>����ö</td>
                     <%}%>
                     <%if (mat_select.equals("coffee")) {%>
                     <td>��Ÿ����</td>
                     <%}%>
                     <%if (mat_select.equals("movie")) {%>
                     <td>��ȭ��</td>
                     <%}%>
                     <td>�Ÿ� ��ȣ</td>
                     <td>��</td>
                     <td>����</td>
                     <td>����⵵</td>
                     <td>�̸�</td>
                     <td>�ŷ� �⵵</td>
                     <td>��</td>
                     <td>��</td>
                     <td>�� ��</td>
                     <td>��</td>
                  </tr>
                  <%for (int i = 0; i < MatSearchList.size(); i++) {%>
                  <tr>
                     <td><input type="checkbox" value=""></td>
                     <td><%=i + 1%></td>
                     <%if (mat_select.equals("crime")) {%>
                     <td><%=MatSearchList.get(i).getCrime()%></td>
                     <%}%>
                     <%if (mat_select.equals("charge")) {%>
                     <td><%=MatSearchList.get(i).getCharge()%></td>
                     <%}%>
                     <%if (mat_select.equals("subway")) {%>
                     <td><%=MatSearchList.get(i).getSubway()%></td>
                     <%}%>
                     <%if (mat_select.equals("coffee")) {%>
                     <td><%=MatSearchList.get(i).getStarbucks()%></td>
                     <%}%>
                     <%if (mat_select.equals("movie")) {%>
                     <td><%=MatSearchList.get(i).getMovie()%></td>
                     <%}%>

                     <td><%=MatSearchList.get(i).getMaemae_num()%></td>
                     <td><%=MatSearchList.get(i).getDong()%></td>
                     <td><%=MatSearchList.get(i).getPrice()%></td>
                     <td><%=MatSearchList.get(i).getBuild_year()%></td>
                     <td><%=MatSearchList.get(i).getApt_name()%></td>
                     <td><%=MatSearchList.get(i).getYear()%></td>
                     <td><%=MatSearchList.get(i).getMonth()%></td>
                     <td><%=MatSearchList.get(i).getDay()%></td>
                     <td><%=MatSearchList.get(i).getApt_size()%></td>
                     <td><%=MatSearchList.get(i).getFloor()%></td>

                  </tr>

                  <%}%>
               </table>
               <%}%>

            </div>

            <!-- ���� -->

          <!-- �Ӵ� ����Ʈ -->
				<div id="imdae" class="raw">
				<br><br>
					<h5>�Ӵ����Ʈ�� ��ȸ�غ�����!</h5><br>
					<form action="ImdaeSearchService.do" method="post">
					
			<!-- �ɼǼ��� -->
			<select class='SelectSearch' name="search_type">
				<option value='dong'>������</option>
				<option value='region'>��</option>
			</select>
			<span class='green_window'>
				<input type="text" class='input_text' name="imdae_search" onkeydown="enterSearch()"
						placeholder="�˻�� �Է��ϼ���">
			</span>
				<button type="submit" class="sch_smit">�˻�</button>
			</form>
			
         <!-- ������ ��ȸ�ϱ� -->
         <%ImdaeSearchList = (ArrayList<ImdaeSearchDTO>) session.getAttribute("ImdaeSearchList");
         if (ImdaeSearchList != null) {%>

         <table>
            <thead>
            <tr>
               <th>��ȣ</th>
               <th>�Ӵ��ȣ</th>
               <th>������</th>
               <th>������</th>
               <th>����Ʈ��</th>
               <th>�Ӵ�ũ��</th>
               <th>������</th>
               <th>����</th>
               <th>�� �����</th>
               <th>�����</th>
               <th>�Ӵ�����</th>
               <th>��������</th>
            </tr>
         </thead>
         
         <%if (ImdaeSearchList.size() == 0) {%>
							<tr>
								<td colspan=12>�Ź��� �����ϴ�.</td>
							</tr>
							<%}%>
         <tbody>
            <%for (int i = 0; i < ImdaeSearchList.size(); i++) {%>
            <tr>
               <th><%=i + 1%></th>
               <td><%=ImdaeSearchList.get(i).getImdae_num()%></td>
               <td><%=ImdaeSearchList.get(i).getRegion()%></td>
               <td><%=ImdaeSearchList.get(i).getDong()%></td>
               <td><%=ImdaeSearchList.get(i).getImdae_name()%></td>
               <td><%=ImdaeSearchList.get(i).getImdae_size()%></td>
               <td><%=ImdaeSearchList.get(i).getDeposit()%></td>
               <td><%=ImdaeSearchList.get(i).getMonth_pay()%></td>
               <td><%=ImdaeSearchList.get(i).getTotal_cnt()%></td>
               <td><%=ImdaeSearchList.get(i).getCnt()%></td>
               <td><%=ImdaeSearchList.get(i).getImdae_div()%></td>
               <td><%=ImdaeSearchList.get(i).getMove_into_date()%></td>
            </tr>
            <%}%>
            </tbody>
         </table>
      <%}%>
            </div>

         </div>
         <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

   </div>
				
	
	<br>
	<br>
	<br>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./vendor/jquery/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$('#fake').click(function(){
		alert('�α��������ּ���');
	});
	$('#fake1').click(function(){
		alert('�α��������ּ���');
	});
	$('#fake2').click(function(){
		alert('�α��������ּ���');
	});
		
	</script>

</body>

</html>