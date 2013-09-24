#set($layout = '')
<form id="pagerForm" action="$appServer.get('/admin/role/indexAjax.htm')" method="post">
	<input type="hidden" name="pageNum" value="#if(${query.pageNum})${query.pageNum}#{else}1#end" /><!--【必须】value=1可以写死-->
	<input type="hidden" name="numPerPage" value="#if(${query.numPerPage})${query.numPerPage}#{else}20#end" /><!--【可选】每页显示多少条-->
	<input type="hidden" name="orderField" value="$!{query.orderField}" /><!--【可选】查询排序-->
    <input type="hidden" name="orderDirection" value="$!{query.orderDirection}" /><!--【可选】排序方式-->
    <!--【可选】其它查询条件，业务有关，有什么查询条件就加什么参数-->
	
                
    <input type="hidden" name="roleKey" value="$!{query.roleKey}"/>
    <input type="hidden" name="roleKey_bw" value="$!{query.roleKey_bw}"/>
    <input type="hidden" name="roleKey_cn" value="$!{query.roleKey_cn}"/>
            
    
                
    <input type="hidden" name="roleName" value="$!{query.roleName}"/>
    <input type="hidden" name="roleName_bw" value="$!{query.roleName_bw}"/>
    <input type="hidden" name="roleName_cn" value="$!{query.roleName_cn}"/>
            
    
</form> 


<div class="pageHeader">
    <form onsubmit="return navTabSearch(this,'dwz_tab_role');" action="$appServer.get('/admin/role/indexAjax.htm')" method="post">
        <input type="hidden" name="pageNum" value="#if(${query.pageNum})${query.pageNum}#{else}1#end" /><!--【必须】value=1可以写死-->
        <input type="hidden" name="numPerPage" value="#if(${query.numPerPage})${query.numPerPage}#{else}20#end" /><!--【可选】每页显示多少条-->
        <input type="hidden" name="orderField" value="$!{query.orderField}" /><!--【可选】查询排序-->
        <input type="hidden" name="orderDirection" value="$!{query.orderDirection}" /><!--【可选】排序方式-->
    
    <div class="searchBar">
        <ul class="searchContent">
            <li>
                <label>#dbMsg("Role.roleKey")：</label>
                    <input type="text" name="roleKey" value="$!{query.roleKey}" size="25"/>
            </li>
            <li>
                <label>#dbMsg("Role.roleName")：</label>
                    <input type="text" name="roleName" value="$!{query.roleName}" size="25"/>
            </li>
        </ul>
        <div class="subBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">#dbMsg("queryType.query")</button></div></div></li>
            </ul>
        </div>
    </div>
    </form>
</div>



<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="add" href="$appServer.get('/admin/role/addAjax.htm')" target="navTab" title="#dbMsg('function.add')#dbMsg('Role')" rel="dwz_tab_role_add"><span>#dbMsg("function.add")</span></a></li>
            <li><a href="$appServer.get('/admin/role/editAjax/{id}.htm')" target="navTab" class="edit" title="#dbMsg('function.edit')#dbMsg('Role')" rel="dwz_tab_role_edit" ><span>#dbMsg("function.edit")</span></a></li>
            <li class="line">line</li>
#*
            <li><a href="$appServer.get('/admin/role/delJson.htm')" target="selectedTodo" class="delete" title="确实要#dbMsg("function.delBatch")这些#dbMsg('Role')吗?"><span>#dbMsg("function.delBatch")</span></a></li>
*#
            <li><a href="$appServer.get('/admin/role/delJson/{id}.htm')" target="ajaxTodo" class="delete" title="你确定要#dbMsg("function.del")选择这条#dbMsg('Role')吗?"><span>#dbMsg("function.del")</span></a></li>
            <li class="line">line</li>
            ## <li><a class="icon" href="javascript:void(0);"><span>按钮</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138" nowrapTD="false">
        <thead>
        	<tr >
               <th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
               
               ##<th width="80" orderField="id" #if("$!{query.orderField}"=="id")class="$!{query.orderDirection}"#end >#dbMsg("Role.id")</th>
               <th width="160" orderField="roleKey" #if("$!{query.orderField}"=="roleKey")class="$!{query.orderDirection}"#end >#dbMsg("Role.roleKey")</th>
               <th  orderField="roleName" #if("$!{query.orderField}"=="roleName")class="$!{query.orderDirection}"#end >#dbMsg("Role.roleName")</th>
               
               <th width="120" >操作</th>
            </tr>
        </thead>
        <tbody>
	       #foreach($rs in $page.rows)
	       <tr target="id" rel="$!rs.id"> ## target="id" rel="$!rs.id" 这两个是用在AjaxURL中的占位({target})数据(rel)来源
                <td><input name="ids" value="$!rs.id" type="checkbox"></td>
	            
                ##<td> $!rs.id </td>
                <td>
                    #trimHtml($!rs.roleKey,120)
                </td>
                <td>
                    #trimHtml($!rs.roleName,120)
                </td>
        
	            <td >
                    <a href='$appServer.get("/admin/role/viewAjax/${rs.id}.htm?dwzId=dwz_tab_role_view_$!rs.id")' target="navTab" title="#dbMsg('function.view')#dbMsg('Role')[$!rs.id]" class="btnInfo"  rel="dwz_tab_role_view_$!rs.id" >#dbMsg("function.view")</a>
                    <a href='$appServer.get("/admin/role/editAjax/${rs.id}.htm?dwzId=dwz_tab_role_edit_$!rs.id")' target="navTab" title="#dbMsg('function.edit')#dbMsg('Role')[$!rs.id]" class="btnEdit"  rel="dwz_tab_role_edit_$!rs.id" >#dbMsg("function.edit")</a>
                    <a href='$appServer.get("/admin/role/delJson/${rs.id}.htm")' target="ajaxTodo" title="你确定要#dbMsg("function.del")这个#dbMsg('Role')[$!rs.id]吗?" class="btnDel">#dbMsg("function.del")</a>
                ## 如果有1对多,可加上查看多方列表按钮
                #*  
                    <a href='$appServer.get("/admin/roleMeta/indexAjax.htm").addQueryData("roleId","${rs.id}")' target="navTab" 
                        rel="dwz_tab_roleMeta" title="#dbMsg('function.view')#dbMsg('RoleMeta')[$!rs.id]" class="btnInfo">
                        #dbMsg('RoleMeta')</a>
                *#
                </td>
	        </tr>
	        #end
        </tbody>
    </table>
    #dwzPageBar($page "navTab") 
</div>

