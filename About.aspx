<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;margin-right:100px; margin-left: 50px;margin-top: 50px;">
 <p style="font-weight:bold">Boutique Noir / Åbningstider</p>
<p>Hospitalsgade 3</p>
<p>8700 Horsens</p>
<p>tlf. 27 24 62 42</p>
<p>Mandag - Fredag 10.00 - 17.30</p>
<p>Lørdag 10.00 - 14.00</p>
<br />
<p style="font-weight:bold">Juleåbent</p>
<p>Frem til jul holder vi åbent til kl 18 på alle hverdage.</p>
<p>Søndagene 13/12 og 20/12 holder vi åbent kl 11-15.</p>
    
    </div>
       <div id="map" style="height:300px;width:900px;margin-top: 50px"></div>
    <script>
        function initMap() {
            var mapDiv = document.getElementById('map');
            var map = new google.maps.Map(mapDiv, {
                center: { lat: 55.860705, lng: 9.846314 },
                zoom: 15
            });
        }
    </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6vfttyb2AGkmJK0IZ5zKBg0YPeoXibfA&callback=initMap"
  type="text/javascript"></script>
   
    
</asp:Content>

