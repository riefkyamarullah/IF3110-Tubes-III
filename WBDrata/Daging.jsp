<%
	int jumlahdaging = 0;
	if (session.getAttribute("jumlahdaging")!=null){
	}else{
		response.sendRedirect("getdaging");
	}
	
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Daging</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		
		<!-- Navbar Section -->
		<p id="bbuy-a"> Products in "Daging" Category</p>
		<form method=post action="getdaging">
			<select name="sort">
				<option value = "urutkan">--urutkan--</option>
				<option value = "namabarang">nama</option>
				<option value = "harga">harga</option>
			</select>
			<input type=submit value="OK">
		</form>

		<!-- End of Navbar -->
		
		<div id="dagangan">
			
			<!-- Dagangan Baris 1 -->
			<div class="frame">
			
			<%String str ="";
			int test = (Integer)session.getAttribute("jumlahdaging");
			if (test>Integer.parseInt(request.getParameter("l"))){
				test = Integer.parseInt(request.getParameter("l"));
			}
			for (int i =Integer.parseInt(request.getParameter("f"));i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("dnama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("dnama"+i)%>"><%str =(String)session.getAttribute("dnama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("dharga"+i);out.print(intr);%> /kg</p>
							
							<div class="frame buy-bar">
								<form action="CartController" method="post" onsubmit="return validatejumlah('<%out.print((String)session.getAttribute("dnama"+i));%>','<%out.print("cartJumProduk"+i);%>')" accept-charset='UTF-8'>
								<input class="kolom-9 buy-box" type="text" id='<%str =(String)session.getAttribute("dnama"+i);out.print(str);%>' name="cartQuantity" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
								<input type="hidden" name="action" value="add">
								<input type="hidden" value="getdaging" name="pageasal">
								<input type="hidden" value="" name="cartDetail">
								<input type="hidden" value="<%out.print((String)session.getAttribute("dnama"+i));%>" name="cartNama">
								<input type="hidden" value="<%out.print((Integer)session.getAttribute("dharga"+i));%>" name="cartHarga">
								<input type="hidden" value="<%out.print((Integer)session.getAttribute("djumlah"+i));%>" id="<%out.print("cartJumProduk"+i);%>" name="cartJumProduk">
								<input type="hidden" value="<%out.print((String)session.getAttribute("dkategori"+i));%>" name="cartKategori">
								<button class="kolom-1 buy-button" type="submit" ></button>
							</form>
							</div>
							
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			<!--End of Dagangan-->				
		</div>
		
		<div id="pagination">
			<ul>
				<%String n = ""+(Integer.parseInt(request.getParameter("f")));
				  String m = ""+(Integer.parseInt(request.getParameter("l")));
				  String o = ""+(Integer.parseInt(request.getParameter("f")));
				  String p = ""+(Integer.parseInt(request.getParameter("l")));
				  if (Integer.parseInt(request.getParameter("f"))>10){
					  o = ""+(Integer.parseInt(request.getParameter("f"))-10);
					  p = ""+(Integer.parseInt(request.getParameter("l"))-10);
				   %>
					   
				 <% }
				 if (Integer.parseInt(request.getParameter("l"))<(Integer)session.getAttribute("jumlahdaging")){
					   n = ""+(Integer.parseInt(request.getParameter("f"))+10);
					   m = ""+(Integer.parseInt(request.getParameter("l"))+10);
				  %>
				  	
				 <% }%>
				 <li><a href="Daging.jsp?f=<%out.print(o);%>&amp;l=<%out.print(p);%>">&laquo;Previous</a></li>
				 <li><a href="Daging.jsp?f=<%out.print(n);%>&amp;l=<%out.print(m);%>">Next&raquo;</a></li>
				
				
			
			</ul>
		</div>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
		<script>
	function validatejumlah(nam,jum){
		alert(document.getElementById(nam).value+" "+document.getElementById(jum).value);
		if (+document.getElementById(nam).value<=+document.getElementById(jum).value){
			alert("sukses");
			return true;
		}else{
			alert("barang tidak cukup\nsisa : "+ document.getElementById(jum).value);
			return false;
		
		}
	
	}
	
	
	</script>
	
</body>
</html>