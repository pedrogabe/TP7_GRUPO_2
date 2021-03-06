<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_GRUPO_2.SeleccionarSucursales" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="styles.css" />
      <style type="text/css">
          .auto-style1 {
              width: 352px;
          }
          .auto-style2 {
              width: 212px;
          }
      </style>
  </head>
  <body>
    <form id="form1" runat="server">
        <header class="header">
		    <div classs="product-table-wrapper">
			    <table class="product-table">
				    <tr>
					    <td class="auto-style2">
    						<asp:Label ID="lblIntegrantes" runat="server" Text="N° Grupo 2:"></asp:Label>
    					</td>
    					<td class="auto-style1">
	    					<asp:HyperLink ID="hlListadoSucursales" runat="server" NavigateUrl="SeleccionarSucursales.aspx">Listado de sucursales</asp:HyperLink>
	    				</td>
	    				<td>
	    					<asp:HyperLink ID="hlMostrarSucursales" runat="server" NavigateUrl="ListadoSucursalesSeleccionadas.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
	    				</td>
	    			</tr>
	    		</table>
    		</div>
    	<table class="search-bar">
    		<tr>
	    		<td>
	    			<asp:Label ID="lblBusqueda" runat="server" Text="Busqueda nombre de sucursal:"></asp:Label>
		    	</td>
		    	<td>
		    		<asp:TextBox ID="txtBusqueda" runat="server" Width="255px"></asp:TextBox>
		    	</td>
		    	<td>
		    		<asp:Button ID="btnBusqueda" runat="server" Text="Buscar" OnClick="btnBusqueda_Click" />
		    	    <asp:CustomValidator ID="cvLimiteCaracteres" runat="server" ControlToValidate="txtBusqueda" EnableClientScript="False" ForeColor="Red" OnServerValidate="cvLimiteCaracteres_ServerValidate">*Error. Se superó el límite de texto</asp:CustomValidator>
		    	</td>
		    </tr>
	    </table>
        </header>
        <main class="main">
            <table>
        <tr>
          <td>
              <div class="main-table">
                  <asp:ListView ID="lvSucursales" runat="server" DataKeyNames="Id_Sucursal" DataSourceID="SqlDataSource1" GroupItemCount="3"><%--            
							<AlternatingItemTemplate>
								<td runat="server" style="background-color: #FFFFFF;color: #284775;">
									<asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' Font-Bold="True"> </asp:Label>
              <br />
              <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='
										<%# Eval("URL_Imagen_Sucursal") %>' Width="20%" />
              <br />
              <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>'>
              </asp:Label>
          </td>
          </AlternatingItemTemplate>--%> <EditItemTemplate>
            <td runat="server" class="col">Id_Sucursal:
              <asp:Label ID="Id_SucursalLabel1" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
              <br /> NombreSucursal:
              <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
              <br /> DescripcionSucursal:
              <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
              <br /> URL_Imagen_Sucursal:
              <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
              <br />
              <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
              <br />
              <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
              <br />
            </td>
          </EditItemTemplate>
          <EmptyDataTemplate>
            <table runat="server">
              <tr>
                <td>No se han devuelto datos.</td>
              </tr>
            </table>
          </EmptyDataTemplate>
          <EmptyItemTemplate>
            <td runat="server" />
          </EmptyItemTemplate>
          <GroupTemplate>
        <tr id="itemPlaceholderContainer" runat="server">
          <td id="itemPlaceholder" runat="server"></td>
        </tr>
        </GroupTemplate>
        <InsertItemTemplate>
          <td runat="server" style="">NombreSucursal:
            <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
            <br /> DescripcionSucursal:
            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
            <br /> URL_Imagen_Sucursal:
            <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
            <br />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
            <br />
          </td>
        </InsertItemTemplate>
        <ItemTemplate>
          <td runat="server" style="background-color: #E0FFFF;color: #333333;">
            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' Font-Bold="True">
            </asp:Label>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Width="20%" />
            <br />
            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>'>
            </asp:Label>
            <br />
            <br />
            <asp:Button ID="btnSeleccionar" runat="server" CommandArgument='<%# Eval("Id_Sucursal")+";"+Eval("NombreSucursal")+";"+Eval("DescripcionSucursal") %>' CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command" Text="Seleccionar" />
          </td>
        </ItemTemplate>
        <LayoutTemplate>
          <table runat="server">
            <tr runat="server">
              <td runat="server">
                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                  <tr id="groupPlaceholder" runat="server"></tr>
                </table>
              </td>
            </tr>
            <tr runat="server">
              <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                  <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                  </Fields>
                </asp:DataPager>
              </td>
            </tr>
          </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
          <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id_Sucursal:
            <asp:Label ID="Id_SucursalLabel" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
            <br />NombreSucursal:
            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
            <br />DescripcionSucursal:
            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
            <br />URL_Imagen_Sucursal:
            <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
            <br />
          </td>
        </SelectedItemTemplate>
        </asp:ListView>
              </div>
            
        </td>
        <td>
            <div class="provincias-wrapper">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
              <asp:Button ID="btnProvincia" CssClass="provincia-btn" runat="server" Text='<%# Eval("DescripcionProvincia") %>' CommandArgument='<%# Eval("Id_Provincia") %>' OnClick="btnProvincia_Click" />
              <br />
              <br />
            </ItemTemplate>
          </asp:DataList>
            </div>
        </td>
        </tr>
      </table>
      <asp:Label ID="lblMensaje" runat="server"></asp:Label>
      <br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursales %>" SelectCommand="SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal]">
      </asp:SqlDataSource>
      <br />
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" SelectCommand="SELECT [DescripcionProvincia], [Id_Provincia] FROM [Provincia]"></asp:SqlDataSource>
      </asp:SqlDataSource>
        </main>
      
    </form>
  </body>
</html>