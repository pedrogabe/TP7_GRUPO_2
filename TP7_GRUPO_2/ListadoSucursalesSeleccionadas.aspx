<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionadas.aspx.cs" Inherits="TP7_GRUPO_2.ListadoSucursalesSeleccionadas" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<link rel="stylesheet" href="styles.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<style type="text/css">
            .auto-style1 {
                width: 289px;
            }
            .auto-style2 {
                width: 237px;
            }
        </style>
	</head>
	<body>
		<form id="form1" runat="server">
			<header class="header">
				<div>
				<table>
					<tr>
						<td class="auto-style2">N° Grupo 2:</td>
						<td class="auto-style1">
							<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="SeleccionarSucursales.aspx">Listado de sucursales</asp:HyperLink>
						</td>
						<td>
							<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="ListadoSucursalesSeleccionadas.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
						</td>
					</tr>
				</table>
				<br />
			</div>
			</header>
			<main class="main">
				<table>
				<tr>
					<td><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Mostrar sucursales seleccionadas"></asp:Label>
					</td>
				</tr>
				<tr>
					<td>
						<asp:GridView ID="gvSucursalesSeleccionadas" runat="server"></asp:GridView>
					</td>
				</tr>
			</table>
			</main>
			
		</form>
	</body>
</html>