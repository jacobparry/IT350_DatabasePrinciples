<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddItemModal.ascx.cs" Inherits="DungeonsDragons.Controls.Character.Modals.AddItemModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalAddItem" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Add Item</h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveItem">
                <table class="table table-striped" width="100%">


                    <tr>
                        <td>Item:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlItemList" CssClass="btn btn-sm" runat="server" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Quantity:
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateQuantity" ControlToValidate="txtQuantity" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>

                        </td>
                    </tr>

                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancelItem" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveItem" runat="server" Text="Save" OnClick="btnSaveItem_Click"
                CssClass="btn btn-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfCharacterID" runat="server" />
        </div>
    </div>
</div>
