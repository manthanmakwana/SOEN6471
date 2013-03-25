﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LinqCouponAdmin.ascx.cs"
    Inherits="LINQControls_Admin_LinqCouponAdmin" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 163px;
    }
</style>
<h3>Coupons</h3>
<p></p>
Enter a negative number to give a discount. Enter a positive number to add money to an lc_Order.
<p></p>
<telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
    AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
    AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" DataSourceID="LinqDataSource1"
    GridLines="None" Skin="Vista">
    <MasterTableView CommandItemDisplay="Top" DataKeyNames="CouponID" DataSourceID="LinqDataSource1">
        <RowIndicatorColumn>
            <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn>
            <HeaderStyle Width="20px"></HeaderStyle>
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridBoundColumn DataField="CouponID" DataType="System.Int32" HeaderText="CouponID"
                ReadOnly="True" SortExpression="CouponID" UniqueName="CouponID" Visible="False">
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn HeaderText="CouponName" SortExpression="CouponName">
                <ItemTemplate>
                    <asp:Label ID="CouponNameLabel" runat="server" Text='<%# Eval("CouponName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CouponNameTextBox" runat="server" Text='<%# Bind("CouponName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CouponNameRequiredField" ControlToValidate="CouponNameTextBox"
                        runat="server" ErrorMessage="Coupon name is required." Text="*" ToolTip="Coupon name is required."></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="CouponCode" SortExpression="CouponCode">
                <ItemTemplate>
                    <asp:Label ID="CouponCodeLabel" runat="server" Text='<%# Eval("CouponCode") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="CouponCodeTextBox" runat="server" Text='<%# Bind("CouponCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CouponCodeRequiredField" ControlToValidate="CouponCodeTextBox"
                        runat="server" ErrorMessage="Coupon code is required." Text="*" ToolTip="Coupon code is required."></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridNumericColumn DataField="Amount" HeaderText="Amount" AllowFiltering="false"
                NumericType="Currency" UniqueName="Amount">
            </telerik:GridNumericColumn>
            <telerik:GridNumericColumn DataField="DiscountPercent" HeaderText="Percent" NumericType="Percent"
                DataFormatString="{0:p}" UniqueName="Percent">
            </telerik:GridNumericColumn>
            <telerik:GridTemplateColumn HeaderText="ExpireDate" SortExpression="ExpireDate">
                <ItemTemplate>
                    <asp:Label ID="ExpireDateLabel" runat="server" Text='<%# Eval("ExpireDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <telerik:RadDatePicker ID="ExpireDatePicker" runat="server" Skin="Vista" DbSelectedDate='<%# Bind("ExpireDate") %>'>
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="ExpireDateRequiredField" ControlToValidate="ExpireDatePicker"
                        runat="server" ErrorMessage="Expire date is required." Text="*" ToolTip="Expire date is required."></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="DateMade" SortExpression="DateMade">
                <ItemTemplate>
                    <asp:Label ID="DateMadeLabel" runat="server" Text='<%# Eval("DateMade", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <telerik:RadDatePicker ID="DateMadePicker" runat="server" Skin="Vista" DbSelectedDate='<%# Bind("DateMade") %>'>
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="DateMadeRequiredField" ControlToValidate="DateMadePicker"
                        runat="server" ErrorMessage="Date made is required." Text="*" ToolTip="Date made is required."></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </telerik:GridTemplateColumn>
        </Columns>
    </MasterTableView>
    <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <FilterMenu EnableTheming="True">
        <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
    </FilterMenu>
</telerik:RadGrid>
<asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="LinqCommerceDataContext"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="lc_CouponTables">
</asp:LinqDataSource>
<p>
</p>