﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LinqShoppingCart.ascx.cs" Inherits="LINQControls_LinqShoppingCart" %>
<%@ Register Assembly="GCheckout" Namespace="GCheckout.Checkout" TagPrefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

        <h3><asp:Label ID="titleLabel" ForeColor="Black" runat="server" Text="Label"></asp:Label></h3>
        <br />
        <br />
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" 
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" 
            AutoGenerateColumns="False" AutoGenerateDeleteColumn="True" 
            AutoGenerateEditColumn="False" DataSourceID="LinqDataSource1" 
            GridLines="None" AllowSorting="True" Skin="Vista" 
            onitemupdated="RadGrid1_ItemUpdated" EnableLinqExpressions="false" ShowFooter="True" 
            >
<MasterTableView datakeynames="CartID,ProductID" 
                datasourceid="LinqDataSource1">
<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <telerik:GridBoundColumn DataField="CartID" HeaderText="CartID" ReadOnly="True" 
            SortExpression="CartID" UniqueName="CartID" Visible="False">
        </telerik:GridBoundColumn>
        <telerik:GridDropDownColumn DataField="ProductID" 
            DataSourceID="LinqDataSource2" HeaderText="Name" ListTextField="Name" 
            ListValueField="ProductID" ReadOnly="True" UniqueName="column">
        </telerik:GridDropDownColumn>
        <telerik:GridNumericColumn DataField="Quantity" HeaderText="Quantity" 
            NumericType="Number" UniqueName="Quantity1" DataType="System.Double">
        </telerik:GridNumericColumn>
        <telerik:GridBoundColumn DataField="DateAdded" DataType="System.DateTime" 
            HeaderText="DateAdded" ReadOnly="True" SortExpression="DateAdded" 
            UniqueName="DateAdded" Visible="False">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Price" DataFormatString="{0:c}" DataType="System.Double" 
            HeaderText="Price" ReadOnly="True" SortExpression="Price" 
            UniqueName="Price" Visible="True">
        </telerik:GridBoundColumn>
               <%-- <telerik:GridBoundColumn DataField="Color"
            HeaderText="Color" ReadOnly="True" SortExpression="Color" 
            UniqueName="Color" Visible="True">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Size" 
            HeaderText="Size" ReadOnly="True" SortExpression="Size" 
            UniqueName="Size" Visible="True">
        </telerik:GridBoundColumn>--%>

       <telerik:GridCalculatedColumn HeaderText="Subtotal" DataFormatString="{0:c}" UniqueName="TotalPrice" 
         DataType="System.Double"
         DataFields="Quantity, Price" Expression="{0}*{1}" FooterText="Total : " 
         Aggregate="Sum" />
    </Columns>
</MasterTableView>

            <ClientSettings EnableRowHoverStyle="True">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>

<FilterMenu EnableTheming="True">
<CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
</FilterMenu>
        </telerik:RadGrid>

<table width="100%">
    <tr>
<%--      <td class="style1">
      </td>
--%>      <td align="right">
        Check out using:
<p></p>
<cc1:GCheckoutButton ID="GCheckoutButton1" runat="server" OnClick="GCheckoutButton1_Click" />
<p></p>
or
<p></p>
<asp:ImageButton ID="PayPalButton" runat="server" ImageUrl="http://www.paypal.com/en_US/i/btn/x-click-but5.gif"
    OnClick="PayPalButton_Click" />
    <p></p>
<asp:Button ID="btnAuthorizeNetCheckout" runat="server" Text="Checkout" 
              onclick="btnAuthorizeNetCheckout_Click" />
              <br />
      </td>
    </tr>
  </table>
  <b><asp:Label ID="totalAmountLabel" runat="server"></asp:Label></b>
  <p></p>
    <telerik:RadTextBox ID="CouponTextBox" runat="server" Skin="Vista"></telerik:RadTextBox>
    <br />
<asp:Button ID="CouponButton" runat="server" Text="Add Coupon" 
    onclick="CouponButton_Click" />
    <br />
<br />
Add shipping to your Order:<br />
    <br />
    <telerik:RadComboBox ID="ShippingComboBox" Runat="server" 
    DataSourceID="ShippingDataSource" DataTextField="Name" 
    DataValueField="ShippingCost" Skin="Vista">
<CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
</telerik:RadComboBox>
<br />
<asp:Label ID="ShipLabel" runat="server"></asp:Label>
<asp:LinqDataSource ID="ShippingDataSource" runat="server" 
    ContextTypeName="LinqCommerceDataContext" TableName="lc_RegionShippingTables">
</asp:LinqDataSource>
    <br />
      <asp:Label ID="statusLabel" ForeColor="Red" runat="server" CssClass="style1" /><br />
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="LinqCommerceDataContext" EnableDelete="True" 
            EnableInsert="True" EnableUpdate="True" TableName="lc_ShoppingCarts" 
            Where="CartID == @CartID" ondeleted="LinqDataSource1_Deleted" 
    onupdated="LinqDataSource1_Updated">
            <WhereParameters>
                <asp:CookieParameter CookieName="BalloonShop_CartID" Name="CartID" 
                    Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="LinqCommerceDataContext" Select="new (ProductID, Name)" 
        TableName="lc_Products">
    </asp:LinqDataSource>
    <br />
