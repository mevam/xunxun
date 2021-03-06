<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>试算平衡表</title>
<style type="text/css">
img {border-width: 0px 0px 0px 0px}
#middel{
	width:1340px;
}
#left{
	float:left;
}

#content{
	width:1200px;
}
#footer{
	width:1340px;
}
</style>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#queryButton').click(function(){
    		var queryForm = $('#queryForm');
    		queryForm.submit();
    	});
    });
    </script>
<script language="javascript" type="text/javascript" src="../js/dateSelect.js"></script>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="/WEB-INF/tiles/four-header.jsp" />
	</div>
	<div id="middel">
		<div id="left">
			<jsp:include page="/WEB-INF/tiles/four-left.jsp" />
		</div>
		<div id="content">
			
<div id="epMcContent" style="margin-bottom:10px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">试算平衡表</h3>
	<div class="tab">
		<form action="trialbalance-initial.htm" id="queryForm" name="queryForm" method="post">
		<table class="bugSteel first" style="border-top: 0;">
						<tr>
							<td class="twof">&nbsp;会计期间</td>
							<td class="twef" style="width:90px;"><input type="text" onclick="javascript:SelectDateYL(this,'yyyy-MM',0,-22)" style="width:90px;" id="accountPeriod" name="accountPeriod"/></td>
						<td style="width:40px">科目级次</td><td style="width:80px;"><select style="width:80px;" name="level"><option value="1">一级</option><option value="2">二级</option><option value="3">三级</option></select></td>
								<td class="twof">币别</td>
								<td class="fivf">
								<select id="currency" name="currency" style="width:100px;">
										<option value="CNY">人民币</option>
								</select>
								</td>		
						<td style="width: 80px"><span style="margin-left: 20px;">
						<input type="checkbox" style="margin-top:6px;" id="allCheckSelected" />
						<label for="allCheckSelected" style="position: relative; bottom: 5px;">无发生额不显示</label>
						</span></td>
						<td style="width:100px;">
						<input type="checkbox" style="margin-top:6px;" id="allCheckSelected" />
						<label for="allCheckSelected" style="position: relative; bottom: 5px;">无发生额且余额为0不显示</label>
						</td>
								
								<td class="tenf">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
									<input type="reset" value="清除" class="cancellation" />
								</td>
						</tr>
			</table>
	
			<table class="tableSteelSkmbw" style="margin-top:0px;">
              <tr class="title" style="border-right:1px #bfd2ed solid;" >
                <td class="fivf">会计科目</td>
                <td class="sixf">科目名称</td>
                <td class="fouf">期初借方</td>
                <td class="fouf">期初贷方</td>
                <td class="fouf">本期借方发生额</td>
                <td class="fouf">本期贷方发生额</td>
                <td class="fouf">期末借方</td>
                <td class="fivf" style="border-right:1px #09f solid">期末贷方</td>
              </tr>
              <c:forEach items="${listResult}" var="balance" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="fivf">&nbsp;${balance.subjectCode}</td>
                <td class="sixf">${balance.subjectName}</td>
                <td class="sixf"><c:if test="${balance.startBalanceDebit ==0}"></c:if><c:if test="${balance.startBalanceDebit !=0}"><fmt:formatNumber value="${balance.startBalanceDebit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf"><c:if test="${balance.startBalanceCredit ==0}"></c:if><c:if test="${balance.startBalanceCredit !=0}"><fmt:formatNumber value="${balance.startBalanceCredit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf"><c:if test="${balance.thisPeriodDebit ==0}"></c:if><c:if test="${balance.thisPeriodDebit !=0}"><fmt:formatNumber value="${balance.thisPeriodDebit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf"><c:if test="${balance.thisPeriodCredit ==0}"></c:if><c:if test="${balance.thisPeriodCredit !=0}"><fmt:formatNumber value="${balance.thisPeriodCredit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf"><c:if test="${balance.endBalanceDebit ==0}"></c:if><c:if test="${balance.endBalanceDebit !=0}"><fmt:formatNumber value="${balance.endBalanceDebit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf" style="border-right:1px #09f solid"><c:if test="${balance.endBalanceCredit ==0}"></c:if><c:if test="${balance.endBalanceCredit !=0}"><fmt:formatNumber value="${balance.endBalanceCredit}" pattern="#,#00.00#"/></c:if></td>
              </tr>
              </c:forEach>
              <tr class="jiacu">
                <td class="fivf">&nbsp;合计：</td>
                <td class="fivf"></td>
                <td class="sixf"><fmt:formatNumber value="${startDebit}" pattern="#,#0.00#"/></td>
                <td class="sixf"><fmt:formatNumber value="${startCredit}" pattern="#,#0.00#"/></td>
                <td class="sixf"><fmt:formatNumber value="${currentDebit}" pattern="#,#00.00#"/></td>
                <td class="sixf"><fmt:formatNumber value="${currentCredit}" pattern="#,#00.00#"/></td>
                <td class="sixf"><fmt:formatNumber value="${endDebit}" pattern="#,#00.00#"/></td>
                <td class="sixf" style="border-right:1px #09f solid"><fmt:formatNumber value="${endCredit}" pattern="#,#00.00#"/></td>
              </tr>
            </table>
        
	        <p style="padding-left:16px;line-height:30px; height:30px;">
          <input type="button" class="pageCutSmallBtnCheckout" id="input2" value="导出" />
		  </p>
		  </form>
	</div>
	</div>
	</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/WEB-INF/tiles/four-footer.jsp" />
	</div>
</div>

</body>
</html>
