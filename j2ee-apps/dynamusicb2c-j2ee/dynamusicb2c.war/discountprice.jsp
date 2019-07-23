<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>
<dsp:page>

<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- Fragment for displaying a SKU's discounted price -->
<!-- Last modified: 1 May 07 by RM -->

<!-- Title: Discount Price Page -->

<%-- Chapter 5, Exercise 1 --%>

<dsp:droplet name="/atg/commerce/pricing/PriceItem">
  <dsp:param name="item" param="sku"/>
  <dsp:param name="product" param="product"/>
  
  <dsp:oparam name="output">
  <dsp:param name="pricedItem" param="element"/>
  	<dsp:droplet name="/atg/dynamo/droplet/Switch">
		<dsp:param param="pricedItem.priceInfo.onSale" name="value"/>
			<dsp:oparam name="true">
  				<b>Original Price:</b> <dsp:valueof converter="currency" param="pricedItem.priceInfo.salePrice">no price</dsp:valueof>
  			</dsp:oparam>
  			<dsp:oparam name="false">
			  	<b>Original Price:</b> <dsp:valueof converter="currency" param="pricedItem.priceInfo.listPrice">no price</dsp:valueof>
  			</dsp:oparam>
  	</dsp:droplet>
	, <b>*Your Price:</b> <dsp:valueof converter="currency" param="pricedItem.priceInfo.amount">no price</dsp:valueof>
  </dsp:oparam>
</dsp:droplet>

</dsp:page>

