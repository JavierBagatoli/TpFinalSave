<%@page import="logica.Venta"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Servicios</title>
	<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <!--El css me gusta, pero no termino poder cambiarlo a mi gusto -->
        <style>
            td {color: #000000;
                background-color:#DDDDDD;
            }
        </style>
	
</head>
        
    </head>
    <body>
        <div class="wrapper row1">
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left"> 
      <!-- ################################################################################################ -->
      <h1 class="logoname"><a href="../index.jsp">Turismo<span>a</span>rgentina</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="../index.jsp">Home</a></li>
        <li><a class="drop">Servicios</a>
          <ul>
            <li><a href="pages/gallery.html">Paquetes Turisticos</a></li>
            <li><a href="pages/full-width.html">Servicios</a></li>
          </ul>
        </li>
        <li><a class="drop">Empleados</a>
          <ul>
            <li><a href="Empleados.jsp">Alta Empleado</a></li>
            <li><a href="verEmpleados.jsp">Ver Empleados</a></li>
            <li><a href="verClientes.jsp">Ver Clientes</a></li>
            <li><a href="verClientes.jsp">Crear Servicio</a></li>
            <li><a href="verClientes.jsp">Ver Servicio</a></li>
          </ul>
        </li>
        <li><a href="#">Registrarse</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>        
        <article>
            <h1>Crear Venta</h1>
        </article>
            <form name="AltaVenta" action="../SvAltaVenta" method="POST">
                <%
                HttpSession misession = request.getSession();
                Venta venta = (Venta)  misession.getAttribute("venta");{
                %>
                <p>
                    <label>Cliente: </label>
                <select name="cliente">
                    <option><%=venta.getCliente().getNombre()+""+venta.getCliente().getApellido()%></option>
                    <% Controladora control = new Controladora();
                    List <Empleado> listaEmpleados = control.traerEmpleado();
                    List <Cliente> listaClientes = control.traerClientes();
                    List <Paquete> listaPaquete = control.traerPaquetes();
                    List <Servicio> listaServicios = control.traerServicios();
                                        
                    String servicio1 = "";
                    String servicio2 = "";
                    String servicio3 = "";
                    
                    for(int i = 0; i < venta.getServicios().size(); i++){
                        if (i == 0){
                                servicio1 = (venta.getServicios().get(0).getNombre());
                            }else if (i == 1){
                                servicio2 = (venta.getServicios().get(1).getNombre());
                            }else if (i == 2){
                                servicio3 = (venta.getServicios().get(3).getNombre());
                            }
                        }
                    
                    for(Cliente cliente : listaClientes) {
                    %>
                    <option><%=cliente.getEmail() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Vendedor: </label>
                <select name="vendedor">
                    <option><%=venta.getEmpleado().getNombre()+" "+venta.getEmpleado().getApellido() %></option>
                    <% 
                    for(Empleado empleado : listaEmpleados) {
                    %>
                    <option><%=empleado.getEmail() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Paquete: </label>
                <select name="paquete">
                    <option><%=venta.getPaquete().getCodigo_paquete() %></option>
                    <% 
                    for(Paquete paqueteB : listaPaquete) {
                    %>
                    <option><%=paqueteB.getCodigo_paquete()%></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio Nº1: </label>
                <select name="servicio1">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre()%></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio Nº2: </label>
                <select name="servicio2">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio Nº3: </label>
                <select name="servicio3">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                

            
                <button type="submit" class="btn">Crear Paquete</button>
                <%} %>
            </form>
    </body>
</html>
