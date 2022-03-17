<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="${itemInfo.item_tag_main}/${itemInfo.item_code }/${itemSizeSummary}">
	<input type="hidden" value="${itemInfo.item_code }" class="saveItemCode">
	<input type="hidden" value="${itemInfo.item_tag_main }" class="saveTagMain">
	<input type="hidden" value="${itemPrice }" class="savePrice">
	<input type="hidden" value="${itemInfo.item_name }" class="saveItemName">
	<input type="hidden" value="${itemSize }" class="saveItemSize">
	<input type="hidden" value="${itemSizeSummary }" class="saveitemSizeSummary">
	<input type="hidden" value="${itemPriceSub }" class="savePriceSub">
	<input type="hidden" value="1" class="saveDisposable">
	<input type="hidden" value="1" class="saveitemQuantity">
</div>