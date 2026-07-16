<%@ Page Title="Movie Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="WebApplication1.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .mv-title { font-size: 1.1rem; font-weight: 700; color: #0E2540; margin-bottom: 14px; }
    .grid-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); margin-bottom: 20px; }
    .form-wrap { background: #fff; border-radius: 10px; padding: 16px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); max-width: 500px; }
    table     { font-size: 0.82rem !important; }
    th, td    { font-size: 0.82rem !important; padding: 6px 10px !important; }
    input[type=text] { font-size: 0.82rem !important; padding: 4px 8px !important; }
    .btn, input[type=submit], input[type=button] { font-size: 0.8rem !important; }
</style>

<main style="padding: 10px 0;">

    <!-- GRIDVIEW — List of all movies -->
    <div class="grid-wrap">
        <p class="mv-title">Movies List</p>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MOVIE_ID"
            DataSourceID="SqlDataSource1"
            CellPadding="4"
            ForeColor="#333333"
            GridLines="None"
            Width="100%">
            <AlternatingRowStyle BackColor="#F5F8FF" />
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" Font-Size="Small" />
            <RowStyle BackColor="#FAFCFF" Font-Size="Small" />
            <Columns>
                <asp:BoundField DataField="MOVIE_ID"     HeaderText="ID"           ReadOnly="True" />
                <asp:BoundField DataField="TITLE"        HeaderText="Title" />
                <asp:BoundField DataField="DURATION"     HeaderText="Duration" />
                <asp:BoundField DataField="LANGUAGE"     HeaderText="Language" />
                <asp:BoundField DataField="GENRE"        HeaderText="Genre" />
                <asp:BoundField DataField="RELEASEDATE"  HeaderText="Release Date" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;MOVIES&quot;"
            InsertCommand="INSERT INTO &quot;MOVIES&quot; (&quot;MOVIE_ID&quot;,&quot;TITLE&quot;,&quot;DURATION&quot;,&quot;LANGUAGE&quot;,&quot;GENRE&quot;,&quot;RELEASEDATE&quot;) VALUES (:MOVIE_ID,:TITLE,:DURATION,:LANGUAGE,:GENRE,:RELEASEDATE)"
            UpdateCommand="UPDATE &quot;MOVIES&quot; SET &quot;TITLE&quot;=:TITLE,&quot;DURATION&quot;=:DURATION,&quot;LANGUAGE&quot;=:LANGUAGE,&quot;GENRE&quot;=:GENRE,&quot;RELEASEDATE&quot;=:RELEASEDATE WHERE &quot;MOVIE_ID&quot;=:MOVIE_ID"
            DeleteCommand="DELETE FROM &quot;MOVIES&quot; WHERE &quot;MOVIE_ID&quot;=:MOVIE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIE_ID"    Type="Decimal" />
                <asp:Parameter Name="TITLE"       Type="String" />
                <asp:Parameter Name="DURATION"    Type="String" />
                <asp:Parameter Name="LANGUAGE"    Type="String" />
                <asp:Parameter Name="GENRE"       Type="String" />
                <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITLE"       Type="String" />
                <asp:Parameter Name="DURATION"    Type="String" />
                <asp:Parameter Name="LANGUAGE"    Type="String" />
                <asp:Parameter Name="GENRE"       Type="String" />
                <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                <asp:Parameter Name="MOVIE_ID"    Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <!-- DETAILS VIEW — Add new movie -->
    <div class="form-wrap">
        <p class="mv-title"> Add New Movie</p>
        <asp:DetailsView ID="DetailsView1" runat="server"
            AutoGenerateRows="False"
            DataKeyNames="MOVIE_ID"
            DataSourceID="SqlDataSource1"
            DefaultMode="Insert"
            Width="100%"
            CellPadding="4"
            Font-Size="Small"
            BorderColor="#CCCCCC"
            BorderWidth="1px">
            <HeaderStyle BackColor="#0E2540" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#1A5FA8" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="MOVIE_ID"    HeaderText="Movie ID"     ReadOnly="True" />
                <asp:BoundField DataField="TITLE"       HeaderText="Title" />
                <asp:BoundField DataField="DURATION"    HeaderText="Duration" />
                <asp:BoundField DataField="LANGUAGE"    HeaderText="Language" />
                <asp:BoundField DataField="GENRE"       HeaderText="Genre" />
                <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>

</main>
</asp:Content>