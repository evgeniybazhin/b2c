<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- storefront page to loop through rootCategories property -->
<!-- Last modified: 1 May 07 by RM -->

<!-- this is a holder page for the chapter 3, Exercise 3 -->
<!-- for creating a page to display a category -->

<!-- Title: DynamusicB2C Category Page -->


<HTML>
  <HEAD>
    <TITLE>Dynamusic Category Page</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Dynamusic Category Page"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <jsp:include page="navbar.jsp" flush="true"></jsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" color="midnightblue">

<%-- Chapter 3, Exercise 3 --%>
<%-- Insert CategoryLookup droplet --%>

<dsp:droplet name="/atg/commerce/catalog/CategoryLookup"> 
   <dsp:param name="id" param="id"/>
   
   <dsp:oparam name="output">
   <dsp:param name="parentCategory" param="element"/>
   
   <!-- Chapter 4, Ex. 1: Send Item View Notification -->
   <dsp:droplet name="/atg/commerce/catalog/CategoryBrowsed">
   <dsp:param name="eventobject"  param="parentCategory"/>
   </dsp:droplet>
   
         <%-- Create Breadcrumb Trail --%>
                <dsp:droplet name="/atg/commerce/catalog/CatalogNavHistoryCollector">
                  <dsp:param name="navCount" param="navCount"/>
                  <dsp:param name="navAction" param="navAction"/>               
                  <dsp:param name="item" param="parentCategory"/>
                </dsp:droplet>
       <dsp:include page="breadcrumbs.jsp" flush="true"/><p>

<p>
<font face="Verdana,Geneva,Arial" size="+1" color="midnightblue">
Browse <dsp:valueof param="parentCategory.displayName"/><br>
</font>
<UL>
<%-- Display Child Categories as links --%>
<font face="Verdana,Geneva,Arial" color="midnightblue">
      <dsp:droplet name="/atg/dynamo/droplet/ForEach">
         <dsp:param name="array" param="parentCategory.childCategories"/>
         
         <dsp:oparam name="output">
         <dsp:param name="childCategory" param="element"/>
            <dsp:getvalueof id="templateURL" idtype="java.lang.String" param="childCategory.template.url">
               <li><dsp:a href="<%= templateURL %>">          
                  <dsp:param name="id" param="childCategory.repositoryId"/>
                  <!-- Add navigation information to link -->
		  <dsp:param name="navAction" value="push"/>
                  <dsp:param bean="/atg/commerce/catalog/CatalogNavHistory.navCount" name="navCount"/>
                  <dsp:valueof param="childCategory.displayName"/>
               </dsp:a>
            </dsp:getvalueof>
         </dsp:oparam>
      </dsp:droplet>
</UL><P>
<%-- Display Child Products as links --%>

   Products:<UL>
      <dsp:droplet name="/atg/dynamo/droplet/ForEach">
         <dsp:param name="array" param="parentCategory.childProducts"/>
         
         <dsp:oparam name="output">
         <dsp:param name="childProduct" param="element"/>
              
              <dsp:getvalueof id="templateURL" idtype="java.lang.String" param="childProduct.template.url">
               <li><dsp:a href="<%= templateURL %>"> 
                  <dsp:param name="id" param="childProduct.repositoryId"/>
                  <!-- Add navigation information to link -->
		  <dsp:param name="navAction" value="push"/>
                  <dsp:param bean="/atg/commerce/catalog/CatalogNavHistory.navCount" name="navCount"/>
                  <dsp:valueof param="childProduct.displayName"/>
               </dsp:a>	
              </dsp:getvalueof>
              
         </dsp:oparam>
      </dsp:droplet>
</UL>
</font>


</dsp:oparam></dsp:droplet>
</td></tr></table>
</BODY> </HTML>


</dsp:page>
